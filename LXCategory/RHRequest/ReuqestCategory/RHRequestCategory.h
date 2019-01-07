//
//  RHRequestCategory.h
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/5/2.
//

#import <Foundation/Foundation.h>
#import "RHBaseRequest.h"
#import "RHBatchRequest.h"
#import "RHRequestUniquePackage.h"

typedef id(^r_data)(id data);
typedef void(^r_para)(NSMutableDictionary *params);

@interface RHBaseRequest (Setter)
@property (nonatomic, strong, readwrite) NSData *responseData;

@property (nonatomic, strong, readwrite) id responseJSONObject;

@property (nonatomic, strong, readwrite) id responseObject;

@property (nonatomic, strong, readwrite) NSString *responseString;

@property (nonatomic, strong, readwrite) NSError *error;

@property (nonatomic, strong, readwrite) NSURLSessionTask * requestTask;

@property (nonatomic, assign, readwrite) RHRequestRunningStatus runningStaus;

@property (nonatomic, strong, readwrite) id originalResponseObject;



@property (nonatomic, assign, readwrite) CGFloat  speed;

@property (nonatomic, assign, readwrite) BOOL  isCacheData;
@end

@interface RHRequestUniquePackage (Set)
- (void)packageCacheData;
@end
@interface RHBaseRequest (RequestAccessory)
- (void)requestWillStartCallBack:(RHBaseRequest *)request;
- (void)requestWillStopCallBack:(RHBaseRequest *)request;
- (void)requestDidStopCallBack:(RHBaseRequest *)request;
//请求失败
- (void)requestDidSuccess;
//请求成功
- (void)requestDidError;

/**
 是否是需要缓存
 */
- (BOOL)isCacheStatusValid;
//请求完成处理
- (void)requestFailDealWithRequest:(RHBaseRequest *)request;
- (void)requestCancelDeal;
- (void)requestSuccessDealWithRequest:(RHBaseRequest *)request;

@end

@interface RHBatchRequest (RequestAccessory)

- (void)requestWillStartCallBack:(RHBaseRequest *)request;
- (void)requestWillStopCallBack:(RHBaseRequest *)request;
- (void)requestDidStopCallBack:(RHBaseRequest *)request;

@end


