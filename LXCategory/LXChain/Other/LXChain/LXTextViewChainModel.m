//
//  LXTextViewChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXTextViewChainModel.h"
#define LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_IMPLEMENTATION(LXMethod,LXParaType, LXTextViewChainModel *,UITextView)
@implementation LXTextViewChainModel
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(delegate, id<UITextViewDelegate>);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(text, NSString *);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(font, UIFont *);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(textColor, UIColor *);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(textAlignment, NSTextAlignment);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(selectedRange, NSRange);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(editable, BOOL);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(selectable, BOOL);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(dataDetectorTypes, UIDataDetectorTypes);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(keyboardType, UIKeyboardType);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(allowsEditingTextAttributes, BOOL);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(attributedText, NSAttributedString *);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(typingAttributes, NSDictionary *);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(clearsOnInsertion, BOOL);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(textContainerInset, UIEdgeInsets);
LXCATEGORY_CHAIN_TEXT_IMPLEMENTATION(linkTextAttributes, NSDictionary *);
@end
LXCATEGORY_IMPLEMENTATION(UITextView, LXTextViewChainModel)
