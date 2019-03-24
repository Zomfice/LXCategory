//
//  CALayer+LXChain.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/4.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "CALayer+LXChain.h"
#define LXCATEGORY_ADDSUBLAYER(method, modelClass, LayerClass)\
- (modelClass * _Nonnull (^)(void))method{\
return ^ (){\
LayerClass *layer = [LayerClass layer];\
modelClass *chainModel = [[modelClass alloc] initWithLayer:layer];\
[self addSublayer:layer];\
return chainModel;\
};\
}
@implementation CALayer (LXChain)
LXCATEGORY_ADDSUBLAYER(addLayer, LXLayerChainModel, CALayer)
LXCATEGORY_ADDSUBLAYER(addShaperLayer, LXShaperLayerChainModel, CAShapeLayer)
LXCATEGORY_ADDSUBLAYER(addEmiiterLayer, LXEmiiterLayerChainModel, CAEmitterLayer)
LXCATEGORY_ADDSUBLAYER(addScrollLayer, LXScrollLayerChainModel, CAScrollLayer)
LXCATEGORY_ADDSUBLAYER(addTextLayer, LXTextLayerChainModel, CATextLayer)
LXCATEGORY_ADDSUBLAYER(addTiledLayer, LXTiledLayerChainModel, CATiledLayer)
LXCATEGORY_ADDSUBLAYER(addTransFormLayer, LXTransFormLayerChainModel, CATransformLayer)
LXCATEGORY_ADDSUBLAYER(addGradientLayer, LXGradientLayerChainModel, CAGradientLayer)
LXCATEGORY_ADDSUBLAYER(addReplicatorLayer, LXReplicatorLayerChainModel, CAReplicatorLayer)
@end
#undef LXCATEGORY_ADDSUBLAYER
