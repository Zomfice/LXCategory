//
//  UIScreen+LX.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/11/20.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "UIScreen+LX.h"

@implementation UIScreen (LX)

+ (CGFloat)screenWidth{
    static CGFloat width = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGSize size = [self mainScreen].bounds.size;
        width = MIN(size.width, size.height);
    });
    return width;
}

+ (CGFloat)screenHeight{
    static CGFloat height = 0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGSize size = [self mainScreen].bounds.size;
        height = MAX(size.width, size.height);
    });
    return height;
}
@end
