//
//  UIScrollView+LXCategory.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/7.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "UIScrollView+LXCategory.h"

@implementation UIScrollView (LXCategory)
- (void)adJustedContentIOS11{
    [self setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
}
@end
