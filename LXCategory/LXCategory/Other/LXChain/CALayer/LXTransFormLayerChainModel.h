//
//  LXTransFormLayerChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXTransFormLayerChainModel;
@interface LXTransFormLayerChainModel : LXBaseLayerChainModel<LXTransFormLayerChainModel *>

@end
LXCreateLayer(CATransformLayer)
LXCATEGORY_EXINTERFACE(CATransformLayer, LXTransFormLayerChainModel)
NS_ASSUME_NONNULL_END
