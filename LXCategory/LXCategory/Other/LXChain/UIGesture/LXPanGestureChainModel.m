//
//  LXPanGestureChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXPanGestureChainModel.h"
#define LXCATEGORY_CHAIN_PANGESTURE_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(LXMethod,LXParaType, LXPanGestureChainModel *, UIPanGestureRecognizer)
@implementation LXPanGestureChainModel
LXCATEGORY_CHAIN_PANGESTURE_IMPLEMENTATION(minimumNumberOfTouches, NSUInteger)
LXCATEGORY_CHAIN_PANGESTURE_IMPLEMENTATION(maximumNumberOfTouches, NSUInteger)

- (LXPanGestureChainModel * _Nonnull (^)(CGPoint, UIView * _Nonnull))translation{
    return ^ (CGPoint translation, UIView *view){
        [(UIPanGestureRecognizer *)self.gesture setTranslation:translation inView:view];
        return self;
    };
}
@end
LXCATEGORY_GESTURE_IMPLEMENTATION(UIPanGestureRecognizer, LXPanGestureChainModel)
#undef LXCATEGORY_CHAIN_PANGESTURE_IMPLEMENTATION
