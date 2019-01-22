//
//  LXControlChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN



@class LXControlChainModel;
@interface LXControlChainModel : LXBaseControlChainModel<LXControlChainModel *>


@end
LXCreate(UIControl)
LXCATEGORY_EXINTERFACE(UIControl, LXControlChainModel)
NS_ASSUME_NONNULL_END
