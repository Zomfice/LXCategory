//
//  LXBaseGestureChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXChainDefine.h"

#define LXCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(LXMethod,LXParaType, LXModelType, LXPropertyClass) LXCATEGORY_CHAIN_IMPLEMENTATION(LXMethod,LXParaType, gesture, LXModelType, LXPropertyClass)

#define LXCATEGORY_GESTURE_IMPLEMENTATION(LXClass, modelType)\
@implementation LXClass (EXT)\
- (modelType *)makeChain{\
return [[modelType alloc] initWithGesture:self];\
}\
@end
NS_ASSUME_NONNULL_BEGIN



@interface LXBaseGestureChainModel <__covariant  ObjectType> : NSObject

- (instancetype)initWithGesture:(UIGestureRecognizer *)gesture;

@property (nonatomic, strong, readonly) UIGestureRecognizer * gesture;

@property (nonatomic, assign, readonly) Class  gestureClass;

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ delegate) (id<UIGestureRecognizerDelegate> delegate);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ enabled) (BOOL enabled);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ cancelsTouchesInView) (BOOL cancelsTouchesInView);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ delaysTouchesBegan) (BOOL delaysTouchesBegan);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ delaysTouchesEnded) (BOOL delaysTouchesEnded);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ allowedTouchTypes) (NSArray<NSNumber *> *allowedTouchTypes);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ allowedPressTypes) (NSArray<NSNumber *> *allowedPressTypes);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ requiresExclusiveTouchType) (BOOL requiresExclusiveTouchType);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ name) (NSString * name);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ requireGestureRecognizerToFail) (UIGestureRecognizer * requireGestureRecognizerToFail);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addTarget) (id target, SEL action);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeTarget) (id target, SEL action);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addTargetBlock) (void (^) (id gesture));

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addTargetBlockWithTag) (void (^) (id gesture), NSString *tag);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeTargetBlockWithTag) (NSString *tag);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllTargetBlock)(void);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addToSuperView) (UIView *view);

@end
NS_ASSUME_NONNULL_END
