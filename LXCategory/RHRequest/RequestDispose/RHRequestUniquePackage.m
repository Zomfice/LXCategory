//
//  RHRequestUniquePackage.m
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/5/7.
//

#import <pthread/pthread.h>

#import "RHRequestUniquePackage.h"
#import "RHRequestCategory.h"
#import "RHRequestLogManager.h"

#define Lock() pthread_mutex_lock(&_lock)
#define Unlock() pthread_mutex_unlock(&_lock)

typedef NS_ENUM(NSUInteger, RHCacheQueryStatus) {
    RHCacheQuery_UnStart = 0,//没有开始查询
    RHCacheQuery_Querying,//正在查询
    RHCacheQuery_Finish//完成查询
};
typedef NS_ENUM(NSUInteger, RHRequestStartStatus) {
    RHRequestStatus_noCache = 0,//请求没有缓存
    RHRequestStatus_cacheNil,//缓存无过期但缓存是空的
    RHRequestStatus_timeOut,//缓存过期
    RHRequestStatus_valid//缓存有效
};

@protocol RHRequestPackageCacheDelegate <NSObject>

- (void)queryFinshWithData:(RHBaseRequest *)request;

@end

@interface RHRequestPackageCache : NSObject
/**
 代理
 */
@property (nonatomic, weak) id <RHRequestPackageCacheDelegate> delegate;

/**
 查询装填
 */
@property (nonatomic, assign) RHCacheQueryStatus  queryStatus;

/**
 请求发起时的状态
 */
@property (nonatomic, assign) RHRequestStartStatus status;

@property (nonatomic, strong) RHBaseRequest * request;

@property (nonatomic, copy) NSString * key;

@property (nonatomic, assign) RHDataPosition  position;
//缓存的数据，有可能为nil
@property (nonatomic, strong) id  data;

//查询数据
- (void)queryDataWithRequest:(RHBaseRequest *)request;

//缓存数据
- (void)saveData;

@end

@implementation RHRequestPackageCache

- (void)saveData{
    if (![self.request isCacheStatusValid]) {
        return;
    }
    RHBaseRequest *request = self.request;
    id data = nil;
    data = request.responseObject;
    NSString *key = self.key;
    if (data) {
        [[RHCache shareCache] setObject:data forKey:key withCacheType:request.cacheType diskTime:request.diskCacheTime memoryTime:request.memoryCacheTime isClear:request.isClearWhenDiskTimeOut];
        self.status = RHRequestStatus_valid;
    }else{
        [[RHCache shareCache] removeObjectForKey:key];
    }
    
}
- (void)queryDataWithRequest:(RHBaseRequest *)request{
    if (![request isCacheStatusValid]) {
        self.status = RHRequestStatus_noCache;
        return;
    }
    if (self.queryStatus == RHCacheQuery_UnStart) {
        self.request = request;
        self.key = [RHRequestTool requestCacheKey:request];
        self.queryStatus = RHCacheQuery_Querying;
        [self loadRequestCache];
    }
}

- (void)loadRequestCache{
    __weak typeof(self)weakSelf = self;
    RHBaseRequest *request = self.request;
    self.position = [[RHCache shareCache] containObjectKey:self.key withNewCacheType:request.cacheType diskTime:request.diskCacheTime memoryTime:request.memoryCacheTime isClear:request.isClearWhenDiskTimeOut cacheResult:RHCacheResultAll result:^(RHCacheResultStatus status) {
        __strong typeof(weakSelf)self = weakSelf;
        BOOL isNormal = status & self.request.cacheStatus;
        if (isNormal) {
            self.status = RHRequestStatus_valid;
        }else{
            self.status = RHRequestStatus_timeOut;
        }
    }];
    
    [self loadingCache];
}
- (void)loadingCache{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        id responseObject = [[RHCache shareCache] objectForKey:self.key position:self.position];
        self.queryStatus = RHCacheQuery_Finish;
        RHBaseRequest *request = self.request;
        
        request.originalResponseObject = responseObject;
        if (request.customData) {
            request.responseObject = request.customData(responseObject);
        }else{
            request.responseObject = responseObject;
        }
        self.data = responseObject;
        BOOL isValidateJson = [request validateJson];
        if (self.status == RHRequestStatus_valid) {
            if (isValidateJson) {
                [request requestDidSuccess];
            }else{
                self.data = nil;
                request.responseObject = nil;
                self.status = RHRequestStatus_cacheNil;
                [[RHRequestSessionManager shareManager] startWithRequest:request];
            }
        }else{
            if (!isValidateJson) {
                self.data = nil;
                request.responseObject = nil;
            }
            [self.delegate queryFinshWithData:request];
        }
    });
}
- (void)dealloc
{
    
}
@end
@interface RHRequestUniquePackage ()<RHRequestUniqueDelegate,RHRequestPackageCacheDelegate>{
    pthread_mutex_t _lock;
    BOOL _isAllCancelled;
}
@property (nonatomic, strong) NSMutableArray <RHBaseRequest *> * requests;
@property (nonatomic, strong) NSMutableArray <RHBaseRequest *>* cancelRequests;
@property (nonatomic, strong) NSMutableArray <RHBaseRequest *>* cacheRequests;
//最新的数据
@property (nonatomic, strong) RHRequestPackageCache * packageCache;
@property (nonatomic, assign) BOOL  isFinish;
@property (nonatomic, strong) RHBaseRequest * currentRequest;
@property (nonatomic, assign) NSInteger  currentIndex;
@property (nonatomic, assign) NSInteger  loadedCacheCount;
@property (nonatomic, assign) NSInteger  unloadCacheCount;
@property (nonatomic, assign) BOOL  isLastObject;


/**
 同步数据
 */
@property (nonatomic, assign) NSTimeInterval  currentTime;
@property (nonatomic, assign) NSUInteger  currentCount;
@end

@implementation RHRequestUniquePackage

- (void)addRequest:(RHBaseRequest *)request{
    if ([self.requests containsObject:request]) {
        return;
    }
    Lock();
    [self.requests addObject:request];
    Unlock();
    request.uniqueDelegate = self;
    [self.packageCache queryDataWithRequest:request];
    if ([request isCacheStatusValid]) {
        _unloadCacheCount ++;
        if (self.packageCache.queryStatus == RHCacheQuery_Finish) {
            [self loadCacheData:request];
        }else{
            Lock();
            [self.cacheRequests addObject:request];
            Unlock();
        }
    }
    
    if (_currentIndex == -1) {
        _currentIndex ++;
        [self packageWillStartRequest:request];
    }
}
- (void)loadCacheData:(RHBaseRequest *)request{
    
    dispatch_queue_t queue = request.queue;
    if (!queue) {
        queue = dispatch_get_main_queue();
    }
    
    __weak typeof(request)weakRequest = request;
    __weak typeof(self)weakSelf = self;
    dispatch_async(queue, ^{
        __strong typeof(weakRequest)request = weakRequest;
        __strong typeof(weakSelf)self = weakSelf;
        if (!self.packageCache.data) {
            [self cacheCountLoad:request];
            return;
        }
        if (!self) return;
        if (self.isSuccess) return;
        if (request.customData) {
            request.responseObject = request.customData( self.packageCache.data);
        }else{
            request.responseObject = self.packageCache.data;
        }
        if (request.loadCacheWhenFirstStart && request.sucess) {
            request.isCacheData = YES;
            request.sucess(request);
            request.isCacheData = NO;
        }
        [self cacheCountLoad:request];
    });
}
- (void)cacheCountLoad:(RHBaseRequest *)request{
    if ([request.delegate respondsToSelector:@selector(requestFirstCacheLoaded:)]) {
        [request.delegate requestFirstCacheLoaded:request];
    }
    self.loadedCacheCount ++;
    [self requestFailDeal:request];
}
#pragma mark - Delegate -
- (RHBaseRequest *)currentRequest{
    if (_currentIndex < self.requests.count) {
        return _requests[_currentIndex];
    }
    return [_requests  lastObject];
}

- (void)packageWillStartRequest:(RHBaseRequest *)request{
    if (self.packageCache.status == RHRequestStatus_valid || self.packageCache.status == RHRequestStatus_cacheNil) {
        return;
    }
    [self start:request];
}

- (void)start:(RHBaseRequest *)request{
    [[RHRequestSessionManager shareManager] startWithRequest:request];
    if ([self.delegate respondsToSelector:@selector(startRequestWithRequest:index:)]) {
        [self.delegate startRequestWithRequest:request index:self.currentIndex];
    }
    [self startRequestLog:request];
}

- (void)removeRequest:(RHBaseRequest *)request{
    Lock();
    NSInteger index = [_requests indexOfObject:request];
    Unlock();
    
    if (index == NSNotFound) return;
    
    Lock();
    [self.cancelRequests addObject:request];
    Unlock();
    if (index == _currentIndex) {
        if ([request.uniqueDelegate respondsToSelector:@selector(requestCancelled:)]) {
            [request.uniqueDelegate requestCancelled:request];
        }
    }
}


- (BOOL)isLastObject{
    if (!_isLastObject) {
        _isLastObject = [self isLastRequest];
    }
    return  _isLastObject;
}
- (BOOL)isLastRequest{
    return  _currentIndex + 1 == _requests.count || _isAllCancelled;;
}
- (void)removeRequestPackage{
    _isAllCancelled = YES;
    if (_requests.count > _currentIndex) {
        [self removeRequest:[_requests objectAtIndex:_currentIndex]];
    }
}

#pragma mark - RHRequestUnique -
- (void)requestFailed:(__kindof RHBaseRequest *)request{
    [self uniqueRequestRequest:request];
}

- (void)requestSuccessed:(__kindof RHBaseRequest *)request{
    self.isFinish = YES;
    if (!request.requestTask) {
//        NSLog(@"请求 缓存 ::::::成功 %@",[request.fullUrl lastPathComponent]);
    }else{
        
//        NSLog(@"请求 ::::::成功 %@",[request.fullUrl lastPathComponent]);
    }
    if (request.uniqueIdentity == 0) {
        Lock();
        NSArray *arr = _requests.copy;
        Unlock();
        for (RHBaseRequest *obj in arr) {
            if ([self.cancelRequests containsObject:obj]) {
                continue;
            }
            [obj requestSuccessDealWithRequest:request];
        }
    }else{
        [request requestSuccessDealWithRequest:request];
    }
    
    [self finish];
    [self packageFinish:request];
}



- (void)requestCancelled:(__kindof RHBaseRequest *)request{
    [request requestCancelDeal];
    [self uniqueRequestRequest:request];
}
- (void)uniqueRequestRequest:(RHBaseRequest *)request{
    
    if ([self isLastObject]) {
        self.isFinish = YES;
        [self requestFailDeal:request];
    }else{
        _currentIndex ++ ;
        Lock();
        RHBaseRequest *currentRequest = [_requests objectAtIndex:_currentIndex];
        Unlock();
        if ([self.cancelRequests containsObject:currentRequest]) {
            if ([currentRequest.uniqueDelegate respondsToSelector:@selector(requestCancelled:)]) {
                [currentRequest.uniqueDelegate requestCancelled:currentRequest];
            }
        }else{
            [self packageWillStartRequest:currentRequest];
        }
    }
}
- (void)requestFailDeal:(RHBaseRequest *)request{
    BOOL canBack = self.isFinish && self.unloadCacheCount == self.loadedCacheCount && ((self.packageCache.queryStatus == RHCacheQuery_Finish && self.loadedCacheCount > 0) || (self.packageCache.status == RHRequestStatus_noCache));
    if (canBack) {
        if (_requests.count > 0 && request.uniqueIdentity == 0) {
            Lock();
            NSArray *arr = _requests.copy;
            Unlock();
            for (RHBaseRequest *obj in arr) {
                if ([self.cancelRequests containsObject:obj]) {
                    continue;
                }
                [obj requestFailDealWithRequest:request];
            }
        }else{
            [request requestFailDealWithRequest:request];
        }
        [self finish];
        [self packageFinish:request];
    }
}

#pragma mark - 初始化 -
- (instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}
- (void)setup{
    
    pthread_mutex_init(&_lock, NULL);
    _isAllCancelled = NO;
    _currentIndex = -1;
    Weak;
    self.uploadProgress = ^(NSProgress * _Nonnull progress, CGFloat speed) {
        Strong;
        NSArray *array = self.requests.copy;
        for (RHBaseRequest *request in array) {
            if (request.uploadProgress) {
                request.uploadProgress(progress, speed);
            }
        }
    };
    self.downloadProgress = ^(NSProgress * _Nonnull progress, CGFloat speed) {
        Strong;
        NSArray *array = self.requests.copy;
        for (RHBaseRequest *request in array) {
            if (request.downloadProgress) {
                request.downloadProgress(progress, speed);
            }
        }
    };
}
- (void)dealloc
{
    [self.requests removeAllObjects];
    [self.cancelRequests removeAllObjects];
    [self.cancelRequests removeAllObjects];
}
#pragma mark - 同步设置 -
- (void)setProgress:(NSProgress *)progress{
    if (!self.uploadProgress && !self.downloadProgress) {
        return;
    }
    NSTimeInterval current = CACurrentMediaTime();
    if (self.currentTime == 0) {
        self.currentTime = CACurrentMediaTime();
        self.currentCount = progress.completedUnitCount;
    }else{
        if (current - self.currentTime >= 0.3) {
            NSUInteger count = progress.completedUnitCount;
            self.speed = (count - self.currentCount)/0.3;
            self.currentCount = count;
            self.currentTime = current;
        }
        if (self.uploadProgress) {
            self.uploadProgress(progress, progress.fractionCompleted == 1?0: self.speed);
        }else if (self.downloadProgress){
            self.downloadProgress(progress, progress.fractionCompleted == 1?0: self.speed);
        }
    }
    if (progress.fractionCompleted == 1) {
        self.currentTime = 0;
        self.speed = 0;
        self.currentTime = 0;
    }
}

- (NSURLSessionTask *)task{
    return self.currentRequest.requestTask;
}
- (void)setRequestData{
    RHBaseRequest *request = self.currentRequest;
    NSArray *array = @[@"responseJSONObject",@"responseData",@"responseString",@"originalResponseObject"];
    for (RHBaseRequest *otherRequest in self.requests) {
        if (otherRequest == request) continue;
        for (NSString *key in array) {
            id value = [request valueForKey:key];
            if (value) {
                [otherRequest setValue:value forKey:key];
            }
        }
    }
    [self packageCacheData];
}
#pragma mark - 懒加载 -
/**
 懒加载
 */
- (NSMutableArray<RHBaseRequest *> *)requests{
    if (!_requests) {
        _requests = [NSMutableArray array];
    }
    return _requests;
}
- (NSMutableArray<RHBaseRequest *> *)cancelRequests{
    if (!_cancelRequests) {
        _cancelRequests = [NSMutableArray array];
    }
    return _cancelRequests;
}
- (NSMutableArray<RHBaseRequest *> *)cacheRequests{
    if (!_cacheRequests) {
        _cacheRequests = [NSMutableArray array];
    }
    return _cacheRequests;
}
- (RHRequestPackageCache *)packageCache{
    
    if (!_packageCache) {
        _packageCache = [RHRequestPackageCache new];
        _packageCache.delegate = self;
    }
    return _packageCache;
}
- (NSString *)fullUrl{
    if (!_fullUrl) {
        RHBaseRequest *request = [_requests firstObject];
        _fullUrl = [RHRequestTool fullUrlPathWithRequest:request];
    }
    return _fullUrl;
}

- (void)packageFinish:(RHBaseRequest *)request{
    BOOL canBack = self.isFinish && self.unloadCacheCount == self.loadedCacheCount && ((self.packageCache.queryStatus == RHCacheQuery_Finish && self.loadedCacheCount > 0) || (self.packageCache.status == RHRequestStatus_noCache));
    
    if (canBack || self.isSuccess) {
        if ([self.delegate respondsToSelector:@selector(uniqueRequestFinished:)]) {
            [self.delegate uniqueRequestFinished:request];
        }
    }
}

#pragma mark - Cache代理 -

- (void)queryFinshWithData:(RHBaseRequest *)request{
    if (self.isSuccess) {
        return;
    }
//    NSLog(@"请求 ::::::第一次 %@",[request.fullUrl lastPathComponent]);
    Lock();
    NSArray *array = self.cacheRequests.copy;
    Unlock();
    for (RHBaseRequest *obj in array) {
        [self loadCacheData:obj];
    }
}

- (void)packageCacheData{
    _packageCache.request = self.currentRequest;
    [_packageCache saveData];
}
@end
