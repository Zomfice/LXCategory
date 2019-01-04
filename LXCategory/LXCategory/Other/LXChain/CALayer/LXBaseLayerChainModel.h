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

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ bounds) (CGRect bounds);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ position) (CGPoint position);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ zPosition) (CGFloat zPosition);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ anchorPoint) (CGPoint anchorPoint);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ anchorPointZ) (CGFloat anchorPointZ);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ transform) (CATransform3D transform);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ affineTransform) (CGAffineTransform affineTransform);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ frame) (CGRect frame);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ hidden) (BOOL hidden);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ doubleSided) (BOOL doubleSided);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ geometryFlipped) (BOOL geometryFlipped);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeFromSuperlayer) (void);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addToSuperLayer) (CALayer * layer);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ insertSublayerBelow) (CALayer *layer, CALayer * below);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ insertSublayerIndex) (CALayer *layer, NSInteger index);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ insertSublayerAbove) (CALayer *layer, CALayer *above);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ relpaceSublayer) (CALayer *oldLayer, CALayer *newLayer);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ setToMask) (CALayer * toLayer);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ mask) (CALayer * maskLayer);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ masksToBounds) (BOOL masksToBounds);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ contents) (id contents);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ contentsRect) (CGRect contentsRect);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ contentsGravity) (CALayerContentsGravity contentsGravity);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ contentsScale) (CGFloat contentsScale);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ contentsCenter) (CGRect contentsCenter);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ contentsFormat) (CALayerContentsFormat contentsFormat);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ minificationFilter) (CALayerContentsFilter minificationFilter);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ magnificationFilter) (CALayerContentsFilter magnificationFilter);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ minificationFilterBias) (float minificationFilterBias);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ opaque) (BOOL opaque);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ needsDisplayOnBoundsChange) (BOOL needsDisplayOnBoundsChange);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ drawsAsynchronously) (BOOL drawsAsynchronously);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ edgeAntialiasingMask) (CAEdgeAntialiasingMask edgeAntialiasingMask);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ allowsEdgeAntialiasing) (BOOL allowsEdgeAntialiasing);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ backgroundColor) (CGColorRef backgroundColor);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ cornerRadius) (CGFloat cornerRadius);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ maskedCorners) (CACornerMask maskedCorners);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ borderWidth) (CGFloat borderWidth);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ borderColor) (CGColorRef borderColor);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ opacity) (float opacity);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ allowsGroupOpacity) (BOOL allowsGroupOpacity);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ compositingFilter) (id compositingFilter);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ filters) (NSArray* filters);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ backgroundFilters) (NSArray* backgroundFilters);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shouldRasterize) (BOOL shouldRasterize);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ rasterizationScale) (CGFloat rasterizationScale);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowColor) (CGColorRef shadowColor);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOpacity) (float shadowOpacity);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOffset) (CGSize shadowOffset);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowRadius) (CGFloat shadowRadius);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowPath) (CGPathRef shadowPath);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ actions) (NSDictionary<NSString *, id<CAAction>> * actions);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addAnimation) (CAAnimation *animation, NSString *key);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeAnimation) (NSString * key);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllAnimation) (void);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ name) (NSString * name);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ delegate) (id <CALayerDelegate> delegate);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ style) (NSDictionary * style);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ assignTo) (void (^assignTo)(id layer));
@end

NS_ASSUME_NONNULL_END
