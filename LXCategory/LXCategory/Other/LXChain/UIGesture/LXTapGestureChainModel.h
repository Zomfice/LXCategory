//
//  LXTapGestureChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseGestureChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXTapGestureChainModel;
@interface LXTapGestureChainModel : LXBaseGestureChainModel<LXTapGestureChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXTapGestureChainModel * (^ numberOfTapsRequired) (NSUInteger numberOfTapsRequired);
@end
LXCreate(UITapGestureRecognizer)
LXCATEGORY_EXINTERFACE(UITapGestureRecognizer, LXTapGestureChainModel)
NS_ASSUME_NONNULL_END
