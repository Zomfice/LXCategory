//
//  LXTiledLayerChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXTiledLayerChainModel.h"
#define LXCATEGORY_CHAIN_TILEDLAYER_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXTiledLayerChainModel *, CATiledLayer)

@implementation LXTiledLayerChainModel
LXCATEGORY_CHAIN_TILEDLAYER_IMPLEMENTATION(levelsOfDetail, size_t)
LXCATEGORY_CHAIN_TILEDLAYER_IMPLEMENTATION(levelsOfDetailBias,size_t)
LXCATEGORY_CHAIN_TILEDLAYER_IMPLEMENTATION(tileSize,CGSize)
@end
LXCATEGORY_LAYER_IMPLEMENTATION(CATiledLayer, LXTiledLayerChainModel)
#undef LXCATEGORY_CHAIN_TILEDLAYER_IMPLEMENTATION
