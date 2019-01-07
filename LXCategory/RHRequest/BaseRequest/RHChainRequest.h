//
//  RHChainRequest.h
//  WisdomMember
//
//  Created by 麻小亮 on 2018/6/19.
//  Copyright © 2018年 ABLE. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RHBaseRequest, RHChainRequest;
@protocol RHChainRequestDelegate <NSObject>
@optional
- (void)chainRequestcomplete:(RHChainRequest *)chainRequest;
@end

typedef void (^ RHChainResultBlock) (RHChainRequest *chainRequest);
@interface RHChainRequest : NSObject

/**
 设置为YES，将会结束请求
 */
@property (nonatomic, assign) BOOL  isWillFinished;

/**
 请求列表
 */
@property (nonatomic, strong, readonly) NSMutableArray <RHBaseRequest *>* requests;

/**
 请求成功的index
 */
@property (nonatomic, strong, readonly) NSMutableArray <NSNumber *>* successRequests;


/**
 唯一标记，默认为0，若不为零则相同tag值得请求队列结束时才能进行下一个
 */
@property (nonatomic, assign) NSInteger  tag;
/**
 请求失败的index
 */
@property (nonatomic, strong, readonly) NSMutableArray <NSNumber *>* failRequests;


@property (nonatomic, strong, readonly) NSMutableArray <NSNumber *>* cancelRequests;

@property (nonatomic, copy) RHChainResultBlock completeBlock;

@property (nonatomic, weak) id <RHChainRequestDelegate> delegate;

- (void)addRequest:(RHBaseRequest *)request;

- (instancetype)initWithRequests:(NSArray <RHBaseRequest *>*)requests;

- (void)addRequests:(NSArray <RHBaseRequest *>*)requests;

- (void)stop;

- (void)start;

- (void)clearCompletionBlock;

/**
 开始并回调
 */
- (void)startCompletionBlockWithSuccess:(RHChainResultBlock)completeBlock;
/**
 完成回调
 */
- (void)setCompletionBlockWithSuccess:(RHChainResultBlock)completeBlock;

@end
