//
//  LXBaseLayerChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/3.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseLayerChainModel.h"

#define LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(LXMethod,LXParaType, id, LXBaseLayerChainModel)

@implementation LXBaseLayerChainModel

- (instancetype)initWithLayer:(CALayer *)layer{
    if (self = [super init]) {
        _layer = layer;
        _layerClass = [layer class];
    }
    return self;
}



@end
