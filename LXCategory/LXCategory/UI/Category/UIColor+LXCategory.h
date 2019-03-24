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

+ (UIColor *)randomColor;

+ (UIColor *)percentR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b alpha:(CGFloat)alpha;

- (NSString *)hexString;

- (NSString *)hexStringWithAplha;

- (UIColor *)addColor:(UIColor *)acolor blendMode:(CGBlendMode)blendModel;

@property (nonatomic, assign, readonly) CGFloat  red;

@property (nonatomic, assign, readonly) CGFloat  green;

@property (nonatomic, assign, readonly) CGFloat  blue;

@property (nonatomic, assign, readonly) CGFloat  alpha;

@property (nonatomic, assign, readonly) CGFloat  hue;

@property (nonatomic, assign, readonly) CGFloat  saturation;

@property (nonatomic, assign, readonly) CGFloat  brightness;

@property (nonatomic, readonly) CGColorSpaceModel colorSpaceModel;

@property (nonatomic, readonly) NSString *colorSpaceString;

/**
 反色调
 */
- (UIColor *)antiColor;

@end

static inline UIColor *UIColorHexString(NSString *hexString){
    return [UIColor colorWithHexString:hexString];
}

static inline UIColor *UIColorHexAlpha(NSString *hexString, CGFloat alpha){
    return [UIColor colorWithHexString:hexString alpha:alpha];
}
NS_ASSUME_NONNULL_END
