//
//  RHRequestUniquePackage.h
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/5/7.
//

#import <Foundation/Foundation.h>
#import "RHRequestSessionManager.h"

@protocol RHRequestPackageDelegate <NSObject>
- (void)uniqueRequestFinished:(RHBaseRequest *)request;
- (void)startRequestWithRequest:(RHBaseRequest *)request index:(NSInteger)index;
@end

@interface RHRequestUniquePackage : NSObject

@property (nonatomic, strong, readonly) NSMutableArray <RHBaseRequest *> * requests;
@property (nonatomic, assign, readonly) NSInteger  currentIndex;
@property (nonatomic, weak) id <RHRequestPackageDelegate> delegate;
@property (nonatomic, strong, readonly) RHBaseRequest * currentRequest;

//------------共同的数据

/**
 请求任务
 */
@property (nonatomic, strong) NSURLSessionTask * task;
/**
 请求结果二进制
 */
@property (nonatomic, strong) NSData *responseData;


/**
 请求结果字符串
 */
@property (nonatomic, strong) NSString *responseString;

/**
 请求的结果
 */
@property (nonatomic, strong) id responseObject;

/**
 请求原始
 */
@property (nonatomic, strong) id originalResponseObject;

/**
 请求结果的json对象
 */
@property (nonatomic, strong) id responseJSONObject;

@property (nonatomic, copy) RHURLSessionTaskProgressBlock  uploadProgress;

@property (nonatomic, copy) RHURLSessionTaskProgressBlock  downloadProgress;

/**
 网络请求错误信息
 */
@property (nonatomic, strong) NSError * error;

//上传或下载速度,字节为单位
@property (nonatomic, assign) CGFloat  speed;

- (void)setProgress:(NSProgress *)progress;

- (void)setRequestData;
//-------------------------------------------------------
/**
 请求是否成功
 */
@property (nonatomic, assign) BOOL  isSuccess;
/**
 url完整地址
 */
@property (nonatomic, copy) NSString * fullUrl;

/**
 添加请求
 */
- (void)addRequest:(RHBaseRequest *)request;

/**
 移除请求
 */
- (void)removeRequest:(RHBaseRequest *)request;


/**
 移除整个请求包
 */
- (void)removeRequestPackage;

- (void)packageFinish:(RHBaseRequest *)request;

@end
