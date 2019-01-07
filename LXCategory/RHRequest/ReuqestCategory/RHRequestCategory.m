//
//  RHRequestCategory.m
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/5/2.
//

#import "RHRequestCategory.h"
@implementation RHBaseRequest(RequestAccessory)

- (void)requestWillStartCallBack:(RHBaseRequest *)request{
    
}
- (void)requestDidStopCallBack:(RHBaseRequest *)request{
    
}
- (void)requestWillStopCallBack:(RHBaseRequest *)request{
    
}
- (void)requestDidError{
    
    if (self.cacheType == 0) {
        self.responseObject = nil;
    }
    if (self.uniqueDelegate) {
        if ([self.uniqueDelegate respondsToSelector:@selector(requestFailed:)]) {
            [self.uniqueDelegate requestFailed:self];
        }
    }else if (self.delegate){
        [self requestFailDealWithRequest:self];
    }
}
- (void)requestDidSuccess{
    self.uniqueDelegate.isSuccess = YES;
    self.error = nil;
    if (self.uniqueDelegate) {
        if ([self.uniqueDelegate respondsToSelector:@selector(requestSuccessed:)]) {
            [self.uniqueDelegate requestSuccessed:self];
        }
    }else{
        [self requestSuccessDealWithRequest:self];
    }
}
- (BOOL)isCacheStatusValid{
    return self.cacheType > 0 && self.cacheType < 3;
}
//请求完成处理
- (void)requestFailDealWithRequest:(RHBaseRequest *)request{
    self.runningStaus = RHRequestRunningStatus_finish_Failure;
    NSLog(@"错误：：request::::%@, %@",[self.fullUrl lastPathComponent], request.error);
    @autoreleasepool{
        [self requestFailedPreprocessor:self];
    }
    dispatch_queue_t queue;
    if (self.queue) {
        queue = self.queue;
    }else{
        queue = dispatch_get_main_queue();
    }
    dispatch_async(queue, ^{
        [self requestWillStopCallBack:self];
        
        [self requestFailedFilter:self];
        
        if (self.failure) {
            self.failure(self);
        }
        if ([self.delegate respondsToSelector:@selector(requestFailed:)]) {
            [self.delegate requestFailed:self];
        }
        [self requestDidStopCallBack:self];
        
        [self clearCompletionBlock];
    });
}
- (void)requestCancelDeal{
    //    NSLog(@"取消：：request::::%@",[obj.fullUrl lastPathComponent]);
    self.runningStaus = RHRequestRunningStatus_finish_Cancel;
    @autoreleasepool{
        [self requestCancelledPreprocessor:self];
    }
    dispatch_queue_t queue;
    if (self.queue) {
        queue = self.queue;
    }else{
        queue = dispatch_get_main_queue();
    }
    dispatch_async(queue, ^{
        [self requestWillStopCallBack:self];
        [self requestCancelledFilter:self];
        if (self.cancel) {
            self.cancel(self);
        }
        if ([self.delegate respondsToSelector:@selector(requestCancelled:)]) {
            [self.delegate requestCancelled:self];
        }
        [self requestDidStopCallBack:self];
        [self clearCompletionBlock];
        
    });
}
- (void)requestSuccessDealWithRequest:(RHBaseRequest *)request{
    self.runningStaus = RHRequestRunningStatus_finish_Success;
    @autoreleasepool{
        [self requestSuccessPreprocessor:self];
    }
    dispatch_queue_t queue;
    if (self.queue) {
        queue = self.queue;
    }else{
        queue = dispatch_get_main_queue();
    }
    dispatch_async(queue, ^{
        [self requestWillStopCallBack:self];
        [self requsetSuccessFilter:self];
        if (self.customData) {
            self.responseObject = self.customData(self.originalResponseObject);
        }else{
            self.responseObject = self.originalResponseObject;
        }
        if (self.sucess) {
            self.sucess(self);
        }
        if ([self.delegate respondsToSelector:@selector(requestSuccessed:)]) {
            [self.delegate requestSuccessed:self];
        }
        [self requestDidStopCallBack:self];
        [self clearCompletionBlock];
        
    });
}

@end


@implementation RHBatchRequest(RequestAccessory)
- (void)requestWillStartCallBack:(RHBaseRequest *)request{
    
}
- (void)requestDidStopCallBack:(RHBaseRequest *)request{
    
}
- (void)requestWillStopCallBack:(RHBaseRequest *)request{
    
}
@end
@implementation RHBaseRequest (chain)

- (RHBaseRequest *(^)(NSString *))r_baseUrl{
    Weak;
    return ^(NSString *baseUrl){
        Strong;
        self.baseUrl = baseUrl;
        return self;
    };
}

- (RHBaseRequest *(^)(NSString *))r_route{
    Weak;
    return ^(NSString *route){
        Strong;
        self.route = route;
        return self;
    };
}
- (RHBaseRequest *(^)(NSString *))r_path{
    Weak;
    return ^(NSString *path){
        Strong;
        self.path = path;
        return self;
    };
}
-(RHBaseRequest *(^)(RHRequestMethod))r_method{
    Weak;
    return ^(RHRequestMethod method){
        Strong;
        self.method = method;
        return self;
    };
}
- (RHBaseRequest *(^)(dispatch_queue_t))r_queue{
    Weak;
    return ^(dispatch_queue_t queue){
        Strong;
        self.queue = queue;
        return self;
    };
}
- (RHBaseRequest *(^)(NSString *))r_downLoadPath{
    Weak;
    return ^(NSString *downLoadPath){
        Strong;
        self.downloadPath = downLoadPath;
        return self;
    };
}
- (RHBaseRequest *(^)(NSDictionary *))r_parasConvert{
    Weak;
    return ^(NSDictionary *parasConvert){
        Strong;
        self.parasConvert = parasConvert;
        return self;
    };
}
- (RHBaseRequest *(^)(NSInteger))r_uniqueIdentity{
    Weak;
    return ^(NSInteger tag){
        Strong;
        self.uniqueIdentity = tag;
        return self;
    };
}
- (RHBaseRequest *(^)(CGFloat))r_uniqueTimeOut{
    Weak;
    return ^(CGFloat time){
        Strong;
        self.uniqueTimeOut = time;
        return self;
    };
}
- (RHBaseRequest *(^)(NSTimeInterval))r_memoryTime{
    Weak;
    return ^(NSTimeInterval time){
        Strong;
        self.memoryCacheTime = time;
        return self;
    };
}
- (RHBaseRequest *(^)(NSTimeInterval))r_diskTime{
    Weak;
    return ^(NSTimeInterval time){
        Strong;
        self.diskCacheTime = time;
        return self;
    };
}
- (RHBaseRequest *(^)(AFSecurityPolicy *))r_security{
    Weak;
    return ^(AFSecurityPolicy *policy){
        Strong;
        self.securityPolicy = policy;
        return self;
    };
}
- (RHBaseRequest *(^)(NSString *))r_cacheName{
    Weak;
    return ^(NSString *name){
        Strong;
        self.cacheName = name;
        return self;
    };
}
- (RHBaseRequest *(^)(RHCacheResultStatus))r_legalStatus{
    Weak;
    return ^(RHCacheResultStatus status){
        Strong;
        self.cacheStatus = status;
        return self;
    };
}
- (RHBaseRequest *(^)(BOOL))r_loadCacheWhenFirstStart{
    Weak;
    return ^(BOOL loadCacheWhenFirstStart){
        Strong;
        self.loadCacheWhenFirstStart = loadCacheWhenFirstStart;
        return self;
    };
}
- (RHBaseRequest *(^)(r_data))r_customData{
    Weak;
    return ^(r_data data){
        Strong;
        self.customData = data;
        return self;
    };
}
- (RHBaseRequest *(^)(r_para))r_para{
    Weak;
    return ^(r_para para){
        Strong;
        if (para) {
            para(self.params);
        }
        return self;
    };
}

@end
