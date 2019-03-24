//
//  LXVisualEffectViewChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXVisualEffectViewChainModel.h"
#define LXCATEGORY_CHAIN_VISUALEFFECT_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXVisualEffectViewChainModel *,UIVisualEffectView)
LXCATEGORY_VIEW_IMPLEMENTATION(UIVisualEffectView, LXVisualEffectViewChainModel)
@implementation LXVisualEffectViewChainModel
LXCATEGORY_CHAIN_VISUALEFFECT_IMPLEMENTATION( effect,UIVisualEffect*)
@end
#undef LXCATEGORY_CHAIN_VISUALEFFECT_IMPLEMENTATION
