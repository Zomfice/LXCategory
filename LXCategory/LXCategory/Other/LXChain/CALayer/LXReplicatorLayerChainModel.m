//
//  LXReplicatorLayerChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXReplicatorLayerChainModel.h"
#define LXCATEGORY_CHAIN_REPLICATORLAYER_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXReplicatorLayerChainModel *, CAReplicatorLayer)

@implementation LXReplicatorLayerChainModel
LXCATEGORY_CHAIN_REPLICATORLAYER_IMPLEMENTATION(instanceCount, NSInteger)
LXCATEGORY_CHAIN_REPLICATORLAYER_IMPLEMENTATION(preservesDepth, BOOL)
LXCATEGORY_CHAIN_REPLICATORLAYER_IMPLEMENTATION(instanceDelay, CFTimeInterval)
LXCATEGORY_CHAIN_REPLICATORLAYER_IMPLEMENTATION(instanceTransform, CATransform3D)
LXCATEGORY_CHAIN_REPLICATORLAYER_IMPLEMENTATION(instanceColor, CGColorRef)
LXCATEGORY_CHAIN_REPLICATORLAYER_IMPLEMENTATION(instanceRedOffset, float)
LXCATEGORY_CHAIN_REPLICATORLAYER_IMPLEMENTATION(instanceGreenOffset, float)
LXCATEGORY_CHAIN_REPLICATORLAYER_IMPLEMENTATION(instanceBlueOffset, float)
LXCATEGORY_CHAIN_REPLICATORLAYER_IMPLEMENTATION(instanceAlphaOffset, float)
@end
LXCATEGORY_LAYER_IMPLEMENTATION(CAReplicatorLayer, LXReplicatorLayerChainModel)
#undef LXCATEGORY_CHAIN_REPLICATORLAYER_IMPLEMENTATION
