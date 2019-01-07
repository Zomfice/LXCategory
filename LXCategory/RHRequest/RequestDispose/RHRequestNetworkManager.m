//
//  RHRequestNetworkManager.m
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/5/7.
//

#import "RHRequestNetworkManager.h"
#import "RHRequestUniquePackage.h"
#import <pthread/pthread.h>
#import "RHRequestCategory.h"
#define Lock() pthread_mutex_lock(&_lock)
#define Unlock() pthread_mutex_unlock(&_lock)

@interface RHRequestUniqueTime : NSObject{
    @package;
    NSTimeInterval _uniqueOutTime;
    NSTimeInterval _startTime;
}

@end
@implementation RHRequestUniqueTime

@end
static  NSString *const RHRequestValidationErrorDomain = @"com.rh.network";
@interface RHRequestNetworkManager ()<RHRequestPackageDelegate>{
    pthread_mutex_t _lock;
    dispatch_queue_t _queue;
}
@property (nonatomic, strong) NSMutableDictionary < NSString *,RHRequestUniquePackage *> * uniqueList;
@property (nonatomic, strong) NSMutableDictionary < NSString *, RHRequestUniqueTime *> * timeList;

@property (nonatomic, assign) NSTimeInterval autoTrimInterval;

@end
static RHRequestNetworkManager *_manager = nil;
@implementation RHRequestNetworkManager

- (void)addRequest:(RHBaseRequest *)request{
    NSString *indentifier = [self requestIndentityWithRequest:request];
    if (![self isValidRequest:request indentifier:indentifier]) {
        NSError * __autoreleasing error = nil;
        error = [NSError errorWithDomain:RHRequestValidationErrorDomain code:RHRequestValidErrorUrlFormat userInfo:@{NSLocalizedDescriptionKey : @"Invalid Url format"}];
        request.error = error;
        [request requestFailDealWithRequest:request];
        return;
    }
    Lock();
    RHRequestUniquePackage *package = self.uniqueList[indentifier];
    Unlock();
    if (package) {
        [package addRequest:request];
    }else{
        if (request.isUnique) {
            Lock();
            RHRequestUniqueTime *time = _timeList[indentifier];
            Unlock();
            if (time && CACurrentMediaTime() <= time -> _uniqueOutTime + time -> _startTime) {
                NSError * __autoreleasing error = nil;
                error = [NSError errorWithDomain:RHRequestValidationErrorDomain code:RHRequestValidErrorUniquedFormat userInfo:@{NSLocalizedDescriptionKey : @"Invalid Unique activate"}];
                request.error = error;
                [request requestFailDealWithRequest:request];
                return;
            }
            time = [RHRequestUniqueTime new];
            time -> _startTime = CACurrentMediaTime();
            time -> _uniqueOutTime = request.uniqueTimeOut;
            
            Lock();
            [self.timeList setValue:time forKey:indentifier];
            Unlock();
        }
        package = [RHRequestUniquePackage new];
        Lock();
        [self.uniqueList setValue:package forKey:indentifier];
        Unlock();
        package.delegate = self;
        [package addRequest:request];
    }
}

- (void)cancelRequest:(RHBaseRequest *)request{
    Lock();
    RHRequestUniquePackage *package = self.uniqueList[[self requestIndentityWithRequest:request]];
    Unlock();
    if (request.isExecuting) {
        [[RHRequestSessionManager shareManager] cancelWithRequest:request];
    }
    if (package) {
        if (request.isUnique) {
            [self cacelRequestPackage:request];
        }else{
            [package removeRequest:request];
        }
    }
}
- (void)cancelAllRequest{
    Lock();
    NSArray *allKeys = [_uniqueList allKeys];
    Unlock();
    if (allKeys.count > 0) {
        NSArray *array = allKeys.copy;
        for (NSString *key in array) {
            Lock();
            RHRequestUniquePackage *page = _uniqueList[key];
            Unlock();
            [page removeRequestPackage];
        }
    }
}
- (void)cacelRequestPackage:(RHBaseRequest *)request{
    NSString *indentity = [self requestIndentityWithRequest:request];
    Lock();
    RHRequestUniquePackage *package = _uniqueList[indentity];
    Unlock();
    [package removeRequestPackage];
    Lock();
    [_uniqueList removeObjectForKey:indentity];
    Unlock();
}
- (BOOL)isValidRequest:(RHBaseRequest *)request indentifier:(NSString *)indentifier{
    BOOL isValid = NO;
    if ([indentifier hasPrefix:@"http://"] || [indentifier hasPrefix:@"https://"]) {
        isValid = YES;
    }
    if (!isValid) {
        NSLog(@"检验url不合法");
    }
    return isValid;
}

- (NSString *)requestIndentityWithRequest:(RHBaseRequest *)request{
    NSString *string = [RHRequestTool jsonURLStringWithRequest:request];
    NSMutableString *str = [NSMutableString string];
    if (request.uniqueIdentity > 0) {
        [str appendFormat:@"-%ld", request.uniqueIdentity];
        if (request.uniqueTimeOut > 0) {
            [str appendFormat:@"timeOut%f",request.uniqueTimeOut];
        }
    }
    return [string stringByAppendingString:str.copy];
}


- (void)trimRecursively{
    __weak typeof(self)_self = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_autoTrimInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(_self)self = _self;
        [self trimInBackground];
        [self trimRecursively];
    });
}
- (void)trimInBackground{
    dispatch_async(_queue, ^{
        [self trimToTime];
    });
}
- (void)trimToTime{
    Lock();
    NSArray *keys = _timeList.allKeys.copy;
    Unlock();
    for (NSString *key in keys) {
        Lock();
        RHRequestUniqueTime *time = _timeList[key];
        Unlock();
        if (time -> _startTime + time -> _uniqueOutTime <= CACurrentMediaTime()) {
            Lock();
            [_timeList removeObjectForKey:key];
            Unlock();
        }
    }
}
#pragma mark - RHRequestPackageDelegate -

- (void)uniqueRequestFinished:(RHBaseRequest *)request{
    Lock();
    [_uniqueList removeObjectForKey:[self requestIndentityWithRequest:request]];
    Unlock();
}
- (void)startRequestWithRequest:(RHBaseRequest *)request index:(NSInteger)index{
    if (request.isUnique) {
        Lock();
        RHRequestUniqueTime *time = _timeList[[self requestIndentityWithRequest:request]];
        Unlock();
        if (time) {
            time -> _startTime = CACurrentMediaTime();
        }
    }
}
#pragma mark - 初始化 -
- (void)configuredProject:(configure)configure{
    RHRequestConfiguration * config = [RHRequestConfiguration new];
    configure(config);
    _autoTrimInterval = config.autoTrimInterval;
    [RHRequestSessionManager shareManager].configuration = config;
}

- (RHRequestConfiguration *)configuration{
    return [[RHRequestSessionManager shareManager] configuration];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    pthread_mutex_init(&_lock, NULL);
    _autoTrimInterval = 5;
    [self timeList];
    _queue = dispatch_queue_create("com.MrRHorse.networkManager", DISPATCH_QUEUE_SERIAL);
    [self trimRecursively];
}

/**
 懒加载
 */
- (NSMutableDictionary *)uniqueList{
    if (!_uniqueList) {
        _uniqueList = [NSMutableDictionary dictionary];
    }
    return _uniqueList;
}
- (NSMutableDictionary<NSString *,RHRequestUniqueTime *> *)timeList{
    if (!_timeList) {
        _timeList = [NSMutableDictionary dictionary];
    }
    return _timeList;
}
+ (RHRequestNetworkManager *)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [RHRequestNetworkManager new];
    });
    return _manager;
}
@end
