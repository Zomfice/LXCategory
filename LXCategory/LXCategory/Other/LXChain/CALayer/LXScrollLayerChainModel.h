//
//  LXScrollLayerChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXScrollLayerChainModel;
@interface LXScrollLayerChainModel : LXBaseLayerChainModel<LXScrollLayerChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXScrollLayerChainModel * (^ scrollToPoint) (CGPoint point);
LXCATEGORY_CHAIN_PROPERTY LXScrollLayerChainModel * (^ scrollToRect) (CGRect rect);
LXCATEGORY_CHAIN_PROPERTY LXScrollLayerChainModel * (^ scrollMode) (CAScrollLayerScrollMode scrollMode);
@end
LXCreateLayer(CAScrollLayer)
LXCATEGORY_EXINTERFACE(CAScrollLayer, LXScrollLayerChainModel)
NS_ASSUME_NONNULL_END
