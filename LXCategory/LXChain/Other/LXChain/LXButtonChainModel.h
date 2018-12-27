//
//  LXButtonChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@class LXButtonChainModel;
@interface LXButtonChainModel : LXBaseViewChainModel<LXButtonChainModel *>

LXCONTROLSUPERCHAINMODEL_INTEFACE(LXButtonChainModel)

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ contentEdgeInsets)(UIEdgeInsets contentEdgeInsets);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ titleEdgeInsets)(UIEdgeInsets titleEdgeInsets);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ imageEdgeInsets)(UIEdgeInsets imageEdgeInsets);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ adjustsImageWhenHighlighted) (BOOL adjustsImageWhenHighlighted);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ showsTouchWhenHighlighted) (BOOL showsTouchWhenHighlighted);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ adjustsImageWhenDisabled) (BOOL adjustsImageWhenDisabled);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ reversesTitleShadowWhenHighlighted) (BOOL reversesTitleShadowWhenHighlighted);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ image) (UIImage *image, UIControlState state);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ text) (NSString *title, UIControlState state);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ textColor) (UIColor *color, UIControlState state);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel * (^ backgroundImage) (UIImage *image, UIControlState state);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ attributedTitle) (NSAttributedString *title, UIControlState state);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ titleShadow) (UIColor *color, UIControlState state);

LXCATEGORY_CHAIN_PROPERTY LXButtonChainModel *(^ font) (UIFont *font);

@end
LXCATEGORY_EXINTERFACE(UIButton, LXButtonChainModel)
NS_ASSUME_NONNULL_END
