//
//  RHRequestTool.h
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/5/9.
//

#import <Foundation/Foundation.h>
@class RHBaseRequest;


@interface RHRequestTool : NSObject

+ (NSStringEncoding)stringEncodingWithRequest:(RHBaseRequest *)request;

+ (NSString *)fullUrlPathWithRequest:(RHBaseRequest *)request;

+ (NSString *)jsonURLStringWithRequest:(RHBaseRequest *)request;

+ (NSString *)urlPathWithRequest:(RHBaseRequest *)request;

+ (NSDictionary *)paraConvetFromDic:(NSDictionary *)parameters withConvert:(NSDictionary *)convertDic;

+ (NSString *)requestCacheKey:(RHBaseRequest *)request;

+ (NSString *)md5StringFromString:(NSString *)string;

+ (BOOL)validateResumeData:(NSData *)data;

+ (BOOL)isBlank:(id)obj;
@end


