//
//  RHRequestConfiguration.m
//  RHRequestNetWork
//
//  Created by 麻小亮 on 2018/5/7.
//

#import "RHRequestConfiguration.h"
#import "AFSecurityPolicy.h"
@implementation RHRequestConfiguration
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    _timeOut = 15.0f;
    _validStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(100, 500)];
    _securityPolicy = [AFSecurityPolicy defaultPolicy];
    _canPrintLog = YES;
    _autoTrimInterval = 5.0f;
}
@end
