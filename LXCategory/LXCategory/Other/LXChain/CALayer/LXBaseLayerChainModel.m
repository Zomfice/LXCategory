//
//  LXBaseLayerChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/3.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseLayerChainModel.h"

#define LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_LAYERCLASS_IMPLEMENTATION(LXMethod,LXParaType, id, CALayer)

@implementation LXBaseLayerChainModel

- (instancetype)initWithLayer:(CALayer *)layer{
    if (self = [super init]) {
        _layer = layer;
        _layerClass = [layer class];
    }
    return self;
}

LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(bounds, CGRect)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(frame, CGRect)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(position, CGPoint)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(anchorPoint, CGPoint)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(zPosition, CGFloat)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(anchorPointZ, CGFloat)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(rasterizationScale, CGFloat)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(transform, CATransform3D)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(affineTransform, CGAffineTransform)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(hidden, BOOL)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(doubleSided, BOOL)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(geometryFlipped, BOOL)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(masksToBounds, BOOL)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(mask, CALayer *)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(contents, id)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(contentsRect, CGRect)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(contentsGravity, CALayerContentsGravity)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(contentsScale, CGFloat)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(contentsCenter, CGRect)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(contentsFormat, CALayerContentsFormat)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(minificationFilter, CALayerContentsFilter)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(magnificationFilter, CALayerContentsFilter)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(minificationFilterBias, float)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(opaque, BOOL)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(needsDisplayOnBoundsChange, BOOL)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(drawsAsynchronously, BOOL)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(edgeAntialiasingMask, CAEdgeAntialiasingMask)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(allowsEdgeAntialiasing, BOOL)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(backgroundColor, CGColorRef)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(cornerRadius, CGFloat)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(maskedCorners, CACornerMask)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(borderWidth, CGFloat)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(borderColor, CGColorRef)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(opacity, float)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(allowsGroupOpacity, BOOL)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(compositingFilter, id)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(filters, NSArray*)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(backgroundFilters, NSArray*)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(shouldRasterize, BOOL)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(shadowColor, CGColorRef)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(shadowOpacity, float)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(shadowOffset, CGSize)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(shadowRadius, CGFloat)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(shadowPath, CGPathRef)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(name, NSString *)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(delegate, id <CALayerDelegate>)
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(style, NSDictionary *)

- (id  _Nonnull (^)( NSDictionary<NSString *,id<CAAction>>  * _Nonnull))actions{
    return ^ (NSDictionary<NSString *,id<CAAction>> * dic){
        self.layer.actions = dic;
        return self;
    };
}

- (id  _Nonnull (^)(void))removeFromSuperlayer{
    return ^(){
        [self.layer removeFromSuperlayer];
        return self;
    };
}

- (id  _Nonnull (^)(CALayer * _Nonnull))addToSuperLayer{
    return ^ (CALayer *layer){
        [layer addSublayer:self.layer];
        return self;
    };
}

- (id  _Nonnull (^)(CALayer * _Nonnull, CALayer * _Nonnull))insertSublayerBelow{
    return ^ (CALayer *layer, CALayer *belowLayer){
        [self.layer insertSublayer:layer below:belowLayer];
        return self;
    };
}

- (id  _Nonnull (^)(CALayer * _Nonnull, CALayer * _Nonnull))insertSublayerAbove{
    return ^ (CALayer *layer, CALayer *above){
        [self.layer insertSublayer:layer above:above];
        return self;
    };
}

- (id  _Nonnull (^)(CALayer * _Nonnull, NSInteger))insertSublayerIndex{
    return ^ (CALayer *layer, NSInteger index){
        [self.layer insertSublayer:layer atIndex:(unsigned)index];
        return self;
    };
}

- (id  _Nonnull (^)(CALayer * _Nonnull, CALayer * _Nonnull))relpaceSublayer{
    return ^ (CALayer *oldLayer, CALayer *newLayer){
        [self.layer replaceSublayer:oldLayer with:newLayer];
        return self;
    };
}

- (id  _Nonnull (^)(CALayer * _Nonnull))setToMask{
    return ^ (CALayer *layer){
        layer.mask = self.layer;
        return self;
    };
}

- (id  _Nonnull (^)(CAAnimation * _Nonnull, NSString * _Nonnull))addAnimation{
    return ^ (CAAnimation *ani, NSString *key){
        if (ani && key) {
            [self.layer addAnimation:ani forKey:key];
        }
        return self;
    };
}

- (id  _Nonnull (^)(NSString * _Nonnull))removeAnimation{
    return ^ (NSString *key){
        if (key) {
            [self.layer removeAnimationForKey:key];
        }
        return self;
    };
}

- (id  _Nonnull (^)(void))removeAllAnimation{
    return ^ (){
        [self.layer removeAllAnimations];
        return self;
    };
}

- (id  _Nonnull (^)(void (^ _Nonnull)(id _Nonnull)))assignTo{
    return ^ (void (^assignTo)(id layer)){
        if (assignTo) {
            assignTo(self);
        }
        return self;
    };
}

@end
