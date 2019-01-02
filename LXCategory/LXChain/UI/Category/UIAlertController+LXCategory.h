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

- (void)setACTitleAttributedString:(NSAttributedString *)attributedString;

- (void)setACMessageAttributedString:(NSAttributedString *)attributedString;

- (void)setACDetailAttributedString:(NSAttributedString *)attributedString;

- (void)setACTitleLineMaxNumber:(NSInteger)number;

- (void)setACTitleLineBreakModel:(NSLineBreakMode)mode;

@end



@interface UIAlertAction (LXCategory)

- (void)setAlertActionTitleColor:(UIColor *)color;

- (void)setAlertImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
