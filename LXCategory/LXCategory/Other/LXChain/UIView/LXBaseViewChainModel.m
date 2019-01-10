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

#define LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, id,UIView)


#define     LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(LXMethod,LXParaType) \
- (id (^)(LXParaType LXMethod))LXMethod    \
{   \
    return ^id (LXParaType LXMethod) {    \
        self.view.layer.LXMethod = LXMethod;   \
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
LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(bounds, CGRect)

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

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(autoresizingMask, UIViewAutoresizing)

LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION(autoresizesSubviews, BOOL)

- (UIView * _Nonnull (^)(NSInteger))viewWithTag{
    return ^ (NSInteger tag){
        UIView *view = [self.view viewWithTag:tag];
        return view;
    };
}

- (CGFloat (^)(void))visibleAlpha{
    return ^(){
        return [self.view visibleAlpha];
    };
}


- (CGRect (^)(CGRect, UIView * _Nonnull))convertRectTo{
    return  ^(CGRect rect, UIView *view){
        return [self.view convertRectTo:rect :view];
    };
}


- (CGRect (^)(CGRect, UIView * _Nonnull))convertRectFrom{
    return  ^(CGRect rect, UIView *view){
        return [self.view convertRectFrom:rect :view];
    };
}

- (CGPoint (^)(CGPoint, UIView * _Nonnull))convertPointTo{
    return  ^(CGPoint point, UIView *view){
        return [self.view convertPointTo:point :view];
    };
}

- (CGPoint (^)(CGPoint, UIView * _Nonnull))convertPointFrom{
    return  ^(CGPoint point, UIView *view){
        return [self.view convertPointFrom:point :view];
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

- (id  _Nonnull (^)(float))layerOpacity{
    return ^ (float opacity){
        self.view.layer.opacity = opacity;
        return self;
    };
}

- (id  _Nonnull (^)(BOOL))layerOpaque{
    return ^ (BOOL opaque){
        self.view.layer.opaque = opaque;
        return self;
    };
}

- (id  _Nonnull (^)(UIColor * _Nonnull))layerBackGroundColor{
    return ^ (UIColor *color){
        self.view.layer.backgroundColor = color.CGColor;
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
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(shouldRasterize, BOOL);
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(rasterizationScale, CGFloat);
LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION(shadowPath, CGPathRef);



#if __has_include(<Masonry.h>) || __has_include("Masonry.h")
LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION(makeMasonry, mas_makeConstraints);
LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION(updateMasonry, mas_updateConstraints);
LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION(remakeMasonry, mas_remakeConstraints);
#else
LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL(masonry, mas_makeConstraints);
LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL(updateMasonry, mas_updateConstraints);
LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL(remakeMasonry, mas_remakeConstraints);
#endif

- (id  _Nonnull (^)(void (^ _Nonnull)(id _Nonnull)))assignTo{
    return ^ (void (^assignTo)(id view)){
        if (assignTo) {
            assignTo(self.view);
        }
        return self;
    };
}

- (id  _Nonnull (^)(void))removeFormSuperView{
    return ^ (){
        [self.view removeFromSuperview];
        return self;
    };
}

- (id  _Nonnull (^)(void))sizeToFit{
    return ^ (){
        [self.view sizeToFit];
        return self;
    };
}

- (id  _Nonnull (^)(void))layoutIfNeeded{
    return ^ (){
        [self.view layoutIfNeeded];
        return self;
    };
}

- (id  _Nonnull (^)(void))setNeedsLayout{
    return ^ (){
        [self.view setNeedsLayout];
        return self;
    };
}
- (id  _Nonnull (^)(void))setNeedsDisplay{
    return ^ (){
        [self.view setNeedsDisplay];
        return self;
    };
}

- (CGSize (^)(CGSize))sizeToFitSize{
    return ^ (CGSize size){
       return [self.view sizeThatFits:size];
    };
}

- (id (^)(CGRect))setNeedsDisplayRect{
    return ^ (CGRect rect){
        [self.view setNeedsDisplayInRect:rect];
        return self;
    };
}

@end
#undef LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION
#undef LXCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL
#undef LXCATEGORY_CHAIN_LAYER_IMPLEMENTATION
#undef LXCATEGORY_CHAIN_VIEW_IMPLEMENTATION
