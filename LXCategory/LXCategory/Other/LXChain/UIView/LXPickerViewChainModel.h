//
//  LXPickerViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXPickerViewChainModel;
@interface LXPickerViewChainModel : LXBaseViewChainModel<LXPickerViewChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXPickerViewChainModel * (^ dataSource) (id<UIPickerViewDataSource> dataSource);
LXCATEGORY_CHAIN_PROPERTY LXPickerViewChainModel * (^ delegate) (id<UIPickerViewDelegate> delegate);
LXCATEGORY_CHAIN_PROPERTY LXPickerViewChainModel * (^ showsSelectionIndicator) (BOOL showsSelectionIndicator);
LXCATEGORY_CHAIN_PROPERTY NSInteger (^ numberOfRowsInComponent) (NSInteger component);
LXCATEGORY_CHAIN_PROPERTY CGSize (^ rowSizeForComponent) (NSInteger component);
LXCATEGORY_CHAIN_PROPERTY UIView * (^ viewForRowComponent) (NSInteger row, NSInteger component);
LXCATEGORY_CHAIN_PROPERTY LXPickerViewChainModel * (^ reloadAllComponents) (void);
LXCATEGORY_CHAIN_PROPERTY LXPickerViewChainModel * (^ reloadComponent) (NSInteger component);
LXCATEGORY_CHAIN_PROPERTY LXPickerViewChainModel * (^ selectRowInComponent) (NSInteger row, NSInteger component, BOOL animated);
LXCATEGORY_CHAIN_PROPERTY NSInteger (^ selectedRowInComponent) (NSInteger component);

@end
LXCreate(UIPickerView)
LXCATEGORY_EXINTERFACE(UIPickerView, LXPickerViewChainModel)
NS_ASSUME_NONNULL_END
