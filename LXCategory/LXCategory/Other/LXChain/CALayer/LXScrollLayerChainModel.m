//
//  LXScrollLayerChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXScrollLayerChainModel.h"
#define LXCATEGORY_CHAIN_SCROLLLAYER_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXScrollLayerChainModel *, CAScrollLayer)

@implementation LXScrollLayerChainModel
LXCATEGORY_CHAIN_SCROLLLAYER_IMPLEMENTATION(scrollMode, CAScrollLayerScrollMode)

- (LXScrollLayerChainModel * _Nonnull (^)(CGRect))scrollToRect{
    return ^ (CGRect rect){
        [(CAScrollLayer *)self.layer scrollToRect:rect];
        return self;
    };
}

- (LXScrollLayerChainModel * _Nonnull (^)(CGPoint))scrollToPoint{
    return ^ (CGPoint point){
       [(CAScrollLayer *)self.layer scrollToPoint:point];
        return self;
    };
}

@end
LXCATEGORY_LAYER_IMPLEMENTATION(CAScrollLayer, LXScrollLayerChainModel)
#undef LXCATEGORY_CHAIN_SCROLLLAYER_IMPLEMENTATION
