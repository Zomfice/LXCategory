//
//  UIDevice+LX.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/11/20.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "UIDevice+LX.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
@implementation UIDevice (LX)
+ (NSArray *)carriers{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    NSDictionary * carrieres = info.serviceSubscriberCellularProviders;
    if (LXIsNotBlank(carrieres)) {
        return carrieres.allValues;
    }else{
        return nil;
    }
}
@end
