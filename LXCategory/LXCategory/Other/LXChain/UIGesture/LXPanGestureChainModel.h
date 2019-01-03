//
//  LXPanGestureChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXPanGestureChainModel;
@interface LXPanGestureChainModel : LXBaseGestureChainModel<LXPanGestureChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXPanGestureChainModel * (^ minimumNumberOfTouches) (NSUInteger minimumNumberOfTouches);
LXCATEGORY_CHAIN_PROPERTY LXPanGestureChainModel * (^ maximumNumberOfTouches) (NSUInteger maximumNumberOfTouches);
LXCATEGORY_CHAIN_PROPERTY LXPanGestureChainModel * (^ translation) (CGPoint translation,UIView *view);
@end
LXCreate(UIPanGestureRecognizer)
LXCATEGORY_EXINTERFACE(UIPanGestureRecognizer, LXPanGestureChainModel)
NS_ASSUME_NONNULL_END
