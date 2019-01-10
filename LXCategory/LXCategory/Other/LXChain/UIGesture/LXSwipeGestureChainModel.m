//
//  LXSwipeGestureChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXSwipeGestureChainModel.h"
#define LXCATEGORY_CHAIN_SWIPEGESTURE_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(LXMethod,LXParaType, LXSwipeGestureChainModel *, UISwipeGestureRecognizer)
@implementation LXSwipeGestureChainModel
LXCATEGORY_CHAIN_SWIPEGESTURE_IMPLEMENTATION(numberOfTouchesRequired, NSUInteger)
LXCATEGORY_CHAIN_SWIPEGESTURE_IMPLEMENTATION(direction, UISwipeGestureRecognizerDirection)
@end
LXCATEGORY_GESTURE_IMPLEMENTATION(UISwipeGestureRecognizer, LXSwipeGestureChainModel)
#undef LXCATEGORY_CHAIN_SWIPEGESTURE_IMPLEMENTATION
