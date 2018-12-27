//
//  LXImageViewChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXImageViewChainModel.h"
#define LXCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_IMPLEMENTATION(LXMethod,LXParaType, LXImageViewChainModel *,UIImageView)
@implementation LXImageViewChainModel

LXCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(image, UIImage *);
LXCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(highlightedImage, UIImage *);
LXCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(highlighted, BOOL);
LXCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(animationImages, NSArray<UIImage *> *)
LXCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(highlightedAnimationImages, NSArray<UIImage *> *)
LXCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(animationDuration, NSTimeInterval)
LXCATEGORY_CHAIN_IMAGEVIEW_IMPLEMENTATION(animationRepeatCount, NSInteger)

- (LXImageViewChainModel * _Nonnull (^)(void))startAnimating{
    return ^ (){
        [self startAnimating];
        return self;
    };
}

- (LXImageViewChainModel * _Nonnull (^)(void))stopAnimating{
    return ^ (){
        [self stopAnimating];
        return self;
    };
}

@end
LXCATEGORY_IMPLEMENTATION(UIImageView, LXImageViewChainModel)
