//
//  LXShaperLayerChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXShaperLayerChainModel;
@interface LXShaperLayerChainModel : LXBaseLayerChainModel<LXShaperLayerChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXShaperLayerChainModel * (^ path) (CGPathRef path);
LXCATEGORY_CHAIN_PROPERTY LXShaperLayerChainModel * (^ fillColor) (CGColorRef fillColor);
LXCATEGORY_CHAIN_PROPERTY LXShaperLayerChainModel * (^ fillRule) (CAShapeLayerFillRule fillRule);
LXCATEGORY_CHAIN_PROPERTY LXShaperLayerChainModel * (^ strokeColor) (CGColorRef strokeColor);
LXCATEGORY_CHAIN_PROPERTY LXShaperLayerChainModel * (^ strokeStart) (CGFloat strokeStart);
LXCATEGORY_CHAIN_PROPERTY LXShaperLayerChainModel * (^ strokeEnd) (CGFloat strokeEnd);
LXCATEGORY_CHAIN_PROPERTY LXShaperLayerChainModel * (^ lineWidth) (CGFloat lineWidth);
LXCATEGORY_CHAIN_PROPERTY LXShaperLayerChainModel * (^ miterLimit) (CGFloat miterLimit);
LXCATEGORY_CHAIN_PROPERTY LXShaperLayerChainModel * (^ lineCap) (CAShapeLayerLineCap lineCap);
LXCATEGORY_CHAIN_PROPERTY LXShaperLayerChainModel * (^ lineJoin) (CAShapeLayerLineJoin lineJoin);
LXCATEGORY_CHAIN_PROPERTY LXShaperLayerChainModel * (^ lineDashPhase) (CGFloat lineDashPhase);
LXCATEGORY_CHAIN_PROPERTY LXShaperLayerChainModel * (^ lineDashPattern) (NSArray<NSNumber *> * lineDashPattern);
@end
LXCreateLayer(CAShapeLayer)
LXCATEGORY_EXINTERFACE(CAShapeLayer, LXShaperLayerChainModel)
NS_ASSUME_NONNULL_END
