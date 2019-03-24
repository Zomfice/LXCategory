//
//  LXTransFormLayerChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXTransFormLayerChainModel.h"
#define LXCATEGORY_CHAIN_TRANSFORMLAYER_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXTransFormLayerChainModel *, CATransformLayer)

@implementation LXTransFormLayerChainModel

@end
LXCATEGORY_LAYER_IMPLEMENTATION(CATransformLayer, LXTransFormLayerChainModel)
#undef LXCATEGORY_CHAIN_TRANSFORMLAYER_IMPLEMENTATION
