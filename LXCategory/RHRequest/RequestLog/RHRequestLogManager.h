//
//  RHRequestLogManager.h
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/5/8.
//

#import <Foundation/Foundation.h>
#import "RHRequestUniquePackage.h"

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif
@interface RHRequestLogManager : NSObject
+ (RHRequestLogManager *)shareManger;
- (void)logPackage:(RHRequestUniquePackage *)package;
@end
@interface RHRequestUniquePackage (Log)
@property (nonatomic, assign) double  timeCost;
@property (nonatomic, assign) double  startTime;
@property (nonatomic, assign) double  finishTime;
- (void)addRequestLog:(RHBaseRequest *)request;
- (void)startRequestLog:(RHBaseRequest *)request;
- (void)finish;

@end
