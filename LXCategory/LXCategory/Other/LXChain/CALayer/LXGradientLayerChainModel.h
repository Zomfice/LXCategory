//
//  LXGradientLayerChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXGradientLayerChainModel;
@interface LXGradientLayerChainModel : LXBaseLayerChainModel<LXGradientLayerChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXGradientLayerChainModel * (^ colors) (NSArray * colors);
LXCATEGORY_CHAIN_PROPERTY LXGradientLayerChainModel * (^ locations) (NSArray<NSNumber *> * locations);
LXCATEGORY_CHAIN_PROPERTY LXGradientLayerChainModel * (^ startPoint) (CGPoint startPoint);
LXCATEGORY_CHAIN_PROPERTY LXGradientLayerChainModel * (^ endPoint) (CGPoint endPoint);
LXCATEGORY_CHAIN_PROPERTY LXGradientLayerChainModel * (^ type) (CAGradientLayerType type);
@end
LXCreateLayer(CAGradientLayer)
LXCATEGORY_EXINTERFACE(CAGradientLayer, LXGradientLayerChainModel)
NS_ASSUME_NONNULL_END
