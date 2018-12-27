//
//  LXLabelChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXLabelChainModel.h"

#define LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_IMPLEMENTATION(LXMethod,LXParaType, LXLabelChainModel *,UILabel)
@implementation LXLabelChainModel

LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(text, NSString *);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(font, UIFont *);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(textColor, UIColor *);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(attributedText, NSAttributedString *);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(textAlignment, NSTextAlignment);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(numberOfLines, NSInteger);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(lineBreakMode, NSLineBreakMode);
LXCATEGORY_CHAIN_LABLE_IMPLEMENTATION(adjustsFontSizeToFitWidth, BOOL);

@end

LXCATEGORY_IMPLEMENTATION(UILabel, LXLabelChainModel)
