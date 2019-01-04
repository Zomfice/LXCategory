//
//  LXReplicatorLayerChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXReplicatorLayerChainModel;
@interface LXReplicatorLayerChainModel : LXBaseLayerChainModel<LXReplicatorLayerChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXReplicatorLayerChainModel * (^ instanceCount) (NSInteger instanceCount);
LXCATEGORY_CHAIN_PROPERTY LXReplicatorLayerChainModel * (^ preservesDepth) (BOOL preservesDepth);
LXCATEGORY_CHAIN_PROPERTY LXReplicatorLayerChainModel * (^ instanceDelay) (CFTimeInterval instanceDelay);
LXCATEGORY_CHAIN_PROPERTY LXReplicatorLayerChainModel * (^ instanceTransform) (CATransform3D instanceTransform);
LXCATEGORY_CHAIN_PROPERTY LXReplicatorLayerChainModel * (^ instanceColor) (CGColorRef instanceColor);
LXCATEGORY_CHAIN_PROPERTY LXReplicatorLayerChainModel * (^ instanceRedOffset) (float instanceRedOffset);
LXCATEGORY_CHAIN_PROPERTY LXReplicatorLayerChainModel * (^ instanceGreenOffset) (float instanceGreenOffset);
LXCATEGORY_CHAIN_PROPERTY LXReplicatorLayerChainModel * (^ instanceBlueOffset) (float instanceBlueOffset);
LXCATEGORY_CHAIN_PROPERTY LXReplicatorLayerChainModel * (^ instanceAlphaOffset) (float instanceAlphaOffset);
@end
LXCreateLayer(CAReplicatorLayer)
LXCATEGORY_EXINTERFACE(CAReplicatorLayer, LXReplicatorLayerChainModel)
NS_ASSUME_NONNULL_END
