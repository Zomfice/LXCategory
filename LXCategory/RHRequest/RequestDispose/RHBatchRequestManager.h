//
//  RHBatchRequestManager.h
//  WisdomMember
//
//  Created by 麻小亮 on 2018/7/6.
//  Copyright © 2018年 ABLE. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RHBatchRequest, RHChainRequest;
@interface RHBatchRequestManager : NSObject
+ (RHBatchRequestManager *)shareManager;
- (void)addBatchRequest:(RHBatchRequest *)request;
- (void)removeRequest:(RHBatchRequest *)request;
@end
@interface RHChainRequestManager : NSObject
+ (RHChainRequestManager *)shareManager;
- (void)addChainRequest:(RHChainRequest *)request;
- (void)removeRequest:(RHChainRequest *)request;
@end
