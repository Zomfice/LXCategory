//
//  RHRequestNetworkManager.h
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/5/7.
//

#import <Foundation/Foundation.h>
#import "RHRequestConfiguration.h"
@class RHBaseRequest, RHRequestConfiguration;
typedef void(^configure)(RHRequestConfiguration *configure);
@interface RHRequestNetworkManager : NSObject


+ (RHRequestNetworkManager *)shareManager;

@property (nonatomic, strong, readonly) RHRequestConfiguration * configuration;

/**
 配置项目

 */
- (void)configuredProject:(configure)configure;

/**
 添加请求
 */
- (void)addRequest:(RHBaseRequest *)request;

/**
 取消请求
 */
- (void)cancelRequest:(RHBaseRequest *)request;

/**
 取消所有请求
 */
- (void)cancelAllRequest;

- (void)cacelRequestPackage:(RHBaseRequest *)request;


@end
