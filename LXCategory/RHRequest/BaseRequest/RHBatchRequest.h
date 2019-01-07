//
//  RHBatchRequest.h
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/4/30.
//

#import <Foundation/Foundation.h>
@class RHBatchRequest, RHBaseRequest;
/*
 请求多线程管理
 */
typedef void(^RHBatchResultBlock)(RHBatchRequest *batchRequest);


@protocol RHBatchRequestDelegate <NSObject>
@optional
- (void)batchRequestcomplete:(RHBatchRequest *)batchRequest;
@end
@interface RHBatchRequest : NSObject

- (RHBatchRequest *)initWithRequest:(NSArray *)requests;


/**
 请求列表
 */
@property (nonatomic, strong, readonly) NSMutableArray <RHBaseRequest *>* requests;

@property (nonatomic, weak) id <RHBatchRequestDelegate> delegate;

/**
 请求成功的index
 */
@property (nonatomic, strong, readonly) NSMutableArray <NSNumber *>* successRequests;

/**
 请求失败的index
 */
@property (nonatomic, strong, readonly) NSMutableArray <NSNumber *>* failRequests;

@property (nonatomic, strong, readonly) NSMutableArray <NSNumber *>* cancelRequests;

@property (nonatomic, assign, readonly) BOOL  isCacheData;

@property (nonatomic, copy) RHBatchResultBlock completeBlock;
/**
 添加请求
 */
- (void)addRequest:(RHBaseRequest *)request;

/**
 添加请求列表
 */
- (void)addRequestArray:(NSArray <RHBaseRequest *>*)requestArray;


/**
 开始并回调
 */
- (void)startCompletionBlockWithSuccess:(RHBatchResultBlock)completeBlock;
/**
 完成回调
 */
- (void)setCompletionBlockWithSuccess:(RHBatchResultBlock)completeBlock;

/**
 开始
 */
- (void)start;
/**
 停止
 */
- (void)stop;

/**
 清空回调
 */
- (void)clearCompletionBlock;

@end


