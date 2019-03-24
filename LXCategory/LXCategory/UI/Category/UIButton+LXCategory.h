//
//  UIButton+LXCategory.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/28.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LXButtonImageDirection) {
    LXButtonImageDirectionTop,
    LXButtonImageDirectionLeft,
    LXButtonImageDirectionRight,
    LXButtonImageDirectionBottom,
};
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (LXCategory)

- (void)imageDirection:(LXButtonImageDirection)direction space:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
