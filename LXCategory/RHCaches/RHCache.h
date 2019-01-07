//
//  RHCache.h
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/6/6.
//

#import <Foundation/Foundation.h>
#import "RHCacheManager.h"
@class RHCache;
NS_ASSUME_NONNULL_BEGIN
@interface RHCache : NSObject
+ (nullable RHCache *)shareCache;

@property (nonatomic, assign) NSUInteger  cacheSize;
#pragma mark - 查询 -
/**
 所有状态是否包含
 */
- (BOOL)containObjectKey:(NSString *)key;

/**
 根据存储状态查询是否包含
 */
- (BOOL)containObjectKey:(NSString *)key cacheResult:(RHCacheResultStatus)cacheResult;


- (RHDataPosition)containObjectKey:(NSString *)key withNewCacheType:(RHCacheType)cacheType diskTime:(NSTimeInterval)diskTime memoryTime:(NSTimeInterval)memoryTime isClear:(BOOL)isClear cacheResult:(RHCacheResultStatus)reslut result:(void (^)(RHCacheResultStatus status))status;
/**
 按状态获取数据
 */
- (id)objectForKey:(NSString *)key cacheResult:(RHCacheResultStatus)cacheResult;

/**
 获取数据和状态
 同步
 */
- (void)objectForKey:(NSString *)key withBlock:(RHCacheResultBlock)block;



- (id)objectForKey:(NSString *)key;

- (id)objectForKey:(NSString *)key position:(RHDataPosition)position;
/**
 检查新数据
 */
- (id)objectForKey:(NSString *)key withNewCacheType:(RHCacheType)cacheType diskTime:(NSTimeInterval)diskTime memoryTime:(NSTimeInterval)memoryTime isClear:(BOOL)isClear cacheResult:(RHCacheResultStatus)reslut result:(void (^)(RHCacheResultStatus status))status;

#pragma mark - 设置 -
/**
 缓存设置

 @param object 缓存对象
 @param key 键值
 */
- (void)setObject:(id <NSCoding>)object forKey:(NSString *)key;


/**
 缓存设置

 @param object 缓存对象
 @param key 键值
 @param memoryTime 缓存时间
 */
- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key memoryTime:(NSTimeInterval)memoryTime;

/**
 缓存设置

 @param object 缓存对象
 @param key 键值
 @param memoryTime 内存缓存时间
 @param diskTime 磁盘缓存时间
 */
- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key memoryTime:(NSTimeInterval)memoryTime diskTime:(NSTimeInterval)diskTime;
/**
 同上，过期后清除
 */
- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key memoryTime:(NSTimeInterval)memoryTime clearDiskTime:(NSTimeInterval)diskTime;
/**
 缓存设置

 @param object 缓存的对象
 @param key 缓存键值
 @param cacheType 缓存类型
 @param diskTime 磁盘缓存时间
 @param memoryTime 内存缓存时间设置
 @param isClear 缓存过期是否删除
 */
- (void)setObject:(id <NSCoding>)object forKey:(NSString *)key withCacheType:(RHCacheType)cacheType diskTime:(NSTimeInterval)diskTime memoryTime:(NSTimeInterval)memoryTime isClear:(BOOL)isClear;

#pragma mark - 删除 -

- (void)removeObjectForKey:(NSString *)key;

- (void)removeAllCache;

/**
 在存储前可以给object设置额外的数据

 */
+ (void)setExtendedData:(nullable NSData *)extendedData toObject:(nullable id)object;

+ (nullable NSData *)getExtendedDataFromObject:(nullable id)object;

@end
NS_ASSUME_NONNULL_END
