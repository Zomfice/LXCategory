//
//  LXTableViewCellChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/28.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXTableViewCellChainModel.h"

#define LXCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXTableViewCellChainModel *,UITableViewCell)
@implementation LXTableViewCellChainModel

LXCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(selectionStyle, UITableViewCellSelectionStyle)
LXCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(accessoryType, UITableViewCellAccessoryType)
LXCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(separatorInset, UIEdgeInsets)
LXCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(editing, BOOL)
LXCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(focusStyle, UITableViewCellFocusStyle)
LXCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION(userInteractionEnabledWhileDragging, BOOL)

- (LXTableViewCellChainModel * _Nonnull (^)(BOOL, BOOL))editingWithAnimated{
    return ^ (BOOL editing, BOOL animated){
        [(UITableViewCell *)self.view setEditing:editing animated:animated];
        return self;
    };
}
- (LXTableViewCellChainModel * _Nonnull (^)(void))reloadData{
    return ^ (){
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        [(UICollectionView *)self.view reloadData];
        [CATransaction commit];
        
        return self;
    };
}
@end
LXCATEGORY_VIEW_IMPLEMENTATION(UITableViewCell, LXTableViewCellChainModel)
#undef LXCATEGORY_CHAIN_TABLEVIEWCELL_IMPLEMENTATION
