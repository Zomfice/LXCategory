//
//  LXProgressViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXProgressViewChainModel;
@interface LXProgressViewChainModel : LXBaseViewChainModel<LXProgressViewChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXProgressViewChainModel * (^ progressViewStyle) (UIProgressViewStyle progressViewStyle);
LXCATEGORY_CHAIN_PROPERTY LXProgressViewChainModel * (^ progress) (float progress);
LXCATEGORY_CHAIN_PROPERTY LXProgressViewChainModel * (^ progressTintColor) (UIColor* progressTintColor);
LXCATEGORY_CHAIN_PROPERTY LXProgressViewChainModel * (^ trackTintColor) (UIColor* trackTintColor);
LXCATEGORY_CHAIN_PROPERTY LXProgressViewChainModel * (^ progressImage) (UIImage* progressImage);
LXCATEGORY_CHAIN_PROPERTY LXProgressViewChainModel * (^ trackImage) (UIImage* trackImage);
LXCATEGORY_CHAIN_PROPERTY LXProgressViewChainModel * (^ observedProgress) (NSProgress * observedProgress);
LXCATEGORY_CHAIN_PROPERTY LXProgressViewChainModel * (^ setProgressAnimated) (float progress, BOOL animated);
@end
LXCreate(UIProgressView)
LXCATEGORY_EXINTERFACE(UIProgressView, LXProgressViewChainModel)
NS_ASSUME_NONNULL_END
