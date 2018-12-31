//
//  LXRotationGestureChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXRotationGestureChainModel;
@interface LXRotationGestureChainModel : LXBaseGestureChainModel<LXRotationGestureChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXRotationGestureChainModel * (^ rotation) (CGFloat rotation);
@end
LXCreate(UIRotationGestureRecognizer)
LXCATEGORY_EXINTERFACE(UIRotationGestureRecognizer, LXRotationGestureChainModel)
NS_ASSUME_NONNULL_END
