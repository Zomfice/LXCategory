//
//  UIAlertController+LXCategory.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/2.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (LXCategory)

/**
 设置title字体颜色
 */
- (void)setACTitleAttributedString:(NSAttributedString *)attributedString;

/**
 设置message字体颜色
 */
- (void)setACMessageAttributedString:(NSAttributedString *)attributedString;

/**
 设置介绍字体颜色
 */
- (void)setACDetailAttributedString:(NSAttributedString *)attributedString;

/**
 设置title最大行数
 */
- (void)setACTitleLineMaxNumber:(NSInteger)number;

/**
 设置title截断模式
 */
- (void)setACTitleLineBreakModel:(NSLineBreakMode)mode;

/**
 添加action
 */
- (UIAlertAction *)addActionTitle:(NSString *)title style:(UIAlertActionStyle)style block:(void (^) (UIAlertAction *action))block;

@end



@interface UIAlertAction (LXCategory)

/**
 设置action颜色
 */
- (void)setAlertActionTitleColor:(UIColor *)color;

/**
 设置action图片

 */
- (void)setAlertImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
