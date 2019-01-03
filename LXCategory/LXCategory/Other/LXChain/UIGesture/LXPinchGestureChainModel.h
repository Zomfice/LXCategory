//
//  LXPinchGestureChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXPinchGestureChainModel;
@interface LXPinchGestureChainModel : LXBaseGestureChainModel<LXPinchGestureChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXPinchGestureChainModel * (^ scale) (CGFloat scale);
@end
LXCreate(UIPinchGestureRecognizer)
LXCATEGORY_EXINTERFACE(UIPinchGestureRecognizer, LXPinchGestureChainModel)
NS_ASSUME_NONNULL_END
