//
//  LXRotationGestureChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXRotationGestureChainModel.h"
#define LXCATEGORY_CHAIN_ROTAGESTURE_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(LXMethod,LXParaType, LXRotationGestureChainModel *, UIRotationGestureRecognizer)
@implementation LXRotationGestureChainModel
LXCATEGORY_CHAIN_ROTAGESTURE_IMPLEMENTATION(rotation, CGFloat)
@end
LXCATEGORY_GESTURE_IMPLEMENTATION(UIRotationGestureRecognizer, LXRotationGestureChainModel)
