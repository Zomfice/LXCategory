//
//  LXVisualEffectViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXVisualEffectViewChainModel;
@interface LXVisualEffectViewChainModel : LXBaseViewChainModel<LXVisualEffectViewChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXVisualEffectViewChainModel * (^ effect) (UIVisualEffect * effect);
@end
LXCreate(UIVisualEffectView)
LXCATEGORY_EXINTERFACE(UIVisualEffectView, LXVisualEffectViewChainModel)
NS_ASSUME_NONNULL_END
