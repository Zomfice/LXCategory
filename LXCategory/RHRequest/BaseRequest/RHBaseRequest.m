//
//  RHBaseRequest.m
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/4/30.
//

#import "RHBaseRequest.h"
#import "RHRequestNetworkManager.h"
#import "RHRequestCategory.h"
#import "RHRequestUniquePackage.h"
#import "NSObject+YYModel.h"
#import "RHCache.h"
#import <pthread.h>


@interface RHBaseRequest (){

}
@property (nonatomic, strong, readwrite) NSData *responseData;
@property (nonatomic, strong, readwrite) id responseJSONObject;
@property (nonatomic, strong, readwrite) id responseObject;
@property (nonatomic, strong, readwrite) id originalResponseObject;
@property (nonatomic, strong, readwrite) NSString *responseString;
@property (nonatomic, strong, readwrite) NSError *error;
@property (nonatomic, strong, readwrite) NSURLSessionTask * requestTask;
@property (nonatomic, assign, readwrite) RHRequestRunningStatus  runningStaus;
@property (nonatomic, assign, readwrite) CGFloat  speed;
@property (nonatomic, assign, readwrite) BOOL  isCacheData;
@end
@implementation RHBaseRequest
- (id)copy{
    return [self yy_modelCopy];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cacheStatus = RHCacheResultNormarl;
        self.allowsCellularAccess = YES;
        _runningStaus = RHRequestRunningStatus_unStart;
        _requestTask = nil;
        self.validStatus = @[@(200), @(300)];
        _uniqueTimeOut = 1;
    }
    return self;
}
@synthesize params = _params;

- (NSMutableDictionary *)params{
    if (!_params) {
        _params = [NSMutableDictionary dictionary];
    }
    return _params;
}
- (NSHTTPURLResponse *)response{
    return (NSHTTPURLResponse *)self.requestTask.response;
}

- (NSURLRequest *)currentRequest{
    return self.requestTask.currentRequest;
}
- (NSURLSessionTask *)currentRequestTask{
    return self.uniqueDelegate.task;
}
- (NSDictionary *)responseHeaders{
    return self.response.allHeaderFields;
}

- (NSURLRequest *)originalRequest{
    return self.requestTask.originalRequest;
}
- (NSInteger)requestStatus{
    return self.response.statusCode;
}


- (BOOL)isValidReult{
    NSInteger status = self.requestStatus;
    NSInteger minStatus = MIN([[_validStatus lastObject] integerValue], [[_validStatus firstObject] integerValue]);
    NSInteger maxStatus = MAX([[_validStatus lastObject] integerValue], [[_validStatus firstObject] integerValue]);
    return status >= minStatus && status <= maxStatus;
}
- (BOOL)validateJson{
    if (!self.originalResponseObject) {
        return NO;
    }
    return YES;
}
- (BOOL)isUnique{
    return self.uniqueIdentity > 0 && self.uniqueTimeOut > 0;
}

- (BOOL)isCancelled{
    return self.runningStaus == RHRequestRunningStatus_finish_Cancel;
}

- (BOOL)isExecuting{
    return self.runningStaus == RHRequestRunningStatus_running;
}

- (BOOL)isFinshed{
    return self.runningStaus == RHRequestRunningStatus_finish_Cancel || self.runningStaus == RHRequestRunningStatus_finish_Failure || self.runningStaus == RHRequestRunningStatus_finish_Success;
}

- (BOOL)isFail{
    return self.runningStaus == RHRequestRunningStatus_finish_Failure;
}

- (BOOL)isUnstart{
    return self.runningStaus == RHRequestRunningStatus_unStart;
}



#pragma mark -method -
- (void)start{
    if ([self isExecuting]) return;
    [self requestWillStartCallBack:self];
    self.runningStaus = RHRequestRunningStatus_running;
    [[RHRequestNetworkManager shareManager] addRequest:self];
}
- (void)stop{
    [self requestWillStopCallBack:self];
    [[RHRequestNetworkManager shareManager] cancelRequest:self];
    [self requestDidStopCallBack:self];
}

- (void)clearCompletionBlock{
    _sucess = nil;
    _failure = nil;
}
- (void)setParams:(NSMutableDictionary *)params{
    if ([params isKindOfClass:[NSMutableDictionary class]]) {
        _params = params;
    }else if([params isKindOfClass:[NSDictionary class]]){
        _params = params.mutableCopy;
    }
}
#pragma mark - RequestFinish -
/**
 请求成功，在后台进程进行的操作
 */
- (void)requestSuccessPreprocessor:(RHBaseRequest *)request{
    
}

/**
 请求成功回调， 在主线程完成
 */
- (void)requsetSuccessFilter:(RHBaseRequest *)request{
    
}

/**
 请求失败，在后台进程进行的操作
 */
- (void)requestFailedPreprocessor:(RHBaseRequest *)request{
    
}

/**
 请求失败回调， 在主线程完成
 */
- (void)requestFailedFilter:(RHBaseRequest *)request{
    
}

/**
 请求取消，在后台进程进行的操作
 */
- (void)requestCancelledPreprocessor:(RHBaseRequest *)request{
    
}

/**
 请求取消回调， 在主线程完成
 */
- (void)requestCancelledFilter:(RHBaseRequest *)request{
    
}

- (void)setCompletionBlockWithSuccess:(RHBaseRequestCompletionBlock)success failure:(RHBaseRequestCompletionBlock)failure{
    self.sucess = success;
    self.failure = failure;
}


- (void)startCompletionBlockWithSuccess:(RHBaseRequestCompletionBlock)success failure:(RHBaseRequestCompletionBlock)failure{
    [self setCompletionBlockWithSuccess:success failure:failure];
    
    [self start];
}
- (void)dealloc{
    
//    NSLog(@"：：request::::销毁了%@",[self.fullUrl lastPathComponent]);
}
- (BOOL)isCustomCacheData{
//    return self.requestDataChange || [self respondsToSelector:@selector(requestCacheData)];
    return NO;
}
- (NSString *)description
{
    return [self yy_modelDescription];
}
- (NSString *)cacheKey{
    return [[RHRequestSessionManager shareManager] requestCacheKey:self];
}
- (NSString *)fullUrl{
    if (self.uniqueDelegate) {
        return self.uniqueDelegate.fullUrl;
    }
    return [RHRequestTool fullUrlPathWithRequest:self];
}

- (void)requestWillStart{
    
}
@end
