//
//  RHRequestDefines.h
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/5/7.
//

#ifndef RHRequestDefines_h
#define RHRequestDefines_h
#import "RHRequestTool.h"
#import "RHCache.h"
#import <QuartzCore/QuartzCore.h>
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#ifndef Weak
#define Weak  __weak __typeof(self) weakSelf = self
#endif

#ifndef Strong
#define Strong  __strong __typeof(weakSelf) self = weakSelf
#endif

typedef id(^r_data)(id data);
typedef void(^r_para)(NSMutableDictionary *params);

#ifndef RHCategoryChain
#define RHCategoryChain(_name_) \
@property (nonatomic, copy, readonly) _name_ * (^r_baseUrl) (NSString *baseUrl) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_route) (NSString *route) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_path) (NSString *path) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_method) (RHRequestMethod method) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_queue) (dispatch_queue_t queue) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_downLoadPath) (NSString *path) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_parasConvert) (NSDictionary *parasConvert) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_uniqueIdentity) (NSInteger identity) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_uniqueTimeOut) (CGFloat uniqueTimeOut) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_security) (AFSecurityPolicy *security) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_memoryTime) (NSTimeInterval time) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_diskTime) (NSTimeInterval time) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_cacheName) (NSString *name) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_legalStatus) (RHCacheResultStatus legalStatus) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_loadCacheWhenFirstStart) (BOOL isTure) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_customData) (r_data data) ;\
@property (nonatomic, copy, readonly) _name_ * (^r_para) (r_para para) ;
#endif




#pragma mark - Enum -


/**
 请求方式
 */
typedef NS_ENUM(NSUInteger, RHRequestMethod) {
    RHRequestPost = 0,
    RHRequestGet,
    RHRequestPut,
    RHRequestHead,
    RHRequestDelete,
    RHRequestPatch
};

typedef NS_ENUM(NSUInteger, RHRequestSerializerType){
    RHRequestSerializerTypeHTTP = 0,
    RHRequestSerializerTypeJSON
};

typedef NS_ENUM(NSInteger, RHResponseSerializerType) {
    RHResponseSerializerTypeJSON = 0,
    RHResponseSerializerTypeXMLParser = 1,
    RHResponseSerializerTypeHTTP = 2
};
typedef NS_ENUM(NSInteger, RHRequestValidError) {
    RHRequestValidErrorStatusCode = -8,
    RHRequestValidErrorJsonFormat = -9,
    RHRequestValidErrorUrlFormat = -10,
    RHRequestValidErrorUniquedFormat = -11
};
typedef NS_ENUM(NSInteger, RHRequestRunningStatus) {
    RHRequestRunningStatus_unStart = 0,//未开始
    RHRequestRunningStatus_running,//请求中-单
    RHRequestRunningStatus_finish_Success,//请求成功
    RHRequestRunningStatus_finish_Failure,//请求失败
    RHRequestRunningStatus_finish_Cancel,
    
};
#endif /* RHRequestDefines_h */
