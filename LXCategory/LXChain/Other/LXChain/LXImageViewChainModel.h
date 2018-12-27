//
//  LXImageViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXImageViewChainModel;

@interface LXImageViewChainModel : LXBaseViewChainModel<LXImageViewChainModel *>

LXCATEGORY_CHAIN_PROPERTY LXImageViewChainModel *(^ image)(UIImage *image);

LXCATEGORY_CHAIN_PROPERTY LXImageViewChainModel *(^ highlightedImage)(UIImage *highlightedImage);

LXCATEGORY_CHAIN_PROPERTY LXImageViewChainModel *(^ highlighted)(BOOL highlighted);

LXCATEGORY_CHAIN_PROPERTY LXImageViewChainModel *(^ animationImages)(NSArray <UIImage *> * animationImages);

LXCATEGORY_CHAIN_PROPERTY LXImageViewChainModel *(^ highlightedAnimationImages)(NSArray <UIImage *> * highlightedAnimationImages);

LXCATEGORY_CHAIN_PROPERTY LXImageViewChainModel *(^ startAnimating)(void);

LXCATEGORY_CHAIN_PROPERTY LXImageViewChainModel *(^ stopAnimating)(void);

LXCATEGORY_CHAIN_PROPERTY LXImageViewChainModel *(^ animationRepeatCount)(NSInteger animationRepeatCount);

LXCATEGORY_CHAIN_PROPERTY LXImageViewChainModel *(^ animationDuration)(NSTimeInterval animationDuration);

@end
LXCATEGORY_EXINTERFACE(UIImageView, LXImageViewChainModel)
NS_ASSUME_NONNULL_END
