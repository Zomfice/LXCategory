//
//  LXTextFieldChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXTextFieldChainModel.h"
#import "UITextField+LXCategory.h"
#define LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXTextFieldChainModel *,UITextField)

@implementation LXTextFieldChainModel

LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(text, NSString *)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(attributedText, NSAttributedString *)

LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(font, UIFont *)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(textColor, UIColor *)

LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(textAlignment, NSTextAlignment)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(borderStyle, UITextBorderStyle)

LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(defaultTextAttributes, NSDictionary *)

LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(placeholder, NSString *)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(attributedPlaceholder, NSAttributedString *)

LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(keyboardType, UIKeyboardType)

LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(clearsOnBeginEditing, BOOL)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(adjustsFontSizeToFitWidth, BOOL)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(minimumFontSize, CGFloat)

LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(delegate, id<UITextFieldDelegate>)

LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(background, UIImage *)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(disabledBackground, UIImage *)

LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(allowsEditingTextAttributes, BOOL)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(typingAttributes, NSDictionary *)

LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(clearButtonMode, UITextFieldViewMode)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(leftView, UIView *)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(leftViewMode, UITextFieldViewMode)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(rightView, UIView *)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(rightViewMode, UITextFieldViewMode)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(limitLength, NSUInteger)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(inputView, UIView *)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(inputAccessoryView, UIView *)



#pragma mark - UITextInputTraits -
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(autocapitalizationType, UITextAutocapitalizationType);
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(autocorrectionType, UITextAutocorrectionType)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(spellCheckingType, UITextSpellCheckingType)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(smartQuotesType, UITextSmartQuotesType)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(smartInsertDeleteType, UITextSmartInsertDeleteType)
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(smartDashesType, UITextSmartDashesType);
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(keyboardAppearance, UIKeyboardAppearance);
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(returnKeyType, UIReturnKeyType);
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(enablesReturnKeyAutomatically, BOOL);
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(secureTextEntry, BOOL);
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(textContentType, UITextContentType);
LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION(passwordRules, UITextInputPasswordRules *);




- (LXTextFieldChainModel * _Nonnull (^)(UIFont * _Nonnull))placeholderFont{
    return ^(UIFont *font){
        [self.view setValue:font forKeyPath:@"_placeholderLabel.font"];
        return self;
    };
}

- (LXTextFieldChainModel * _Nonnull (^)(UIColor * _Nonnull))placeholderColor{
    return ^(UIColor *color){
        [self.view setValue:color forKeyPath:@"_placeholderLabel.textColor"];
        return self;
    };
}

@end
LXCATEGORY_VIEW_IMPLEMENTATION(UITextField, LXTextFieldChainModel)
#undef LXCATEGORY_CHAIN_TEXTFIELD_IMPLEMENTATION
