//
//  LXViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN

@class LXViewChainModel,UIView;
@interface LXViewChainModel : LXBaseViewChainModel<LXViewChainModel *>

@end

LXCreate(UIView)
LXCATEGORY_EXINTERFACE(UIView, LXViewChainModel)

NS_ASSUME_NONNULL_END
