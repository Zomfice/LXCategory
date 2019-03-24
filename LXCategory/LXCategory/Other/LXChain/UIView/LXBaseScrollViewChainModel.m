//
//  LXBaseScrollViewChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/15.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseScrollViewChainModel.h"
#import "UIScrollView+LXCategory.h"
#define LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType,  id ,UIScrollView)
@implementation LXBaseScrollViewChainModel
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(delegate, id<UIScrollViewDelegate>)

- (id _Nonnull (^)(void))adJustedContentIOS11{
    return ^ (){
        if (@available(iOS 11.0, *)) {
            [(UIScrollView *)self.view adJustedContentIOS11];
        }
        return self;
    };
}

LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(contentSize, CGSize)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(contentOffset, CGPoint)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(contentInset, UIEdgeInsets)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(bounces, BOOL)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(alwaysBounceVertical, BOOL)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(alwaysBounceHorizontal, BOOL)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(pagingEnabled, BOOL)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(scrollEnabled, BOOL)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(showsHorizontalScrollIndicator, BOOL)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(showsVerticalScrollIndicator, BOOL)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(scrollsToTop, BOOL)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(indicatorStyle, BOOL)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(scrollIndicatorInsets, UIEdgeInsets)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(directionalLockEnabled, BOOL)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(minimumZoomScale, CGFloat)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(zoomScale, CGFloat)
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(maximumZoomScale, CGFloat)

- (id  _Nonnull (^)(CGPoint, BOOL))contentOffsetAnimated{
    return ^ (CGPoint point, BOOL animated){
        [(UIScrollView *)self.view setContentOffset:point animated:animated];
        return self;
    };
}

- (id  _Nonnull (^)(CGRect, BOOL))contentOffsetToVisible{
    return ^ (CGRect rect, BOOL animated){
        [(UIScrollView *)self.view scrollRectToVisible:rect animated:animated];
        return self;
    };
}
@end
#undef LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION
