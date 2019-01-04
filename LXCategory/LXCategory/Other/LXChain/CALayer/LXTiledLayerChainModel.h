//
//  LXTiledLayerChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXTiledLayerChainModel;
@interface LXTiledLayerChainModel : LXBaseLayerChainModel<LXTiledLayerChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXTiledLayerChainModel * (^ levelsOfDetail) (size_t levelsOfDetail);
LXCATEGORY_CHAIN_PROPERTY LXTiledLayerChainModel * (^ levelsOfDetailBias) (size_t levelsOfDetailBias);
LXCATEGORY_CHAIN_PROPERTY LXTiledLayerChainModel * (^ tileSize) (CGSize tileSize);
@end
LXCreateLayer(CATiledLayer)
LXCATEGORY_EXINTERFACE(CATiledLayer, LXTiledLayerChainModel)
NS_ASSUME_NONNULL_END
