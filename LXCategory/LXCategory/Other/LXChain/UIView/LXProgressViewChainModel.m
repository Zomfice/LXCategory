//
//  LXProgressViewChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXProgressViewChainModel.h"
#define LXCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXProgressViewChainModel *,UIProgressView)
LXCATEGORY_VIEW_IMPLEMENTATION(UIProgressView, LXProgressViewChainModel)
@implementation LXProgressViewChainModel
LXCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(progressViewStyle, UIProgressViewStyle)
LXCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(progress, float)
LXCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(progressTintColor, UIColor*)
LXCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(trackTintColor, UIColor*)
LXCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(progressImage, UIImage*)
LXCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(trackImage, UIImage*)
LXCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION(observedProgress, NSProgress *)

- (LXProgressViewChainModel * _Nonnull (^)(float, BOOL))setProgressAnimated{
    return ^ (float p, BOOL a){
        [(UIProgressView *)self.view setProgress:p animated:a];
        return self;
    };
}

@end
#undef LXCATEGORY_CHAIN_PROGRESS_IMPLEMENTATION
