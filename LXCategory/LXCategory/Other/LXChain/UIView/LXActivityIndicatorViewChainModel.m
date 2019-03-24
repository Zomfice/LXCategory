//
//  LXActivityIndicatorViewModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXActivityIndicatorViewChainModel.h"
#define LXCATEGORY_CHAIN_ACTIVITY_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXActivityIndicatorViewModel *,UIActivityIndicatorView)
@implementation LXActivityIndicatorViewModel

LXCATEGORY_CHAIN_ACTIVITY_IMPLEMENTATION(activityIndicatorViewStyle,UIActivityIndicatorViewStyle)
LXCATEGORY_CHAIN_ACTIVITY_IMPLEMENTATION(hidesWhenStopped,BOOL)
LXCATEGORY_CHAIN_ACTIVITY_IMPLEMENTATION(color,UIColor *)

- (LXActivityIndicatorViewModel * _Nonnull (^)(void))startAnimating{
    return ^()
    {
        [(UIActivityIndicatorView *)self.view startAnimating];
        return self;
    };
}


- (LXActivityIndicatorViewModel * _Nonnull (^)(void))stopAnimating{
    return ^()
    {
        [(UIActivityIndicatorView *)self.view stopAnimating];
        return self;
    };
}
@end

LXCATEGORY_VIEW_IMPLEMENTATION(UIActivityIndicatorView, LXActivityIndicatorViewModel)
#undef LXCATEGORY_CHAIN_ACTIVITY_IMPLEMENTATION
