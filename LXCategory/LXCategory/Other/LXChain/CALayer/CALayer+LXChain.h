//
//  CALayer+LXChain.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "LXLayerChainHeader.h"
NS_ASSUME_NONNULL_BEGIN

@interface CALayer (LXChain)

LXCATEGORY_STRONG_PROPERTY LXLayerChainModel *(^ addLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXShaperLayerChainModel *(^ addShaperLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXEmiiterLayerChainModel *(^ addEmiiterLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXScrollLayerChainModel *(^ addScrollLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXTextLayerChainModel *(^ addTextLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXTiledLayerChainModel *(^ addTiledLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXTransFormLayerChainModel *(^ addTransFormLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXGradientLayerChainModel *(^ addGradientLayer)(void);

LXCATEGORY_STRONG_PROPERTY LXReplicatorLayerChainModel *(^ addReplicatorLayer)(void);

@end

NS_ASSUME_NONNULL_END
