//
//  LXActivityIndicatorViewModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXActivityIndicatorViewModel;
@interface LXActivityIndicatorViewModel : LXBaseViewChainModel<LXActivityIndicatorViewModel *>
LXCATEGORY_CHAIN_PROPERTY LXActivityIndicatorViewModel * (^ activityIndicatorViewStyle) (UIActivityIndicatorViewStyle activityIndicatorViewStyle);
LXCATEGORY_CHAIN_PROPERTY LXActivityIndicatorViewModel * (^ hidesWhenStopped) (BOOL hidesWhenStopped);
LXCATEGORY_CHAIN_PROPERTY LXActivityIndicatorViewModel * (^ color) (UIColor * color);
LXCATEGORY_CHAIN_PROPERTY LXActivityIndicatorViewModel * (^ startAnimating) (void);
LXCATEGORY_CHAIN_PROPERTY LXActivityIndicatorViewModel * (^ stopAnimating) (void);
@end
LXCreate(UIActivityIndicatorView)
LXCATEGORY_EXINTERFACE(UIActivityIndicatorView, LXActivityIndicatorViewModel)
NS_ASSUME_NONNULL_END
