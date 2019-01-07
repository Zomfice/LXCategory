//
//  RHRequestSessionManager.h
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/5/4.
//

#import <Foundation/Foundation.h>
#import "RHBaseRequest.h"
#import "RHRequestConfiguration.h"
@interface RHRequestSessionManager : NSObject
+ (RHRequestSessionManager *)shareManager;
@property (nonatomic, strong) RHRequestConfiguration * configuration;

@property (nonatomic, strong, readonly) AFHTTPSessionManager * manager;

/**
 开始一个请求
 */

- (NSURLSessionTask *)startWithRequest:(RHBaseRequest *)request;

- (void)cancelWithRequest:(RHBaseRequest *)request;

- (NSString *)requestCacheKey:(RHBaseRequest *)request;

@end
