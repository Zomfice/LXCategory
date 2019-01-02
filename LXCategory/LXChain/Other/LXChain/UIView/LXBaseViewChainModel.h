//
//  LXBaseViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/26.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXChainDefine.h"

#define LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXModelType, LXPropertyClass) LXCATEGORY_CHAIN_IMPLEMENTATION(LXMethod,LXParaType, view, LXModelType, LXPropertyClass)

#define LXCATEGORY_VIEW_IMPLEMENTATION(LXClass, modelType)\
@implementation LXClass (EXT)\
- (modelType *)makeChain{\
return [[modelType alloc] initWithTag:self.tag andView:self];\
}\
@end
NS_ASSUME_NONNULL_BEGIN
@class MASConstraintMaker;
@interface LXBaseViewChainModel <__covariant  ObjectType> : NSObject

- (instancetype)initWithTag:(NSInteger)tag andView:(UIView *)view;

@property (nonatomic, assign, readonly) NSInteger tag;

@property (nonatomic, strong, readonly) UIView *view;

@property (nonatomic, assign, readonly) Class viewClass;

#pragma mark - frame -
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ frame) (CGRect frame);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ origin) (CGPoint origin);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ x) (CGFloat x);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ y) (CGFloat y);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ size) (CGSize size);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ width) (CGFloat width);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ height) (CGFloat height);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ center) (CGPoint center);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ centerX) (CGFloat centerX);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ centerY) (CGFloat centerY);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ top) (CGFloat top);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ left) (CGFloat left);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ bottom) (CGFloat bottom);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ right) (CGFloat right);


LXCATEGORY_CHAIN_PROPERTY CGFloat (^ visibleAlpha) (void);

LXCATEGORY_CHAIN_PROPERTY CGRect (^ convertRectTo) (CGRect rect, UIView * toView);

LXCATEGORY_CHAIN_PROPERTY CGRect (^ convertRectFrom) (CGRect rect, UIView * toView);

LXCATEGORY_CHAIN_PROPERTY CGPoint (^ convertPointTo) (CGPoint point, UIView * toView);

LXCATEGORY_CHAIN_PROPERTY CGPoint (^ convertPointFrom) (CGPoint point, UIView * toView);

LXCATEGORY_CHAIN_PROPERTY UIView *(^ viewWithTag) (NSInteger tag);

#pragma mark - show -

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ backgroundColor) (UIColor *backgroundColor);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ tintColor) (UIColor *tintColor);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ alpha) (CGFloat alpha);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ hidden) (BOOL hidden);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ clipsToBounds) (BOOL clipsToBounds);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ opaque) (BOOL opaque);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ userInteractionEnabled) (BOOL userInteractionEnabled);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ multipleTouchEnabled) (BOOL multipleTouchEnabled);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ endEditing) (BOOL endEditing);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ contentMode) (UIViewContentMode contentMode);

#pragma mark - control -

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addToSuperView) (UIView *superView);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addSubView) (UIView *subView);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addGesture) (UIGestureRecognizer *gesture);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeGesture) (UIGestureRecognizer *gesture);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addGestureWithTag) (UIGestureRecognizer *gesture, NSString *tag);

@property (nonatomic, strong, readonly) UIGestureRecognizer * (^ getGestureByTag) (NSString * tag);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeGestureByTag) (NSString *tag);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ bringSubViewToFront) (UIView *view);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ sendSubViewToBack) (UIView *view);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ exchangeSubView) (UIView *front, UIView *backView);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ exchangeSubviewWithIndex) (NSInteger front, NSInteger back);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ insertSubViewBelow) (UIView* below, UIView * above);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ insertSubViewAbove) (UIView* above, UIView * below);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ insertSubViewIndex) (UIView* above, NSInteger index);


#pragma mark - layer -

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shouldRasterize)(BOOL shouldRasterize);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ layerOpacity)(float layerOpacity);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ layerBackGroundColor)(UIColor * backgroundColor);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ layerOpaque)(BOOL opaque);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ rasterizationScale)(CGFloat rasterizationScale);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ masksToBounds)(BOOL masksToBounds);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ cornerRadius)(CGFloat cornerRadius);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ border)(CGFloat borderWidth, UIColor *borderColor);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ borderWidth)(CGFloat borderWidth);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ borderColor)(CGColorRef borderColor);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ zPosition)(CGFloat zPosition);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ anchorPoint)(CGPoint anchorPoint);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shadow)(CGSize shadowOffset, CGFloat shadowRadius, UIColor *shadowColor, CGFloat shadowOpacity);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowColor)(CGColorRef shadowColor);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOpacity)(CGFloat shadowOpacity);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowOffset)(CGSize shadowOffset);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowRadius)(CGFloat shadowRadius);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ transform)(CATransform3D transform);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ shadowPath) (CGPathRef shadowPath);

#pragma mark - layout -

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ makeMasonry)( void (^constraints)(MASConstraintMaker *make) );

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ updateMasonry)( void (^constraints)(MASConstraintMaker *make) );

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ remakeMasonry)( void (^constraints)(MASConstraintMaker *make) );

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ assignTo)(void (^assignTo)(id view));

@end

NS_ASSUME_NONNULL_END
