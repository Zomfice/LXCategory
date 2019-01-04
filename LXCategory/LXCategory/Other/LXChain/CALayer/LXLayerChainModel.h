//
//  LXLayerChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXLayerChainModel;
@interface LXLayerChainModel : LXBaseLayerChainModel<LXLayerChainModel *>

@end
LXCreateLayer(CALayer)
LXCATEGORY_EXINTERFACE(CALayer, LXLayerChainModel)
NS_ASSUME_NONNULL_END
