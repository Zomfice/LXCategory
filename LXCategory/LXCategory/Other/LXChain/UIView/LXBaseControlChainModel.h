//
//  LXBaseControlChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/15.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"
#import "UIControl+LXCategory.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^LXTargetActionBlock)(__kindof UIControl *sender);
@interface LXBaseControlChainModel <__covariant ObjectType>: LXBaseViewChainModel<ObjectType>
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ enabled)(BOOL enabled);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ selected)(BOOL selected);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ highlighted)(BOOL highlighted);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ contentVerticalAlignment)(UIControlContentVerticalAlignment contentVerticalAlignment);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ contentHorizontalAlignment)(UIControlContentHorizontalAlignment contentHorizontalAlignment);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addTargetBlock)(LXTargetActionBlock addTargetBlock, UIControlEvents controlEvents);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ setTargetBlock)(LXTargetActionBlock addTargetBlock, UIControlEvents controlEvents);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addTarget)(id target, SEL action, UIControlEvents controlEvents);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ setTarget)(id target, SEL action, UIControlEvents controlEvents);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeTarget) (id target,SEL action, UIControlEvents controlEvents);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllTarget)(void);

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllTargetBlock)(UIControlEvents controlEvents);

@end

NS_ASSUME_NONNULL_END
