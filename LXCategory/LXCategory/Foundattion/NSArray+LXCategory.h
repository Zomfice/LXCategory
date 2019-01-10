//
//  NSArray+LXCategory.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/9.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray <__covariant ObjectType> (LXCategory)

/**
 安全的找寻数组中的元素
 
 */
- (nullable ObjectType)safeObjectAtIndex:(NSUInteger)index;

- (ObjectType)randomObject;
/**
 快捷计算
 */
- (CGFloat)maxObject;

- (CGFloat)minObject;

- (CGFloat)sumObject;
@end

@interface NSArray<ObjectType> (Plist)

/**
 从一个二进制数据中读取一个数组
 */
+ (nullable NSArray <ObjectType>*)arrayWithPlistData:(NSData *)plist;

+ (nullable NSArray <ObjectType>*)arrayWithPlistString:(NSString *)plist;

/**
 数组转换为plist二进制数据
 */
- (nullable NSData *)plistData;

/**
 数组转化为xml字符串
 */
- (nullable NSString *)plistString;

/**
 json字符串
 */
- (NSString *)jsonString;

/**
 更具可读性的json字符串
 */
- (NSString *)jsonPrettyString;

@end

#define LXMUTABLEARRAY_PROPERTY @property (nonatomic, strong, readonly) NSMutableArray <ObjectType>*
@interface NSMutableArray <ObjectType>(LXCategory)

+ (nullable NSMutableArray <ObjectType>*)arrayWithPlistData:(NSData *)plist;

+ (nullable NSMutableArray <ObjectType>*)arrayWithPlistString:(NSString *)plist;

- (void)removeFirstObject;

- (ObjectType)popFirstObject;

- (ObjectType)popLastObject;

LXMUTABLEARRAY_PROPERTY (^addObjectChain) (ObjectType anObject);

LXMUTABLEARRAY_PROPERTY (^removeObjectChain) (ObjectType anObject);

LXMUTABLEARRAY_PROPERTY (^addObjectChainPre) (ObjectType anObject);

LXMUTABLEARRAY_PROPERTY (^addObjectsChain) (NSArray <ObjectType>* objects);

LXMUTABLEARRAY_PROPERTY (^addObjectsChainPre) (NSArray <ObjectType>* objects);

LXMUTABLEARRAY_PROPERTY (^insertObjectsChainAtIndex) (NSArray <ObjectType>* objects, NSUInteger index);

- (void)reverse;

- (void)shuffle;

@end
NS_ASSUME_NONNULL_END
