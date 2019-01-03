//
//  LXBaseLayerChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/3.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXChainDefine.h"

#define LXCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXModelType, LXPropertyClass) LXCATEGORY_CHAIN_IMPLEMENTATION(LXMethod,LXParaType, layer, LXModelType, LXPropertyClass)

#define LXCATEGORY_LAYER_IMPLEMENTATION(LXClass, modelType)\
@implementation LXClass (EXT)\
- (modelType *)makeChain{\
    return [[modelType alloc] initWithLayer:self];\
}\
@end
NS_ASSUME_NONNULL_BEGIN

@interface LXBaseLayerChainModel <__covariant  ObjectType> : NSObject

- (instancetype)initWithLayer:(CALayer *)layer;

@property (nonatomic, strong, readonly) CALayer * layer;

@property (nonatomic, assign, readonly) Class  layerClass;

//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);
//
//LXCATEGORY_CHAIN_PROPERTY ObjectType (^ <#statements#>) (<#statements#> <#statements#>);

@end

NS_ASSUME_NONNULL_END
