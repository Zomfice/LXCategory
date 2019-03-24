//
//  NSTimer+LXCategory.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/9.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "NSTimer+LXCategory.h"

@implementation NSTimer (LXCategory)

+ (void)lx_ExecBlock:(NSTimer *)timer {
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

+ (NSTimer *)scheduledTimerWithBlock:(void (^) (NSTimer *timer))block timeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats{
    return [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(lx_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

+ (NSTimer *)timerWithBlock:(void (^) (NSTimer *timer))block timeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats{
    return [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(lx_ExecBlock:) userInfo:[block copy] repeats:repeats];
}

- (void)dealloc{
    
}
@end
