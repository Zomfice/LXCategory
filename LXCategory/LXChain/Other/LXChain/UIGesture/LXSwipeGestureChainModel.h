//
//  LXSwipeGestureChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@class LXSwipeGestureChainModel;
@interface LXSwipeGestureChainModel : LXBaseGestureChainModel<LXSwipeGestureChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXSwipeGestureChainModel * (^ numberOfTapsRequired) (NSUInteger numberOfTapsRequired);
LXCATEGORY_CHAIN_PROPERTY LXSwipeGestureChainModel * (^ direction) (UISwipeGestureRecognizerDirection direction);
@end

LXCreate(UISwipeGestureRecognizer)
LXCATEGORY_EXINTERFACE(UISwipeGestureRecognizer, LXSwipeGestureChainModel)
NS_ASSUME_NONNULL_END
