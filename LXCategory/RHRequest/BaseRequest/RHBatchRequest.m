

//
//  RHBatchRequest.m
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/4/30.
//

#import "RHBatchRequest.h"
#import "RHBaseRequest.h"
#import "RHRequestCategory.h"
#import <pthread/pthread.h>
#import "RHBatchRequestManager.h"
#import "RHBaseRequest.h"

#define Lock() pthread_mutex_lock(&_lock)
#define Unlock() pthread_mutex_unlock(&_lock)
@interface RHBatchRequest ()<RHRequestDelegate>{
    NSInteger _finishedCount;
    BOOL _isStart;
    NSInteger _cacheCount;
    BOOL _isfinish;
    pthread_mutex_t _lock;
}
/**
 请求列表
 */
@property (nonatomic, strong) NSMutableArray <RHBaseRequest *>* requests;

@property (nonatomic, assign) BOOL  isCacheData;

@property (nonatomic, strong) NSMutableArray <NSNumber *>* cancelRequests;

@property (nonatomic, strong) NSMutableArray <RHBaseRequest *> * finishedCacheRequests;
/**
 请求成功的index
 */
@property (nonatomic, strong) NSMutableArray <NSNumber *>* successRequests;

/**
 请求失败的index
 */
@property (nonatomic, strong) NSMutableArray <NSNumber *>* failRequests;

@end
@implementation RHBatchRequest

//初始化
- (RHBatchRequest *)initWithRequest:(NSArray *)requests{
    RHBatchRequest *request = [self init];
    [request addRequestArray:requests];
    return request;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        pthread_mutex_init(&_lock, NULL);
        _finishedCount = 0;
        _cacheCount = 0;
    }
    return self;
}
- (void)addRequestArray:(NSArray<RHBaseRequest *> *)requestArray{
    if (requestArray.count == 0 || ![requestArray isKindOfClass:[NSArray class]]) {
        return;
    }
    [self.requests addObjectsFromArray:requestArray];
    
}
- (void)addRequest:(RHBaseRequest *)request{
    [self.requests addObject:request];
}

- (void)startCompletionBlockWithSuccess:(RHBatchResultBlock)completeBlock{
    [self setCompleteBlock:completeBlock];
    [self start];
}

- (void)start{
    if (_isStart) {
        NSLog(@"batchRequest请求已经开始了");
        return;
    }
    if (self.requests.count == 0) {
        [self batchNetWorkComplete];
        return;
    }
    _isfinish = NO;
    _isStart = YES;
    _cacheCount = 0;
    [[RHBatchRequestManager shareManager] addBatchRequest:self];
    [self.finishedCacheRequests removeAllObjects];
    [self.failRequests removeAllObjects];
    [self.successRequests removeAllObjects];
    for (RHBaseRequest *request in _requests) {
        request.delegate = self;
        if ([request isCacheStatusValid]) {
            _cacheCount ++;
        }
        [request start];
    }
}

- (void)stop{
    [self clearRequest];
    [[RHBatchRequestManager shareManager] removeRequest:self];
}
- (void)setCompletionBlockWithSuccess:(RHBatchResultBlock)completeBlock{
    self.completeBlock = completeBlock;
}
- (void)clearCompletionBlock{
    self.completeBlock = nil;
}

- (void)dealloc
{
//    [self clearRequest];
    [self clearCompletionBlock];
//    NSLog(@"batchRequest销毁了");
}
- (void)clearRequest{
    for (RHBaseRequest *request in self.requests) {
        [request stop];
    }
}

#pragma mark - RHRequestDelegate -
- (void)requestFailed:(__kindof RHBaseRequest *)request{
    _finishedCount ++;
    Lock();
    [self.failRequests addObject:@([_requests indexOfObject:request])];
    Unlock();
    if (_finishedCount == _requests.count) {
        _isfinish = YES;
        [self batchCompleteAndRemove];
    }
    
    [self cacheRequestIsAdd:YES request:request];
}
- (void)requestCancelled:(__kindof RHBaseRequest *)request{
    _finishedCount ++;
    Lock();
    [self.cancelRequests addObject:@([_requests indexOfObject:request])];
    Unlock();
    if (_finishedCount == _requests.count) {
        _isfinish = YES;
        [self batchCompleteAndRemove];
    }
    
   [self cacheRequestIsAdd:NO request:request];
}
- (void)requestSuccessed:(__kindof RHBaseRequest *)request{
    
    _finishedCount ++;
    Lock();
    [self.successRequests addObject:@([_requests indexOfObject:request])];
    Unlock();
    if (_finishedCount == _requests.count) {
        _isfinish = YES;
        [self batchCompleteAndRemove];
    }
    
    [self cacheRequestIsAdd:YES request:request];
}

- (void)batchCompleteAndRemove{
    [self batchComplete];
    [[RHBatchRequestManager shareManager] removeRequest:self];
}
- (void)batchComplete{
    
        if (_completeBlock) {
            _completeBlock(self);
        }
        if ([_delegate respondsToSelector:@selector(batchRequestcomplete:)]) {
            [_delegate batchRequestcomplete:self];
        }
    
    
}
- (void)batchNetWorkComplete{
    [self batchComplete];
    _isStart = NO;
}

#pragma mark - Cache -
- (void)requestFirstCacheLoaded:(__kindof RHBaseRequest *)request{
    
    [self cacheRequestIsAdd:YES request:request];
}
- (void)batchCacheComplete{
    self.isCacheData = YES;
    [self batchComplete];
    self.isCacheData = NO;
}

- (void)cacheRequestIsAdd:(BOOL)isAdd request:(RHBaseRequest *)request{
    if (_isfinish) return;
    if (![request isCacheStatusValid]) return;
    Lock();
    BOOL isContain = [self.finishedCacheRequests containsObject:request];
    Unlock();
    if (isAdd) {
        if (isContain) return;
        Lock();
        [self.finishedCacheRequests addObject:request];
        Unlock();
    }else{
        if (!isContain) return;
        Lock();
        [self.finishedCacheRequests removeObject:request];
        Unlock();
        _cacheCount --;
    }
    if (_cacheCount == self.finishedCacheRequests.count) {
        [self batchCacheComplete];
    }
}

//懒加载
- (NSMutableArray<RHBaseRequest *> *)requests{
    if (!_requests) {
        _requests = [NSMutableArray array];
    }
    return _requests;
}
- (NSMutableArray<NSNumber *> *)successRequests{
    if (!_successRequests) {
        _successRequests = [NSMutableArray array];
    }
    return _successRequests;
}
- (NSMutableArray<NSNumber *> *)failRequests{
    if (!_failRequests) {
        _failRequests = [NSMutableArray array];
    }
    return _failRequests;
}
- (NSMutableArray<NSNumber *> *)cancelRequests{
    if (!_cancelRequests) {
        _cancelRequests = [NSMutableArray array];
    }
    return _cancelRequests;
}
- (NSMutableArray<RHBaseRequest *> *)finishedCacheRequests{
    if (!_finishedCacheRequests) {
        _finishedCacheRequests = [NSMutableArray array];
    }
    return _finishedCacheRequests;
}
@end

