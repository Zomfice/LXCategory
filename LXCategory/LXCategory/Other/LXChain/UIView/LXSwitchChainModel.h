//
//  LXSwitchChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@class LXSwitchChainModel;
@interface LXSwitchChainModel : LXBaseControlChainModel<LXSwitchChainModel *>

LXCATEGORY_CHAIN_PROPERTY LXSwitchChainModel *(^ on)(BOOL on);
LXCATEGORY_CHAIN_PROPERTY LXSwitchChainModel *(^ onTintColor)(UIColor *onTintColor);
LXCATEGORY_CHAIN_PROPERTY LXSwitchChainModel *(^ thumbTintColor)(UIColor *thumbTintColor);

LXCATEGORY_CHAIN_PROPERTY LXSwitchChainModel *(^ onImage)(UIImage *onImage);
LXCATEGORY_CHAIN_PROPERTY LXSwitchChainModel *(^ offImage)(UIImage *offImage);

@end
LXCreate(UISwitch)
LXCATEGORY_EXINTERFACE(UISwitch, LXSwitchChainModel)
NS_ASSUME_NONNULL_END
