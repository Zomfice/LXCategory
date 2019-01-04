//
//  LXEmiiterLayerChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXEmiiterLayerChainModel;
@interface LXEmiiterLayerChainModel : LXBaseLayerChainModel<LXEmiiterLayerChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ emitterCells) (NSArray<CAEmitterCell *> * emitterCells);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ birthRate) (float birthRate);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ lifetime) (float lifetime);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ emitterPosition) (CGPoint emitterPosition);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ emitterZPosition) (CGFloat emitterZPosition);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ emitterSize) (CGSize emitterSize);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ emitterDepth) (CGFloat emitterDepth);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ emitterShape) (CAEmitterLayerEmitterShape emitterShape);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ emitterMode) (CAEmitterLayerEmitterMode emitterMode);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ renderMode) (CAEmitterLayerRenderMode renderMode);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ preservesDepth) (BOOL preservesDepth);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ velocity) (float velocity);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ scale) (float scale);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ spin) (float spin);
LXCATEGORY_CHAIN_PROPERTY LXEmiiterLayerChainModel * (^ seed) (unsigned int seed);

@end
LXCreateLayer(CAEmitterLayer)
LXCATEGORY_EXINTERFACE(CAEmitterLayer, LXEmiiterLayerChainModel)
NS_ASSUME_NONNULL_END
