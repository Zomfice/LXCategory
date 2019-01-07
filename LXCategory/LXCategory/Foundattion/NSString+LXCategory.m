//
//  NSString+LXCategory.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/3.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "NSString+LXCategory.h"
#import "NSData+LXCategory.h"
@implementation NSString (LXCategory)



+ (NSString *)stringWithUUID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string;
}
#pragma mark - 对象转换 -
#pragma mark - 字符串转换 -
- (NSData *)utf8Data{
    NSString *string = self;
    string = [string stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return [string dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSDictionary *)jsonDictionary{
    id data = [self jsonChange];
    if (data && [data isKindOfClass:[NSDictionary class]]) {
        return data;
    }else{
        return nil;
    }
}

- (id)jsonChange{
    if (self.length == 0) return nil;
    id data = [NSJSONSerialization JSONObjectWithData:[self utf8Data] options:kNilOptions error:nil];
    return data;
}

- (NSArray *)jsonArray{
    id data = [self jsonChange];
    if (data && [data isKindOfClass:[NSArray class]]) {
        return data;
    }else{
        return nil;
    }
}

#pragma mark - 加密 -
#pragma mark - 大小 -

- (CGSize)sizeWithAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs limitSize:(CGSize)size{
    CGRect strRect = [self boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attrs context:nil];
    return strRect.size;
}
@end
#define LXSTRINGHASH(method)\
return [[self utf8Data] method];

#define LXSTRINGHASH_KEY(method,key)\
return [[self utf8Data] hmac##method##StringWithKey:key];

@implementation NSString (Hash)
- (NSString *)md2String{
    LXSTRINGHASH(md2String)
}

- (NSString *)md4String{
    LXSTRINGHASH(md4String)
}

- (NSString *)md5String{
    LXSTRINGHASH(md5String)
}

- (NSString *)sha1String{
    LXSTRINGHASH(sha1String)
}

- (NSString *)sha224String{
    LXSTRINGHASH(sha224String)
}

- (NSString *)sha256String{
    LXSTRINGHASH(sha256String)
}

- (NSString *)sha384String{
    LXSTRINGHASH(sha384String)
}

- (NSString *)sha512String{
    LXSTRINGHASH(sha384String)
}

/**
 加密，加盐
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key{
    LXSTRINGHASH_KEY(MD5,key)
}

- (NSString *)hmacSHA1StringWithKey:(NSString *)key{
    LXSTRINGHASH_KEY(SHA1,key)
}

- (NSString *)hmacSHA224StringWithKey:(NSString *)key{
    LXSTRINGHASH_KEY(SHA224,key)
}

- (NSString *)hmacSHA256StringWithKey:(NSString *)key{
    LXSTRINGHASH_KEY(SHA256,key)
}

- (NSString *)hmacSHA384StringWithKey:(NSString *)key{
    LXSTRINGHASH_KEY(SHA384,key)
}

- (NSString *)hmacSHA512StringWithKey:(NSString *)key{
    LXSTRINGHASH_KEY(SHA512,key)
}
@end
