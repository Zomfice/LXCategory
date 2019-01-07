//
//  RHRequestLogManager.m
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/5/8.
//

#import "RHRequestLogManager.h"
#import <objc/runtime.h>
#import <time.h>



static RHRequestLogManager *_manager = nil;
@implementation RHRequestLogManager

+ (RHRequestLogManager *)shareManger{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [RHRequestLogManager new];
    });
    return _manager;
}
- (void)logPackage:(RHRequestUniquePackage *)package{
//    NSMutableArray *array = [NSMutableArray array];
//    for (RHBaseRequest *request in package.requests) {
//        NSString *string = [NSString stringWithFormat:@"name :%@ ,\n dataTask :%ld \n",request.path, request.requestTask.taskIdentifier];
//        [array addObject:string];
//    }
//    NSLog(@"请求：：：：：：fullUrl:%@ \n 耗时: %f 开始时间%f ----结束时间：%f\n 当前请求序列:%ld \n 数量:%ld \n", package.fullUrl, package.timeCost, package.startTime, package.finishTime,package.currentIndex, package.requests.count);
}
@end
@implementation RHRequestUniquePackage (Log)

- (void)addRequestLog:(RHBaseRequest *)request{
//    NSLog(@"addRequest count %ld 添加 ::::::%@  ", self.requests.count, [self.fullUrl lastPathComponent]);
    if (![RHRequestSessionManager shareManager].configuration.canPrintLog) {
        return;
    }
    if (self.requests.count == 1) {
        self.startTime = time(NULL);
    }
}
- (void)startRequestLog:(RHBaseRequest *)request{
    if (![RHRequestSessionManager shareManager].configuration.canPrintLog) {
        return;
    }
//    NSLog(@"startRequest::::::\n %@ 当前请求序列: %ld\n",request.path,self.currentIndex);
}
- (void)finish{
    if (![RHRequestSessionManager shareManager].configuration.canPrintLog) {
        return;
    }
    self.finishTime = time(NULL);
    self.timeCost = self.finishTime - self.startTime;
//    NSLog(@"finish::::::::%@\n",self.currentRequest.path);
    [[RHRequestLogManager shareManger] logPackage:self];
}
- (void)dealloc{
//    NSLog(@"：：request::::package 销毁 %@",[self.fullUrl lastPathComponent]);
    if (![RHRequestSessionManager shareManager].configuration.canPrintLog) {
        return;
    }
}
- (void)setTimeCost:(double)timeCost{
    objc_setAssociatedObject(self, @selector(timeCost), @(timeCost), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (double)timeCost{
    return [objc_getAssociatedObject(self, @selector(timeCost)) doubleValue];
}
- (double)startTime{
    
    return [objc_getAssociatedObject(self, @selector(startTime)) doubleValue];
}
- (double)finishTime{
    
    return [objc_getAssociatedObject(self, @selector(finishTime)) doubleValue];
}
- (void)setFinishTime:(double)finishTime{
    objc_setAssociatedObject(self, @selector(finishTime), @(finishTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setStartTime:(double)startTime{
    objc_setAssociatedObject(self, @selector(startTime), @(startTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
