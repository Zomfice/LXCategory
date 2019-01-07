//
//  NSString+LXCategory.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/3.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LXCategory)

+ (NSString *)stringWithUUID;

#pragma mark - 对象转换 -
#pragma mark - 字符串转换 -
- (NSData *)utf8Data;

/**
 json字符串转字典
 */
- (NSDictionary *)jsonDictionary;

- (NSArray *)jsonArray;

#pragma mark - 加密 -


#pragma mark - 大小 -
- (CGSize)sizeWithAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs limitSize:(CGSize)size;

@end

@interface NSString (Hash)
- (NSString *)md2String;

- (NSString *)md4String;

- (NSString *)md5String;

- (NSString *)sha1String;

- (NSString *)sha224String;

- (NSString *)sha256String;

- (NSString *)sha384String;

- (NSString *)sha512String;

/**
 加密，加盐
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

- (NSString *)hmacSHA224StringWithKey:(NSString *)key;

- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

- (NSString *)hmacSHA384StringWithKey:(NSString *)key;

- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

@end

@interface NSString (Code)
- (nullable NSString *)base64EncodedString;
+ (nullable NSString *)stringWithBase64EncodedString:(NSString *)base64EncodedString;

/**
 URL encode a string in utf-8.
 @return the encoded string.
 */
- (NSString *)stringByURLEncode;
/**
 URL decode a string in utf-8.
 @return the decoded string.
 */
- (NSString *)stringByURLDecode;
/**
 Escape commmon HTML to Entity.
 Example: "a>b" will be escape to "a&gt;b".
 */
- (NSString *)stringByEscapingHTML;
@end

NS_ASSUME_NONNULL_END
