//
//  LXScrollViewChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXScrollViewChainModel.h"

@implementation LXScrollViewChainModel
LXSCROLLVIEWSUPERCHAINMODEL_IMPLEMENTATION(LXScrollViewChainModel)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(delegate, id<UIScrollViewDelegate>, LXScrollViewChainModel)

- (LXScrollViewChainModel * _Nonnull (^)(void))adJustedContentIOS11{
    return ^ (){
        if (@available(iOS 11.0, *)) {
            [(UIScrollView *)self.view setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        }
        return self;
    };
}
@end
LXCATEGORY_IMPLEMENTATION(UIScrollView, LXScrollViewChainModel)
