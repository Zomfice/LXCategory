//
//  LXLabelChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXLabelChainModel;
@interface LXLabelChainModel : LXBaseViewChainModel<LXLabelChainModel *>

LXCATEGORY_CHAIN_PROPERTY LXLabelChainModel *(^ text)(NSString *text);
LXCATEGORY_CHAIN_PROPERTY LXLabelChainModel *(^ font)(UIFont *font);
LXCATEGORY_CHAIN_PROPERTY LXLabelChainModel *(^ textColor)(UIColor *textColor);
LXCATEGORY_CHAIN_PROPERTY LXLabelChainModel *(^ attributedText)(NSAttributedString *attributedText);
LXCATEGORY_CHAIN_PROPERTY LXLabelChainModel *(^ textAlignment)(NSTextAlignment textAlignment);
LXCATEGORY_CHAIN_PROPERTY LXLabelChainModel *(^ numberOfLines)(NSInteger numberOfLines);
LXCATEGORY_CHAIN_PROPERTY LXLabelChainModel *(^ lineBreakMode)(NSLineBreakMode lineBreakMode);
LXCATEGORY_CHAIN_PROPERTY LXLabelChainModel *(^ adjustsFontSizeToFitWidth)(BOOL adjustsFontSizeToFitWidth);

@end

LXCATEGORY_EXINTERFACE(UILabel, LXLabelChainModel)
NS_ASSUME_NONNULL_END
