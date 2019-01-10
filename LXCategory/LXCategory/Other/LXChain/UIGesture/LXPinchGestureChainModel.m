//
//  LXPinchGestureChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXPinchGestureChainModel.h"
#define LXCATEGORY_CHAIN_PINGESTURE_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(LXMethod,LXParaType, LXPinchGestureChainModel *, UIPinchGestureRecognizer)
@implementation LXPinchGestureChainModel
LXCATEGORY_CHAIN_PINGESTURE_IMPLEMENTATION(scale, CGFloat)
@end
LXCATEGORY_GESTURE_IMPLEMENTATION(UIPinchGestureRecognizer, LXPinchGestureChainModel)
#undef LXCATEGORY_CHAIN_PINGESTURE_IMPLEMENTATION
