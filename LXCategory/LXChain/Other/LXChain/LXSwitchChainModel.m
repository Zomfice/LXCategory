//
//  LXSwitchChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXSwitchChainModel.h"
#define LXCATEGORY_CHAIN_SWITCH_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXSwitchChainModel *,UISwitch)
@implementation LXSwitchChainModel

LXCATEGORY_CHAIN_SWITCH_IMPLEMENTATION(on, BOOL);
LXCATEGORY_CHAIN_SWITCH_IMPLEMENTATION(onTintColor, UIColor *);
LXCATEGORY_CHAIN_SWITCH_IMPLEMENTATION(thumbTintColor, UIColor *);

LXCATEGORY_CHAIN_SWITCH_IMPLEMENTATION(onImage, UIImage *);
LXCATEGORY_CHAIN_SWITCH_IMPLEMENTATION(offImage, UIImage *);

@end
LXCATEGORY_VIEW_IMPLEMENTATION(UISwitch, LXSwitchChainModel)
