//
//  LXTextViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXScrollViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXTextViewChainModel;
@interface LXTextViewChainModel : LXBaseViewChainModel<LXTextViewChainModel *>
LXSCROLLVIEWSUPERCHAINMODEL_INTEFACE(LXTextViewChainModel)


LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ delegate)(id<UITextViewDelegate> delegate);

LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ text)(NSString *text);
LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ font)(UIFont *font);
LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ textColor)(UIColor *textColor);

LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ textAlignment)(NSTextAlignment textAlignment);
LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ selectedRange)(NSRange numberOfLines);
LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ editable)(BOOL editable);
LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ selectable)(BOOL selectable);
LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ dataDetectorTypes)(UIDataDetectorTypes dataDetectorTypes);

LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ keyboardType)(UIKeyboardType keyboardType);

LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ allowsEditingTextAttributes)(BOOL allowsEditingTextAttributes);
LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ attributedText)(NSAttributedString *attributedText);
LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ typingAttributes)(NSDictionary *typingAttributes);

LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ clearsOnInsertion)(BOOL clearsOnInsertion);

LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ textContainerInset)(UIEdgeInsets textContainerInset);
LXCATEGORY_CHAIN_PROPERTY LXTextViewChainModel *(^ linkTextAttributes)(NSDictionary *linkTextAttributes);
@end
LXCATEGORY_EXINTERFACE(UITextView, LXTextViewChainModel)
NS_ASSUME_NONNULL_END
