//
//  LXTableViewCellChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/28.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXTableViewCellChainModel;
@interface LXTableViewCellChainModel : LXBaseViewChainModel<LXTableViewCellChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXTableViewCellChainModel * (^ selectionStyle) (UITableViewCellSelectionStyle selectionStyle);
LXCATEGORY_CHAIN_PROPERTY LXTableViewCellChainModel * (^ accessoryType) (UITableViewCellAccessoryType selectionStyle);
LXCATEGORY_CHAIN_PROPERTY LXTableViewCellChainModel * (^ separatorInset) (UIEdgeInsets separatorInset);
LXCATEGORY_CHAIN_PROPERTY LXTableViewCellChainModel * (^ editing) (BOOL editing);
LXCATEGORY_CHAIN_PROPERTY LXTableViewCellChainModel * (^ editingWithAnimated) (BOOL editing, BOOL animated);
LXCATEGORY_CHAIN_PROPERTY LXTableViewCellChainModel * (^ focusStyle)(UITableViewCellFocusStyle focusStyle);
LXCATEGORY_CHAIN_PROPERTY LXTableViewCellChainModel * (^ userInteractionEnabledWhileDragging)(BOOL userInteractionEnabledWhileDragging);

@end
LXCATEGORY_EXINTERFACE(UITableViewCell, LXTableViewCellChainModel)
NS_ASSUME_NONNULL_END
