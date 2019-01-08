//
//  NSData+LXCategory.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/7.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (LXCategory)

+ (nullable NSData *)dataNamed:(NSString *)name;

@end

@interface NSData (Hash)

- (NSString *)md2String;

- (NSData *)md2Data;

- (NSString *)md4String;

- (NSData *)md4Data;

- (NSString *)md5String;

- (NSData *)md5Data;

- (NSString *)sha1String;

- (NSData *)sha1Data;

- (NSString *)sha224String;

- (NSData *)sha224Data;

- (NSString *)sha256String;

- (NSData *)sha256Data;

- (NSString *)sha384String;

- (NSData *)sha384Data;

- (NSString *)sha512String;

- (NSData *)sha512Data;

/**
 加密，加盐
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key;

- (NSData *)hmacMD5DataWithKey:(NSData *)key;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

- (NSData *)hmacSHA1DataWithKey:(NSData *)key;

- (NSString *)hmacSHA224StringWithKey:(NSString *)key;

- (NSData *)hmacSHA224DataWithKey:(NSData *)key;

- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

- (NSData *)hmacSHA256DataWithKey:(NSData *)key;

- (NSString *)hmacSHA384StringWithKey:(NSString *)key;

- (NSData *)hmacSHA384DataWithKey:(NSData *)key;

- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

- (NSData *)hmacSHA512DataWithKey:(NSData *)key;

- (NSString *)crc32String;

- (uint32_t)crc32;

@end


@interface NSData (Code)

- (nullable NSData *)aes256EncryptDataWithKey:(NSData *)key iv:(nullable NSData *)iv;

- (nullable NSData *)aes256DecryptDataWithkey:(NSData *)key iv:(nullable NSData *)iv;

- (nullable NSData *)aes256EncryptStringWithKey:(NSString *)key iv:(nullable NSString *)iv;

- (nullable NSData *)aes256DecryptStringWithkey:(NSString *)key iv:(nullable NSString *)iv;

- (NSString *)utf8String;

- (nullable NSString *)hexString;

+ (nullable NSData *)dataWithHexString:(NSString *)hexString;

- (nullable NSString *)base64EncodedString;

+ (nullable NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;

- (nullable id)jsonValueDecoded;

@end


@interface NSData (Zip)

/**
 解压
 */
- (nullable NSData *)gzipInflate;

/**
 压缩
 */
- (nullable NSData *)gzipDeflate;

- (nullable NSData *)zlibInflate;

- (nullable NSData *)zlibDeflate;

@end

NS_ASSUME_NONNULL_END
