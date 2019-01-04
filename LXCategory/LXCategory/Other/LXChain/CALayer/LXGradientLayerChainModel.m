//
//  LXGradientLayerChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXGradientLayerChainModel.h"
#define LXCATEGORY_CHAIN_GRADIENTLAYER_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXGradientLayerChainModel *, CAGradientLayer)

@implementation LXGradientLayerChainModel
LXCATEGORY_CHAIN_GRADIENTLAYER_IMPLEMENTATION(colors, NSArray *)
LXCATEGORY_CHAIN_GRADIENTLAYER_IMPLEMENTATION(locations, NSArray<NSNumber *> *)
LXCATEGORY_CHAIN_GRADIENTLAYER_IMPLEMENTATION(startPoint, CGPoint)
LXCATEGORY_CHAIN_GRADIENTLAYER_IMPLEMENTATION(endPoint, CGPoint)
LXCATEGORY_CHAIN_GRADIENTLAYER_IMPLEMENTATION(type, CAGradientLayerType)
@end
LXCATEGORY_LAYER_IMPLEMENTATION(CAGradientLayer, LXGradientLayerChainModel)
