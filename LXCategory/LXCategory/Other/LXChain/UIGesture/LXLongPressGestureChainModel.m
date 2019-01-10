//
//  LXLongPressGestureChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXLongPressGestureChainModel.h"
#define LXCATEGORY_CHAIN_LONGGESTURE_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(LXMethod,LXParaType, LXLongPressGestureChainModel *, UILongPressGestureRecognizer)
@implementation LXLongPressGestureChainModel
LXCATEGORY_CHAIN_LONGGESTURE_IMPLEMENTATION(numberOfTapsRequired, NSUInteger)
LXCATEGORY_CHAIN_LONGGESTURE_IMPLEMENTATION(minimumPressDuration, NSTimeInterval)
LXCATEGORY_CHAIN_LONGGESTURE_IMPLEMENTATION(allowableMovement, CGFloat)
@end
LXCATEGORY_GESTURE_IMPLEMENTATION(UILongPressGestureRecognizer, LXLongPressGestureChainModel)
#undef LXCATEGORY_CHAIN_LONGGESTURE_IMPLEMENTATION
