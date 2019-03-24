//
//  LXTextLayerChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseLayerChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXTextLayerChainModel;
@interface LXTextLayerChainModel : LXBaseLayerChainModel<LXTextLayerChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXTextLayerChainModel * (^ string) (id string);
LXCATEGORY_CHAIN_PROPERTY LXTextLayerChainModel * (^ font) (CFTypeRef font);
LXCATEGORY_CHAIN_PROPERTY LXTextLayerChainModel * (^ fontSize) (CGFloat fontSize);
LXCATEGORY_CHAIN_PROPERTY LXTextLayerChainModel * (^ foregroundColor) (CGColorRef foregroundColor);
LXCATEGORY_CHAIN_PROPERTY LXTextLayerChainModel * (^ wrapped) (BOOL wrapped);
LXCATEGORY_CHAIN_PROPERTY LXTextLayerChainModel * (^ truncationMode) (CATextLayerTruncationMode truncationMode);
LXCATEGORY_CHAIN_PROPERTY LXTextLayerChainModel * (^ alignmentMode) (CATextLayerAlignmentMode alignmentMode);
LXCATEGORY_CHAIN_PROPERTY LXTextLayerChainModel * (^ allowsFontSubpixelQuantization) (BOOL allowsFontSubpixelQuantization);

@end
LXCreateLayer(CATextLayer)
LXCATEGORY_EXINTERFACE(CATextLayer, LXTextLayerChainModel)
NS_ASSUME_NONNULL_END
