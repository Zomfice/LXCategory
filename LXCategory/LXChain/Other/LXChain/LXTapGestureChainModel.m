//
//  LXTapGestureChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXTapGestureChainModel.h"

#define LXCATEGORY_CHAIN_TAPGESTURE_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(LXMethod,LXParaType, LXTapGestureChainModel *, UITapGestureRecognizer)
@implementation LXTapGestureChainModel
LXCATEGORY_CHAIN_TAPGESTURE_IMPLEMENTATION(numberOfTapsRequired,NSUInteger)
@end
LXCATEGORY_GESTURE_IMPLEMENTATION(UITapGestureRecognizer, LXTapGestureChainModel)
