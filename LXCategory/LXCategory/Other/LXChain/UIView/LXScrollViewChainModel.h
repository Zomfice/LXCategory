//
//  LXScrollViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseScrollViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@class LXScrollViewChainModel;

@interface LXScrollViewChainModel : LXBaseScrollViewChainModel<LXScrollViewChainModel *>

@end
LXCreate(UIScrollView)
LXCATEGORY_EXINTERFACE(UIScrollView, LXScrollViewChainModel)
NS_ASSUME_NONNULL_END
