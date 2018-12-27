//
//  LXScrollViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"

NS_ASSUME_NONNULL_BEGIN
#define LXSCROLLVIEWSUPERCHAINMODEL_INTEFACE(classType)\
LXCATEGORY_CHAIN_PROPERTY classType *(^ contentSize) (CGSize contentSize);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ contentOffset) (CGPoint contentOffset);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ contentInset) (UIEdgeInsets contentInset);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ bounces) (BOOL bounces);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ alwaysBounceVertical) (BOOL alwaysBounceVertical);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ alwaysBounceHorizontal) (BOOL alwaysBounceHorizontal);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ pagingEnabled) (BOOL pagingEnabled);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ scrollEnabled) (BOOL scrollEnabled);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ showsHorizontalScrollIndicator) (BOOL showsHorizontalScrollIndicator);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ showsVerticalScrollIndicator) (BOOL showsVerticalScrollIndicator);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ scrollsToTop) (BOOL scrollsToTop);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ indicatorStyle) (BOOL indicatorStyle);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ scrollIndicatorInsets) (UIEdgeInsets scrollIndicatorInsets);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ directionalLockEnabled) (BOOL directionalLockEnabled);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ minimumZoomScale) (CGFloat minimumZoomScale);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ maximumZoomScale) (CGFloat maximumZoomScale);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ zoomScale) (CGFloat zoomScale);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ contentOffsetAnimated)(CGPoint point, BOOL animated);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ contentOffsetToVisible)(CGRect rect, BOOL animated);

#define LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(LXMethod,LXParaType,classType) LXCATEGORY_CHAIN_IMPLEMENTATION(LXMethod,LXParaType, classType *,UIScrollView)

#define LXSCROLLVIEWSUPERCHAINMODEL_IMPLEMENTATION(classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(contentSize, CGSize, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(contentOffset, CGPoint, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(contentInset, UIEdgeInsets, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(bounces, BOOL, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(alwaysBounceVertical, BOOL, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(alwaysBounceHorizontal, BOOL, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(pagingEnabled, BOOL, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(scrollEnabled, BOOL, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(showsHorizontalScrollIndicator, BOOL, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(showsVerticalScrollIndicator, BOOL, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(scrollsToTop, BOOL, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(indicatorStyle, BOOL, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(scrollIndicatorInsets, UIEdgeInsets, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(directionalLockEnabled, BOOL, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(minimumZoomScale, CGFloat, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(zoomScale, CGFloat, classType)\
LXCATEGORY_CHAIN_SCROLLVIEW_IMPLEMENTATION(maximumZoomScale, CGFloat, classType)\
- (classType * _Nonnull (^)(CGPoint, BOOL))contentOffsetAnimated{\
    return ^ (CGPoint point, BOOL animated){\
        [(UIScrollView *)self.view setContentOffset:point animated:animated];\
        return self;\
    };\
}\
- (classType * _Nonnull (^)(CGRect, BOOL))contentOffsetToVisible{\
    return ^ (CGRect rect, BOOL animated){\
        [(UIScrollView *)self.view scrollRectToVisible:rect animated:animated];\
        return self;\
    };\
}\

@class LXScrollViewChainModel;
@interface LXScrollViewChainModel : LXBaseViewChainModel<LXScrollViewChainModel *>
LXSCROLLVIEWSUPERCHAINMODEL_INTEFACE(LXScrollViewChainModel)
LXCATEGORY_CHAIN_PROPERTY LXScrollViewChainModel * (^ delegate) (id <UIScrollViewDelegate> delegate);
LXCATEGORY_CHAIN_PROPERTY LXScrollViewChainModel * (^ adJustedContentIOS11)(void);
@end
LXCATEGORY_EXINTERFACE(UIScrollView, LXScrollViewChainModel)
NS_ASSUME_NONNULL_END
