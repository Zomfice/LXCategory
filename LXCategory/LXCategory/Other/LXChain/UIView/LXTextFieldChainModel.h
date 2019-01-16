//
//  LXTextFieldChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseControllChainModel.h"
NS_ASSUME_NONNULL_BEGIN

@class LXTextFieldChainModel;
@interface LXTextFieldChainModel : LXBaseControllChainModel<LXTextFieldChainModel*>

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ text)(NSString *text);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ attributedText)(NSAttributedString *attributedText);

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ font)(UIFont *font);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ textColor)(UIColor *textColor);

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ textAlignment)(NSTextAlignment textAlignment);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ borderStyle)(UITextBorderStyle borderStyle);

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ defaultTextAttributes)(NSDictionary *defaultTextAttributes);

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ placeholder)(NSString *placeholder);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ attributedPlaceholder)(NSAttributedString *attributedPlaceholder);

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ clearsOnBeginEditing)(BOOL clearsOnBeginEditing);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ adjustsFontSizeToFitWidth)(BOOL adjustsFontSizeToFitWidth);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ minimumFontSize)(CGFloat minimumFontSize);

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ delegate)(id<UITextFieldDelegate> delegate);

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ background)(UIImage *background);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ disabledBackground)(UIImage *disabledBackground);

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ allowsEditingTextAttributes)(BOOL allowsEditingTextAttributes);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ typingAttributes)(NSDictionary *typingAttributes);

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ clearButtonMode)(UITextFieldViewMode clearButtonMode);

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ leftView)(UIView *leftView);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ leftViewMode)(UITextFieldViewMode leftViewMode);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ rightView)(UIView *rightView);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ rightViewMode)(UITextFieldViewMode rightViewMode);

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ limitLength) (NSUInteger limitLength);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ inputView)(UIView *inputView);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ inputAccessoryView)(UIView *inputAccessoryView);

LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ placeholderFont)(UIFont *font);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ placeholderColor)(UIColor *color);


#pragma mark - UITextInputTraits - 
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ autocapitalizationType)(UITextAutocapitalizationType autocapitalizationType);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ autocorrectionType)(UITextAutocorrectionType autocorrectionType);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ spellCheckingType)(UITextSpellCheckingType spellCheckingType);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ smartQuotesType)(UITextSmartQuotesType smartQuotesType);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ smartDashesType)(UITextSmartDashesType smartDashesType);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ smartInsertDeleteType)(UITextSmartInsertDeleteType smartInsertDeleteType);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ keyboardType)(UIKeyboardType keyboardType);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ keyboardAppearance)(UIKeyboardAppearance keyboardAppearance);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ returnKeyType)(UIReturnKeyType returnKeyType);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ enablesReturnKeyAutomatically)(BOOL enablesReturnKeyAutomatically);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ secureTextEntry)(BOOL secureTextEntry);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ textContentType)(UITextContentType textContentType);
LXCATEGORY_CHAIN_PROPERTY LXTextFieldChainModel *(^ passwordRules)(UITextInputPasswordRules* passwordRules);
@end
LXCreate(UITextField)
LXCATEGORY_EXINTERFACE(UITextField, LXTextFieldChainModel)
NS_ASSUME_NONNULL_END
