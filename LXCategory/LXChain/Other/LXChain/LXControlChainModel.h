//
//  LXControlChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"
#import "UIControl+LXCategory.h"
NS_ASSUME_NONNULL_BEGIN



@class LXControlChainModel;
@interface LXControlChainModel <ObjectType>: LXBaseViewChainModel<ObjectType>

LXCATEGORY_CHAIN_PROPERTY ObjectType (^ enabled)(BOOL enabled);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ selected)(BOOL selected);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ highlighted)(BOOL highlighted);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ contentVerticalAlignment)(UIControlContentVerticalAlignment contentVerticalAlignment);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ contentHorizontalAlignment)(UIControlContentHorizontalAlignment contentHorizontalAlignment);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addTargetBlock)(void (^addTargetBlock)(id sender), UIControlEvents controlEvents);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ setTargetBlock)(void (^addTargetBlock)(id sender), UIControlEvents controlEvents);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ addTarget)(id target, SEL action, UIControlEvents controlEvents);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ setTarget)(id target, SEL action, UIControlEvents controlEvents);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeTarget) (id target,SEL action, UIControlEvents controlEvents);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllTarget)(void);
LXCATEGORY_CHAIN_PROPERTY ObjectType (^ removeAllTargetBlock)(UIControlEvents controlEvents);

@end
LXCATEGORY_EXINTERFACE(UIControl, LXControlChainModel)
NS_ASSUME_NONNULL_END
