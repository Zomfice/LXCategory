//
//  UIColor+LXCategory.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (LXCategory)

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorWithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
