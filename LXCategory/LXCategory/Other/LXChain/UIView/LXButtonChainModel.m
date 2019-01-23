//
//  LXButtonChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXButtonChainModel.h"

#define LXCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXButtonChainModel *,UIButton)

#define LXCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION(LXMethod,LXParaType)\
- (LXButtonChainModel * (^)(LXParaType LXMethod))LXMethod    \
{   \
return ^ (LXParaType LXMethod) {    \
((UIButton *)self.view).titleLabel.LXMethod = LXMethod;   \
return self;    \
};\
}

@implementation LXButtonChainModel

LXCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(contentEdgeInsets, UIEdgeInsets)

LXCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(titleEdgeInsets, UIEdgeInsets)

LXCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(imageEdgeInsets, UIEdgeInsets)

LXCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(adjustsImageWhenHighlighted, BOOL)

LXCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(showsTouchWhenHighlighted, BOOL)

LXCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(adjustsImageWhenDisabled, BOOL)

LXCATEGORY_CHAIN_BUTTON_IMPLEMENTATION(reversesTitleShadowWhenHighlighted, BOOL)

LXCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION(textAlignment, NSTextAlignment)
LXCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION(numberOfLines, NSInteger)
LXCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION(lineBreakMode, NSLineBreakMode)
LXCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION(adjustsFontSizeToFitWidth, BOOL)
LXCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION(baselineAdjustment, UIBaselineAdjustment)


- (LXButtonChainModel * _Nonnull (^)(UIImage * _Nonnull, UIControlState))image{
    return ^ (UIImage *image, UIControlState state){
        [(UIButton *)self.view setImage:image forState:state];
        return self;
    };
}

- (LXButtonChainModel * _Nonnull (^)(NSString * _Nonnull, UIControlState))text{
    return ^ (NSString *text, UIControlState state){
        [(UIButton *)self.view setTitle:text forState:state];
        return self;
    };
}

- (LXButtonChainModel * _Nonnull (^)(UIImage * _Nonnull, UIControlState))backgroundImage{
    return ^ (UIImage *image, UIControlState state){
        [(UIButton *)self.view setBackgroundImage:image forState:state];
        return self;
    };
}

- (LXButtonChainModel * _Nonnull (^)(NSAttributedString * _Nonnull, UIControlState))attributedTitle{
    return ^ (NSAttributedString *title, UIControlState state){
        [(UIButton *)self.view setAttributedTitle:title forState:state];
        return self;
    };
}

- (LXButtonChainModel * _Nonnull (^)(UIFont * _Nonnull))font{
    return ^ (UIFont *font){
        [(UIButton *)self.view titleLabel].font = font;
        return self;
    };
}

- (LXButtonChainModel * _Nonnull (^)(UIColor * _Nonnull, UIControlState))textColor{
    return ^ (UIColor *color, UIControlState state){
        [(UIButton *)self.view setTitleColor:color forState:state];
        return self;
    };
}

- (LXButtonChainModel * _Nonnull (^)(UIColor * _Nonnull, UIControlState))titleShadow{
    return ^ (UIColor *color, UIControlState state){
        [(UIButton *)self.view setTitleShadowColor:color forState:state];
        return self;
    };
}

- (LXButtonChainModel * _Nonnull (^)(LXButtonImageDirection, CGFloat))imageDirection{
    return ^ (LXButtonImageDirection direction, CGFloat space){
        [(UIButton *)self.view imageDirection:direction space:space];
        return self;
    };
}

- (LXButtonChainModel * _Nonnull (^)(LXButtonImageTitleBlock _Nonnull))imageAndTitle{
    return ^ (LXButtonImageTitleBlock block){
        if (block) {
            UIButton *button = self.view;
            block(button.imageView,button.titleLabel);
        }
        return self;
    };
}

@end
LXCATEGORY_VIEW_IMPLEMENTATION(UIButton, LXButtonChainModel)
#undef LXCATEGORY_CHAIN_BUTTON_IMPLEMENTATION
#undef LXCATEGORY_CHAIN_BUTTONLABEL_IMPLEMENTATION
