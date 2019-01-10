//
//  LXLabelChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXLabelChainModel.h"
#import "UILabel+LXCategory.h"
#define LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXLabelChainModel *,UILabel)
@implementation LXLabelChainModel

LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(text, NSString *);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(font, UIFont *);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(textColor, UIColor *);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(attributedText, NSAttributedString *);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(textAlignment, NSTextAlignment);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(numberOfLines, NSInteger);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(lineBreakMode, NSLineBreakMode);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(adjustsFontSizeToFitWidth, BOOL);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(baselineAdjustment, UIBaselineAdjustment);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(allowsDefaultTighteningForTruncation, BOOL);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(preferredMaxLayoutWidth, CGFloat);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(minimumScaleFactor, CGFloat);
- (CGSize (^)(CGSize))sizeWithLimitSize{
    return ^ (CGSize size){
        return [(UILabel *)self.view sizeWithLimitSize:size];
    };
}

- (CGSize (^)(void))sizeWithOutLimitSize{
    return ^ (){
        return [(UILabel *)self.view sizeWithoutLimitSize];
    };
}
@end

LXCATEGORY_VIEW_IMPLEMENTATION(UILabel, LXLabelChainModel)
#undef LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION
