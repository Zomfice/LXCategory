//
//  LXBaseViewChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/26.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"
#import "UIView+LXCategory.h"
#import <objc/runtime.h>

#if __has_include(<Masonry.h>)
#import <Masonry.h>
#elif __has_include("Masonry.h")
#import "Masonry.h"
#endif

#define     LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION(methodName, masonryMethod) \
- (id (^)( void (^constraints)(MASConstraintMaker *)) )methodName    \
{   \
    return ^id ( void (^constraints)(MASConstraintMaker *) ) {  \
        if (self.view.superview) { \
            [self.view masonryMethod:constraints];    \
        }   \
        return self;    \
    };  \
}

#define     LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL(methodName, masonryMethod) \
- (id (^)( void (^constraints)(MASConstraintMaker *)) )methodName    \
{   \
    return ^id ( void (^constraints)(MASConstraintMaker *) ) {  \
        return self;    \
    };  \
}

#define LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_IMPLEMENTATION(LXMethod,LXParaType, id,UIView)


#define     LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(LXMethod,LXParaType) \
- (id (^)(LXParaType LXMethod))LXMethod    \
{   \
    return ^id (LXParaType LXMethod) {    \
        LXMethod = LXMethod;   \
        return self;    \
    };\
}
@implementation LXBaseViewChainModel

- (instancetype)initWithTag:(NSInteger)tag andView:(UIView *)view{
    if (self = [super init]) {
        _tag = tag;
        _view = view;
        _viewClass = [view class];
        [view setTag:tag];
    }
    return self;
}
#pragma mark - frame -

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(frame, CGRect)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(origin, CGPoint)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(x, CGFloat)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(y, CGFloat)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(size, CGSize)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(width, CGFloat)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(height, CGFloat)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(center, CGPoint)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(centerX, CGFloat)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(centerY, CGFloat)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(top, CGFloat)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(bottom, CGFloat)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(left, CGFloat)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(right, CGFloat)

- (UIView * _Nonnull (^)(NSInteger))viewWithTag{
    return ^ (NSInteger tag){
        UIView *view = [self.view viewWithTag:tag];
        return view;
    };
}

- (CGFloat (^)(void))visibleAlpha{
    return ^(){
        CGFloat ap = 0;
        if ([self isKindOfClass:[UIWindow class]]) {
            if (self.hidden) ap = 0;
            ap = self.view.alpha;
        }
        if (!self.view.window) ap = 0;
        ap = 1;
        UIView *v = self.view;
        while (v) {
            if (v.hidden) {
                ap = 0;
                break;
            }
            ap *= v.alpha;
            v = v.superview;
        }
        return ap;
    };
}


- (CGRect (^)(CGRect, UIView * _Nonnull))convertRectTo{
    return  ^(CGRect rect, UIView *view){
        UIView *myView = self.view;
        CGRect toRect;
        if (!view) {
            if ([myView isKindOfClass:[UIWindow class]]) {
                toRect = [((UIWindow *)myView) convertRect:rect toWindow:nil];
            } else {
                toRect = [myView convertRect:rect toView:nil];
            }
        }
        
        UIWindow *from = [myView isKindOfClass:[UIWindow class]] ? (id)myView : myView.window;
        UIWindow *to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
        if (!from || !to) return [myView convertRect:rect toView:view];
        if (from == to) return [myView convertRect:rect toView:view];
        rect = [myView convertRect:rect toView:from];
        rect = [to convertRect:rect fromWindow:from];
        toRect = [view convertRect:rect fromView:to];
        return toRect;
    };
}


- (CGRect (^)(CGRect, UIView * _Nonnull))convertRectFrom{
    
    return  ^(CGRect rect, UIView *view){
        CGRect fromRect;
        UIView *myView = self.view;
        if (!view) {
            if ([myView isKindOfClass:[UIWindow class]]) {
                fromRect = [((UIWindow *)myView) convertRect:rect fromWindow:nil];
            } else {
                fromRect = [myView convertRect:rect fromView:nil];
            }
        }
        
        UIWindow *from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
        UIWindow *to = [myView isKindOfClass:[UIWindow class]] ? (id)myView : myView.window;
        if ((!from || !to) || (from == to)) return [myView convertRect:rect fromView:view];
        rect = [from convertRect:rect fromView:view];
        rect = [to convertRect:rect fromWindow:from];
        fromRect = [myView convertRect:rect fromView:to];
        return fromRect;
    };
}

- (CGPoint (^)(CGPoint, UIView * _Nonnull))convertPointTo{
    return  ^(CGPoint point, UIView *view){
        UIView *myView = self.view;
        CGPoint endPoint;
        if (!view) {
            if ([myView isKindOfClass:[UIWindow class]]) {
                endPoint = [((UIWindow *)myView) convertPoint:point toWindow:nil];
            } else {
                endPoint = [myView convertPoint:point toView:nil];
            }
        }
        
        UIWindow *from = [myView isKindOfClass:[UIWindow class]] ? (id)myView : myView.window;
        UIWindow *to = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
        if ((!from || !to) || (from == to)) return [myView convertPoint:point toView:view];
        point = [myView convertPoint:point toView:from];
        point = [to convertPoint:point fromWindow:from];
        endPoint = [view convertPoint:point fromView:to];
        return endPoint;
    };
}

- (CGPoint (^)(CGPoint, UIView * _Nonnull))convertPointFrom{
    return  ^(CGPoint point, UIView *view){
        CGPoint endPoint;
        UIView *myView = self.view;
        if (!view) {
            if ([myView isKindOfClass:[UIWindow class]]) {
                endPoint = [(UIWindow *)myView convertPoint:point fromWindow:nil];
            }else{
                endPoint = [myView convertPoint:point fromView:nil];
            }
        }else{
            UIWindow *from = [view isKindOfClass:[UIWindow class]] ? (id)view : view.window;
            UIWindow *to = [myView isKindOfClass:[UIWindow class]] ? (id)myView : myView.window;
            if ((!from || !to) || (from == to)) return [myView convertPoint:point fromView:view];
            point = [from convertPoint:point fromView:view];
            point = [to convertPoint:point fromWindow:from];
            endPoint = [myView convertPoint:point fromView:to];
        }
        return endPoint;
    };
}
#pragma mark - show -

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(backgroundColor, UIColor *)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(tintColor, UIColor *)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(alpha, CGFloat)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(hidden, BOOL)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(clipsToBounds, BOOL)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(opaque, BOOL)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(userInteractionEnabled, BOOL)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(multipleTouchEnabled, BOOL)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(contentMode, UIViewContentMode)


- (id  _Nonnull (^)(BOOL))endEditing{
    return ^(BOOL end){
        [self.view endEditing:end];
        return self;
    };
}

- (id  _Nonnull (^)(UIView * _Nonnull))addToSuperView{
    return ^(UIView *superView){
        [superView addSubview:self.view];
        return self;
    };
}

- (id  _Nonnull (^)(UIView * _Nonnull))addSubView{
    return ^(UIView *subView){
        [self.view addSubview:subView];
        return self;
    };
}

- (id  _Nonnull (^)(UIGestureRecognizer * _Nonnull))addGesture{
    return ^(UIGestureRecognizer *ges){
        if (!ges) return self;
        [self.view addGestureRecognizer:ges];
        return self;
    };
}

- (id  _Nonnull (^)(UIGestureRecognizer * _Nonnull))removeGesture{
    return ^(UIGestureRecognizer *ges){
        if (!ges) return self;
        [self.view removeGestureRecognizer:ges];
        return self;
    };
}

- (id  _Nonnull (^)(UIGestureRecognizer * _Nonnull, NSString * _Nonnull))addGestureWithTag{
    return ^(UIGestureRecognizer *ges, NSString *tag){
        if (!tag) return self;
        NSMutableDictionary *dic = [self lx_category_gestureDic];
        if ([dic.allKeys containsObject:tag]) {
            self.removeGestureByTag(tag);
        }
        self.addGesture(ges);
        [dic setObject:ges forKey:tag];
        return self;
    };
}

- (id  _Nonnull (^)(NSString * _Nonnull))removeGestureByTag{
    return ^(NSString *tag){
        if (!tag) return self;
        NSMutableDictionary *dic = [self lx_category_gestureDic];
        UIGestureRecognizer *ges = [dic objectForKey:tag];
        self.removeGesture(ges);
        [dic removeObjectForKey:tag];
        return self;
    };
}

- (UIGestureRecognizer * (^)(NSString * ))getGestureByTag{
    return ^(NSString *tag){
        UIGestureRecognizer *ges;
        if (!tag) {
            NSMutableDictionary *dic = [self lx_category_gestureDic];
            ges = [dic objectForKey:tag];
        }
        return ges;
    };
}

- (NSMutableDictionary *)lx_category_gestureDic{
    NSMutableDictionary *_dic = objc_getAssociatedObject(self, @selector(lx_category_gestureDic));
    if (!_dic) {
        _dic = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, @selector(lx_category_gestureDic), _dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return _dic;
}

- (id  _Nonnull (^)(UIView * _Nonnull))bringSubViewToFront{
    return ^ (UIView *view){
        [self.view bringSubviewToFront:view];
        return self;
    };
}

- (id  _Nonnull (^)(UIView * _Nonnull))sendSubViewToBack{
    return ^ (UIView *view){
        [self.view sendSubviewToBack:view];
        return self;
    };
}

- (id  _Nonnull (^)(UIView * _Nonnull, UIView * _Nonnull))exchangeSubView{
    return ^(UIView *v1, UIView *v2){
        NSArray *subs = self.view.subviews;
        NSInteger index1 = [subs indexOfObject:v1];
        NSInteger index2 = [subs indexOfObject:v2];
        if (index1 != NSNotFound && index2 != NSNotFound) {
            if (index2 != index1) {
                [self.view exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
            }
        }
        return self;
    };
}

- (id  _Nonnull (^)(NSInteger, NSInteger))exchangeSubviewWithIndex{
    return ^(NSInteger v1, NSInteger v2){
        NSInteger count = self.view.subviews.count;
        if (v1 < count && v1 > 0 && v2 < count && v2 > 0 && v1 != v2) {
            [self.view exchangeSubviewAtIndex:v1 withSubviewAtIndex:v2];
        }
        return self;
    };
}


- (id  _Nonnull (^)(UIView * _Nonnull, UIView * _Nonnull))insertSubViewAbove{
    return ^(UIView *above, UIView *below){
        if (!above) return self;
        if (!below) {
            below = [self.view.subviews lastObject];
        }
        [self.view insertSubview:above aboveSubview:below];
        return self;
    };
}

- (id  _Nonnull (^)(UIView * _Nonnull, UIView * _Nonnull))insertSubViewBelow{
    return ^(UIView *below, UIView *above){
        if (!below) return self;
        if (!above) {
            above = [self.view.subviews lastObject];
        }
        [self.view insertSubview:below belowSubview:above];
        return self;
    };
}

- (id  _Nonnull (^)(UIView * _Nonnull, NSInteger))insertSubViewIndex{
    return ^(UIView *view, NSInteger index){
        if (view) {
            [self.view insertSubview:view atIndex:index];
        }
        return self;
    };
}

- (id (^)(CGFloat cornerRadius))cornerRadius
{
    return ^__kindof LXBaseViewChainModel *(CGFloat cornerRadius) {
        [self.view.layer setMasksToBounds:YES];
        [self.view.layer setCornerRadius:cornerRadius];
        return self;
    };
}

- (id (^)(CGFloat borderWidth, UIColor *borderColor))border
{
    return ^__kindof LXBaseViewChainModel *(CGFloat borderWidth, UIColor *borderColor) {
        [self.view.layer setBorderWidth:borderWidth];
        [self.view.layer setBorderColor:borderColor.CGColor];
        return self;
    };
}

- (id (^)(CGSize shadowOffset, CGFloat shadowRadius, UIColor *shadowColor, CGFloat shadowOpacity))shadow
{
    return ^ LXBaseViewChainModel *(CGSize shadowOffset, CGFloat shadowRadius, UIColor *shadowColor, CGFloat shadowOpacity) {
        [self.view.layer setShadowOffset:shadowOffset];
        [self.view.layer setShadowRadius:shadowRadius];
        [self.view.layer setShadowColor:shadowColor.CGColor];
        [self.view.layer setShadowOpacity:shadowOpacity];
        return self;
    };
}
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(masksToBounds, BOOL);
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(shadowColor, CGColorRef);
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(shadowOpacity, CGFloat);
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(shadowOffset, CGSize);
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(shadowRadius, CGFloat);
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(transform, CATransform3D);
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(borderWidth, CGFloat);
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(borderColor, CGColorRef);
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(zPosition, CGFloat);
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(anchorPoint, CGPoint);


#if __has_include(<Masonry.h>) || __has_include("Masonry.h")
LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION(makeMasonry, mas_makeConstraints);
LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION(updateMasonry, mas_updateConstraints);
LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION(remakeMasonry, mas_remakeConstraints);
#else
LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL(masonry, mas_makeConstraints);
LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL(updateMasonry, mas_updateConstraints);
LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL(remakeMasonry, mas_remakeConstraints);
#endif
@end
