//
//  LXLongPressGestureChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXLongPressGestureChainModel;
@interface LXLongPressGestureChainModel : LXBaseGestureChainModel<LXLongPressGestureChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXLongPressGestureChainModel * (^ numberOfTapsRequired) (NSUInteger numberOfTapsRequired);

LXCATEGORY_CHAIN_PROPERTY LXLongPressGestureChainModel * (^ minimumPressDuration) (NSTimeInterval minimumPressDuration);
LXCATEGORY_CHAIN_PROPERTY LXLongPressGestureChainModel * (^ allowableMovement) (CGFloat allowableMovement);
@end
LXCreate(UILongPressGestureRecognizer)
LXCATEGORY_EXINTERFACE(UILongPressGestureRecognizer, LXLongPressGestureChainModel)
NS_ASSUME_NONNULL_END
