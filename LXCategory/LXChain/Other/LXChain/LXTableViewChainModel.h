//
//  LXTableViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXScrollViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXTableViewChainModel;
@interface LXTableViewChainModel : LXScrollViewChainModel<LXTableViewChainModel *>

LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel * (^ delegate) (id <UITableViewDelegate> delegate);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel * (^ dataSource) (id <UITableViewDataSource> dataSource);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel * (^ adJustedContentIOS11)(void);

LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ rowHeight)(CGFloat rowHeight);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ sectionHeaderHeight)(CGFloat sectionHeaderHeight);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ sectionFooterHeight)(CGFloat sectionFooterHeight);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ estimatedRowHeight)(CGFloat estimatedRowHeight);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ estimatedSectionHeaderHeight)(CGFloat estimatedSectionHeaderHeight);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ estimatedSectionFooterHeight)(CGFloat estimatedSectionFooterHeight);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ separatorInset)(UIEdgeInsets separatorInset);

LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ editing)(BOOL editing);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ allowsSelection)(BOOL allowsSelection);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ allowsMultipleSelection)(BOOL allowsMultipleSelection);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ allowsSelectionDuringEditing)(BOOL allowsSelectionDuringEditing);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ allowsMultipleSelectionDuringEditing)(BOOL allowsMultipleSelectionDuringEditing);

LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ separatorStyle)(UITableViewCellSeparatorStyle separatorStyle);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ separatorColor)(UIColor *separatorColor);

LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ tableHeaderView)(UIView * tableHeaderView);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ tableFooterView)(UIView * tableFooterView);

LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ sectionIndexBackgroundColor)(UIColor *sectionIndexBackgroundColor);
LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ sectionIndexColor)(UIColor *sectionIndexColor);

LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ registerCellClass)(Class cellClass, NSString *identifier);

LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ registerCellNib)(UINib * nib, NSString *identifier);

LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ registerViewClass)(Class viewClass, NSString *identifier);

LXCATEGORY_CHAIN_PROPERTY LXTableViewChainModel *(^ registerViewNib)(UINib * viewNib, NSString *identifier);

@end

LXCreate(UITableView)
static inline UITableView * UITableViewCreateWithStyle(UITableViewStyle style){
    return [[UITableView alloc]initWithFrame:CGRectZero style:style];
}
LXCATEGORY_EXINTERFACE(UITableView, LXTableViewChainModel)
NS_ASSUME_NONNULL_END
