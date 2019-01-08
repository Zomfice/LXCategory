//
//  NSData+LXCategory.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/7.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "NSData+LXCategory.h"
#import "NSString+LXCategory.h"
#include <CommonCrypto/CommonCrypto.h>
#include <zlib.h>
@implementation NSData (LXCategory)
+ (NSData *)dataNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    if (!path) return nil;
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}
@end

#define LXDATA_ENCRYTION(encryptionType, clas)\
\
NSUInteger number =  CC_##encryptionType##_DIGEST_LENGTH;\
unsigned char result[number];\
CC_##encryptionType(self.bytes, (CC_LONG)self.length, result);\
id data;\
if (clas == 0) {\
    data = [NSData dataWithBytes:result length:number];\
}else{\
    NSMutableString *hash = [NSMutableString stringWithCapacity:number * 2];\
    for (int i = 0; i < number; i++) {\
        [hash appendFormat:@"%02x",result[i]];\
    }\
    data = hash.copy;\
}\
return data;


#define LXDATA_WITH_KEY(alg, key)\
\
size_t size = CC_##alg##_DIGEST_LENGTH;\
unsigned char result[size];\
id data;\
if ([key isKindOfClass:[NSData class]]) {\
NSData *da = (NSData *)key;\
CCHmac(kCCHmacAlg##alg, [da bytes], da.length, self.bytes, (CC_LONG)self.length, result);\
data = [NSData dataWithBytes:result length:size];\
}else{\
NSString *da = (NSString *)key;\
const char *cKey = [da cStringUsingEncoding:NSUTF8StringEncoding];\
CCHmac(kCCHmacAlg##alg, cKey, strlen(cKey), self.bytes, (CC_LONG)self.length, result);\
NSMutableString *hash = [NSMutableString stringWithCapacity:size * 2];\
for (int i = 0; i < size; i++) {\
[hash appendFormat:@"%02x", result[i]];\
}\
data = hash.copy;\
}\
return data;

@implementation NSData (Hash)

- (NSData *)md2Data{
    
    LXDATA_ENCRYTION(MD2, 0)
    
}

- (NSString *)md2String{
    LXDATA_ENCRYTION(MD2, 1)
}
- (NSString *)md4String{
    LXDATA_ENCRYTION(MD4, 1)
}

- (NSData *)md4Data{
    LXDATA_ENCRYTION(MD4, 0)
}

- (NSString *)md5String{
    LXDATA_ENCRYTION(MD5, 1)
}

- (NSData *)md5Data{
    LXDATA_ENCRYTION(MD5, 0)
}

- (NSString *)sha1String{
    LXDATA_ENCRYTION(SHA1, 1)
}

- (NSData *)sha1Data{
    LXDATA_ENCRYTION(SHA1, 0)
}

- (NSString *)sha224String{
    LXDATA_ENCRYTION(SHA224, 1)
}

- (NSData *)sha224Data{
    LXDATA_ENCRYTION(SHA224, 0);
}

- (NSString *)sha256String{
    LXDATA_ENCRYTION(SHA256, 1);
}

- (NSData *)sha256Data{
    LXDATA_ENCRYTION(SHA256, 0);
}

- (NSString *)sha384String{
    LXDATA_ENCRYTION(SHA384, 1);
}

- (NSData *)sha384Data{
    LXDATA_ENCRYTION(SHA384, 0);
}

- (NSString *)sha512String{
    LXDATA_ENCRYTION(SHA512, 1);
}

- (NSData *)sha512Data{
    LXDATA_ENCRYTION(SHA512, 0);
}


- (NSString *)hmacMD5StringWithKey:(NSString *)key{
    LXDATA_WITH_KEY(MD5, key)
}

- (NSData *)hmacMD5DataWithKey:(NSData *)key{
    LXDATA_WITH_KEY(MD5, key)
}

- (NSString *)hmacSHA1StringWithKey:(NSString *)key{
    LXDATA_WITH_KEY(SHA1, key)
}

- (NSData *)hmacSHA1DataWithKey:(NSData *)key{
    LXDATA_WITH_KEY(SHA1, key)
}

- (NSString *)hmacSHA224StringWithKey:(NSString *)key{
    LXDATA_WITH_KEY(SHA224, key)
}

- (NSData *)hmacSHA224DataWithKey:(NSData *)key{
    LXDATA_WITH_KEY(SHA224, key)
}

- (NSString *)hmacSHA256StringWithKey:(NSString *)key{
    LXDATA_WITH_KEY(SHA256, key)
}

- (NSData *)hmacSHA256DataWithKey:(NSData *)key{
    LXDATA_WITH_KEY(SHA256, key)
}

- (NSString *)hmacSHA384StringWithKey:(NSString *)key{
    LXDATA_WITH_KEY(SHA384, key)
}

- (NSData *)hmacSHA384DataWithKey:(NSData *)key{
    LXDATA_WITH_KEY(SHA384, key)
}

- (NSString *)hmacSHA512StringWithKey:(NSString *)key{
    LXDATA_WITH_KEY(SHA512, key)
}

- (NSData *)hmacSHA512DataWithKey:(NSData *)key{
    LXDATA_WITH_KEY(SHA512, key)
}

- (NSString *)crc32String {
    uLong result = crc32(0, self.bytes, (uInt)self.length);
    return [NSString stringWithFormat:@"%08x", (uint32_t)result];
}

- (uint32_t)crc32 {
    uLong result = crc32(0, self.bytes, (uInt)self.length);
    return (uint32_t)result;
}

@end
@implementation NSData (Code)

- (nullable NSData *)aes256EncryptDataWithKey:(NSData *)key iv:(nullable NSData *)iv{
    return [self aes256EncryptOriWithKey:(void *)key.bytes size:key.length iv:(void *)iv.bytes size:iv.length];
}

- (nullable NSData *)aes256DecryptDataWithkey:(NSData *)key iv:(nullable NSData *)iv{
    return [self aes256DecryptOriWithkey:(void *)key.bytes size:key.length iv:(void *)iv.bytes size:iv.length];
}

- (nullable NSData *)aes256EncryptStringWithKey:(NSString *)key iv:(nullable NSString *)iv{
    if (key.length == 0)return nil;
    char keyData[kCCKeySizeAES128 + 1];
    size_t keySize = sizeof(keyData);
    memset(keyData, 0, keySize);
    [key getCString:keyData maxLength:keySize encoding:NSUTF8StringEncoding];
    keySize --;
    size_t ivSize = 0;
    void * ivVoid = NULL;
    if (iv.length > 0) {
        char ivData[kCCBlockSizeAES128 + 1];
        ivSize = sizeof(ivData);
        memset(ivData, 0, ivSize);
        [key getCString:ivData maxLength:ivSize encoding:NSUTF8StringEncoding];
        ivSize --;
        ivVoid = ivData;
    }
    return [self aes256EncryptOriWithKey:keyData size:keySize iv:ivVoid size:ivSize];
}

- (nullable NSData *)aes256DecryptStringWithkey:(NSString *)key iv:(nullable NSString *)iv{
    if (key.length == 0)return nil;
    char keyData[kCCKeySizeAES128 + 1];
    size_t keySize = sizeof(keyData);
    memset(keyData, 0, keySize);
    [key getCString:keyData maxLength:keySize encoding:NSUTF8StringEncoding];
    keySize --;
    size_t ivSize = 0;
    void * ivVoid = NULL;
    if (iv.length > 0) {
        char ivData[kCCBlockSizeAES128 + 1];
        ivSize = sizeof(ivData);
        memset(ivData, 0, ivSize);
        [key getCString:ivData maxLength:ivSize encoding:NSUTF8StringEncoding];
        ivSize --;
        ivVoid = ivData;
    }
    return [self aes256DecryptOriWithkey:keyData size:keySize iv:ivVoid size:ivSize];
}


- (nullable NSData *)aes256EncryptOriWithKey:(void *)key size:(size_t)keySize iv:( void *)iv size:(size_t)ivSize{
    if (keySize != 16 && keySize != 24 && keySize != 32) {
        return nil;
    }
    if (ivSize != 16 && ivSize != 0) {
        return nil;
    }
    
    NSData *result = nil;
    size_t bufferSize = self.length + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    if (!buffer) return nil;
    size_t encryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          key,
                                          keySize,
                                          iv,
                                          self.bytes,
                                          self.length,
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);
    if (cryptStatus == kCCSuccess) {
        result = [[NSData alloc]initWithBytes:buffer length:encryptedSize];
        free(buffer);
        return result;
    } else {
        free(buffer);
        return nil;
    }
}

- (nullable NSData *)aes256DecryptOriWithkey:(void *)key size:(size_t)keySize iv:( void *)iv size:(size_t)ivSize{
    if (keySize != 16 && keySize != 24 && keySize != 32) {
        return nil;
    }
    if (ivSize != 16 && ivSize != 0) {
        return nil;
    }
    
    NSData *result = nil;
    size_t bufferSize = self.length + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    if (!buffer) return nil;
    size_t encryptedSize = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding,
                                          key,
                                          keySize,
                                          iv,
                                          self.bytes,
                                          self.length,
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);
    if (cryptStatus == kCCSuccess) {
        result = [[NSData alloc]initWithBytes:buffer length:encryptedSize];
        free(buffer);
        return result;
    } else {
        free(buffer);
        return nil;
    }
}

- (NSString *)utf8String{
    if (self.length > 0) {
        return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
    }
    return @"";
}

- (nullable NSString *)hexString{
    NSUInteger length = self.length;
    NSMutableString *result = [NSMutableString stringWithCapacity:length * 2];
    const unsigned char *byte = self.bytes;
    for (int i = 0; i < length; i++, byte++) {
        [result appendFormat:@"%02X", *byte];
    }
    return result;
}

+ (nullable NSData *)dataWithHexString:(NSString *)hexStr{
    hexStr = [hexStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    hexStr = [hexStr lowercaseString];
    NSUInteger len = hexStr.length;
    if (!len) return nil;
    unichar *buf = malloc(sizeof(unichar) * len);
    if (!buf) return nil;
    [hexStr getCharacters:buf range:NSMakeRange(0, len)];
    
    NSMutableData *result = [NSMutableData data];
    unsigned char bytes;
    char str[3] = { '\0', '\0', '\0' };
    int i;
    for (i = 0; i < len / 2; i++) {
        str[0] = buf[i * 2];
        str[1] = buf[i * 2 + 1];
        bytes = strtol(str, NULL, 16);
        [result appendBytes:&bytes length:1];
    }
    free(buf);
    return result;
}
static const char base64EncodingTable[64]
= "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
static const short base64DecodingTable[256] = {
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -2,  -1,  -1, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -1, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, 62,  -2,  -2, -2, 63,
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -2, -2,  -2,  -2, -2, -2,
    -2, 0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -2,  -2,  -2, -2, -2,
    -2, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36,  37,  38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2
};
- (nullable NSString *)base64EncodedString{
    NSUInteger length = self.length;
    if (length == 0)
        return @"";
    
    NSUInteger out_length = ((length + 2) / 3) * 4;
    uint8_t *output = malloc(((out_length + 2) / 3) * 4);
    if (output == NULL)
        return nil;
    
    const char *input = self.bytes;
    NSInteger i, value;
    for (i = 0; i < length; i += 3) {
        value = 0;
        for (NSInteger j = i; j < i + 3; j++) {
            value <<= 8;
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
        NSInteger index = (i / 3) * 4;
        output[index + 0] = base64EncodingTable[(value >> 18) & 0x3F];
        output[index + 1] = base64EncodingTable[(value >> 12) & 0x3F];
        output[index + 2] = ((i + 1) < length)
        ? base64EncodingTable[(value >> 6) & 0x3F]
        : '=';
        output[index + 3] = ((i + 2) < length)
        ? base64EncodingTable[(value >> 0) & 0x3F]
        : '=';
    }
    
    NSString *base64 = [[NSString alloc] initWithBytes:output
                                                length:out_length
                                              encoding:NSASCIIStringEncoding];
    free(output);
    return base64;
}

+ (nullable NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString{
    NSInteger length = base64EncodedString.length;
    const char *string = [base64EncodedString cStringUsingEncoding:NSASCIIStringEncoding];
    if (string  == NULL)
        return nil;
    
    while (length > 0 && string[length - 1] == '=')
        length--;
    
    NSInteger outputLength = length * 3 / 4;
    NSMutableData *data = [NSMutableData dataWithLength:outputLength];
    if (data == nil)
        return nil;
    if (length == 0)
        return data;
    
    uint8_t *output = data.mutableBytes;
    NSInteger inputPoint = 0;
    NSInteger outputPoint = 0;
    while (inputPoint < length) {
        char i0 = string[inputPoint++];
        char i1 = string[inputPoint++];
        char i2 = inputPoint < length ? string[inputPoint++] : 'A';
        char i3 = inputPoint < length ? string[inputPoint++] : 'A';
        
        output[outputPoint++] = (base64DecodingTable[i0] << 2)
        | (base64DecodingTable[i1] >> 4);
        if (outputPoint < outputLength) {
            output[outputPoint++] = ((base64DecodingTable[i1] & 0xf) << 4)
            | (base64DecodingTable[i2] >> 2);
        }
        if (outputPoint < outputLength) {
            output[outputPoint++] = ((base64DecodingTable[i2] & 0x3) << 6)
            | base64DecodingTable[i3];
        }
    }
    
    return data;
}

- (nullable id)jsonValueDecoded{
    NSError *error = nil;
    id value = [NSJSONSerialization JSONObjectWithData:self options:kNilOptions error:&error];
    if (error) {
        NSLog(@"jsonValueDecoded error:%@", error);
    }
    return value;
}

@end
@implementation NSData (Zip)
- (nullable NSData *)gzipInflate{
    if ([self length] == 0) return self;
    
    unsigned full_length = (unsigned)[self length];
    unsigned half_length = (unsigned)[self length] / 2;
    
    NSMutableData *decompressed = [NSMutableData
                                   dataWithLength:full_length + half_length];
    BOOL done = NO;
    int status;
    
    z_stream strm;
    strm.next_in = (Bytef *)[self bytes];
    strm.avail_in = (unsigned)[self length];
    strm.total_out = 0;
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    
    if (inflateInit2(&strm, (15 + 32)) != Z_OK) return nil;
    while (!done) {
        // Make sure we have enough room and reset the lengths.
        if (strm.total_out >= [decompressed length])
            [decompressed increaseLengthBy:half_length];
        strm.next_out = [decompressed mutableBytes] + strm.total_out;
        strm.avail_out = (uInt)([decompressed length] - strm.total_out);
        
        // Inflate another chunk.
        status = inflate(&strm, Z_SYNC_FLUSH);
        if (status == Z_STREAM_END) done = YES;
        else if (status != Z_OK) break;
    }
    if (inflateEnd(&strm) != Z_OK) return nil;
    
    // Set real length.
    if (done) {
        [decompressed setLength:strm.total_out];
        return [NSData dataWithData:decompressed];
    } else return nil;
}


- (nullable NSData *)gzipDeflate{
    if ([self length] == 0) return self;
    
    z_stream strm;
    
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;
    strm.total_out = 0;
    strm.next_in = (Bytef *)[self bytes];
    strm.avail_in = (uInt)[self length];
    
    // Compresssion Levels:
    //   Z_NO_COMPRESSION
    //   Z_BEST_SPEED
    //   Z_BEST_COMPRESSION
    //   Z_DEFAULT_COMPRESSION
    
    if (deflateInit2(&strm, Z_DEFAULT_COMPRESSION, Z_DEFLATED, (15 + 16),
                     8, Z_DEFAULT_STRATEGY) != Z_OK)
        return nil;
    
    // 16K chunks for expansion
    NSMutableData *compressed = [NSMutableData dataWithLength:16384];
    
    do {
        if (strm.total_out >= [compressed length])
            [compressed increaseLengthBy:16384];
        
        strm.next_out = [compressed mutableBytes] + strm.total_out;
        strm.avail_out = (uInt)([compressed length] - strm.total_out);
        
        deflate(&strm, Z_FINISH);
    }
    while (strm.avail_out == 0);
    
    deflateEnd(&strm);
    
    [compressed setLength:strm.total_out];
    return [NSData dataWithData:compressed];
}


- (nullable NSData *)zlibInflate{
    if ([self length] == 0) return self;
    
    NSUInteger full_length = [self length];
    NSUInteger half_length = [self length] / 2;
    
    NSMutableData *decompressed = [NSMutableData
                                   dataWithLength:full_length + half_length];
    BOOL done = NO;
    int status;
    
    z_stream strm;
    strm.next_in = (Bytef *)[self bytes];
    strm.avail_in = (uInt)full_length;
    strm.total_out = 0;
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    
    if (inflateInit(&strm) != Z_OK) return nil;
    
    while (!done) {
        // Make sure we have enough room and reset the lengths.
        if (strm.total_out >= [decompressed length])
            [decompressed increaseLengthBy:half_length];
        strm.next_out = [decompressed mutableBytes] + strm.total_out;
        strm.avail_out = (uInt)([decompressed length] - strm.total_out);
        
        // Inflate another chunk.
        status = inflate(&strm, Z_SYNC_FLUSH);
        if (status == Z_STREAM_END) done = YES;
        else if (status != Z_OK) break;
    }
    if (inflateEnd(&strm) != Z_OK) return nil;
    
    // Set real length.
    if (done) {
        [decompressed setLength:strm.total_out];
        return [NSData dataWithData:decompressed];
    } else return nil;
}


- (nullable NSData *)zlibDeflate{
    if ([self length] == 0) return self;
    
    z_stream strm;
    
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;
    strm.total_out = 0;
    strm.next_in = (Bytef *)[self bytes];
    strm.avail_in = (uInt)[self length];
    
    // Compresssion Levels:
    //   Z_NO_COMPRESSION
    //   Z_BEST_SPEED
    //   Z_BEST_COMPRESSION
    //   Z_DEFAULT_COMPRESSION
    
    if (deflateInit(&strm, Z_DEFAULT_COMPRESSION) != Z_OK) return nil;
    
    // 16K chuncks for expansion
    NSMutableData *compressed = [NSMutableData dataWithLength:16384];
    
    do {
        if (strm.total_out >= [compressed length])
            [compressed increaseLengthBy:16384];
        
        strm.next_out = [compressed mutableBytes] + strm.total_out;
        strm.avail_out = (uInt)([compressed length] - strm.total_out);
        
        deflate(&strm, Z_FINISH);
    }
    while (strm.avail_out == 0);
    
    deflateEnd(&strm);
    
    [compressed setLength:strm.total_out];
    return [NSData dataWithData:compressed];
}


@end
