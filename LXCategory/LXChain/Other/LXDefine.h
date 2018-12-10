//
//  LXDefine.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/11/20.
//  Copyright © 2018 xllpp. All rights reserved.
//

#ifndef LXDefine_h
#define LXDefine_h
#import <UIKit/UIKit.h>
#import "NSObject+LX.h"

#ifndef LXWeak
#define LXWeak  __weak __typeof(self) weakSelf = self;
#endif


#ifndef LXStrong
#define LXStrong  __strong __typeof(weakSelf) self = weakSelf;
#endif

typedef NS_ENUM (NSInteger, LXBlankStatus){
    LXBlankStatusFalse,
    LXBlankStatusZero,
    LXBlankStatusNil
};

static inline LXBlankStatus LXDataBlankStatus (id data) {
    if (data == [NSNull null]) return LXBlankStatusNil;
    if (!data) return LXBlankStatusNil;
    BOOL isBlank = NO;
    if ([data isKindOfClass:[NSNumber class]]) {isBlank = [(NSNumber *)data integerValue] == 0;}
    else if ([data isKindOfClass:[NSString class]]) {isBlank = [(NSString *)data length] == 0;}
    else if ([data isKindOfClass:[NSArray class]]) {isBlank = [(NSArray *)data count] == 0;}
    else if ([data isKindOfClass:[NSDictionary class]]) {isBlank = [(NSDictionary *)data count] == 0;}
    else if ([data isKindOfClass:[NSSet class]]) {isBlank = [(NSSet *)data count] == 0;}
    else if ([data isKindOfClass:[NSIndexSet class]]) {isBlank = [(NSIndexSet *)data count] == 0;}
    else if ([data isKindOfClass:[NSData class]]) {isBlank = [(NSData *)data length] == 0;}
    return isBlank ? LXBlankStatusZero : LXBlankStatusFalse;
}

static inline BOOL LXIsNotBlank(id data){
    return LXDataBlankStatus(data) == LXBlankStatusFalse;
}

static inline BOOL LXIsNilBlank(id data){
    return LXDataBlankStatus(data) == LXBlankStatusNil;
}

static inline BOOL LXIsZeroBlank(id data){
    return LXDataBlankStatus(data) == LXBlankStatusZero;
}

#define LXISMemberClass(objc, clas) [data isMemberOfClass:[clas class]]
#define LXISKindClass(objc, clas) [data isKindOfClass:[clas class]]

#define LXPropertyCopyReadOnly @property (nonatomic, copy, readonly)
#pragma mark - Category -


#ifndef LXAddLayer
#define LXAddLayer(_name_)\
LXPropertyCopyReadOnly _name_ * (^m_cornerRadius) (CGFloat cornerRadius) ;\
LXPropertyCopyReadOnly _name_ * (^m_maskToBounds) (BOOL maskToBounds) ;\
LXPropertyCopyReadOnly _name_ * (^m_borderWidth) (CGFloat borderWidth) ;\
LXPropertyCopyReadOnly _name_ * (^m_borderColor) (UIColor * borderColor) ;\
LXPropertyCopyReadOnly _name_ * (^m_frame) (CGRect frame) ;\
LXPropertyCopyReadOnly _name_ * (^m_backGrounColor) (UIColor * color) ;
#endif

#ifndef LXAddViewChain
#define LXAddViewChain(_name_)\
\
LXPropertyCopyReadOnly _name_ *(^m_bringSubviewToFront) (UIView * view) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_equalToView) (UIView * view) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_sendSubviewToBack) (UIView * view) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_exchangeSubviewWithIndex) (NSInteger fromIndex, NSInteger toIndex) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_exchangeSubview) (UIView* from, UIView * to) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_insertSubViewBelow) (UIView* below, UIView * above) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_insertSubViewAbove) (UIView* above, UIView * below) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_endEditing) (BOOL end) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_insertSubViewIndex) (UIView* view, NSInteger index) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_addingSubView) (UIView * view) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_backGrounColor) (UIColor * color) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_userInteractionEnabled) (BOOL userInteractionEnabled) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_subViews) (sub sub) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_tag) (NSInteger tag) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_addingSubViews) (NSArray <UIView *>* views) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_addingToSuperView) (UIView * superView) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_layoutSub) (void) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_layer) (v_layer layer) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_contentMode) (UIViewContentMode mode) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_clipToBounds) (BOOL clipToBounds) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_hidden) (BOOL hidden) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_addGesture) (UIGestureRecognizer *gesture) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_removeGesture) (UIGestureRecognizer *gesture) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_addGestureWithTag) (UIGestureRecognizer *gesture, NSInteger tag) ;\
\
LXPropertyCopyReadOnly _name_ *(^m_removeGestureTag) (NSInteger tag);
#endif

#ifndef LXViewSetFrame
#define LXViewSetFrame(_name_)\
LXPropertyCopyReadOnly _name_ *(^m_frame) (CGRect frame) ;\
\
LXPropertyCopyReadOnly _name_ * (^ m_centerm_s) (CGFloat centerX) ;\
\
LXPropertyCopyReadOnly _name_ * (^ m_centerY_s) (CGFloat centerY) ;\
\
LXPropertyCopyReadOnly _name_ * (^ m_center_s) (CGPoint center) ;\
\
LXPropertyCopyReadOnly _name_ * (^ m_center1_s) (CGFloat centerX, CGFloat centerY) ;\
\
LXPropertyCopyReadOnly _name_ * (^ m_m_s) (CGFloat x) ;\
\
LXPropertyCopyReadOnly _name_ * (^ m_y_s) (CGFloat y) ;\
\
LXPropertyCopyReadOnly _name_ * (^ m_origin_s) (CGPoint origin) ;\
\
LXPropertyCopyReadOnly _name_ * (^ m_origin1_s) (CGFloat x, CGFloat y) ;\
\
LXPropertyCopyReadOnly _name_ * (^ m_width_s) (CGFloat width) ;\
\
LXPropertyCopyReadOnly _name_ * (^ m_height_s) (CGFloat height) ;\
\
LXPropertyCopyReadOnly _name_ * (^ m_size_s) (CGSize size) ;\
\
LXPropertyCopyReadOnly _name_ * (^ m_size1_s) (CGFloat width, CGFloat height) ;
#endif

//--------UIView
#ifndef LXAddView
#define LXAddView(_name_)\
LXAddViewChain(_name_)\
LXViewSetFrame(_name_)
#endif

//----------UIControl


#ifndef LXAddControl
#define LXAddControl(_name_)\
LXPropertyCopyReadOnly _name_ * (^m_addTarget) (id target, SEL sel, UIControlEvents status) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_removeTarget) (id target, SEL sel, UIControlEvents status) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_addTargetBlock) (UIControlEvents status, m_targetBlock tartgeBlock) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_removeTargetBlock) (UIControlEvents status) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_removeAllTarget) (void) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_selected) (BOOL selected) ;\
LXAddView(_name_)

#endif

//-------------UIButton
#ifndef LXAddButton
#define LXAddButton(_name_)\
LXPropertyCopyReadOnly _name_ * (^m_title) (NSString *title, UIControlState state);\
LXPropertyCopyReadOnly _name_ * (^m_image) (UIImage *image, UIControlState state);\
LXPropertyCopyReadOnly _name_ * (^m_textColor) (UIColor *color, UIControlState state);\
LXPropertyCopyReadOnly _name_ * (^m_attributedTitle) (NSAttributedString *title, UIControlState state);\
LXPropertyCopyReadOnly _name_ * (^m_backImage) (UIImage *image, UIControlState state);\
LXPropertyCopyReadOnly _name_ * (^m_shadowColor) (UIColor *color, UIControlState state);\
LXPropertyCopyReadOnly _name_ * (^m_titleLabel) (m_buttonLabel label) ;\
LXPropertyCopyReadOnly _name_ * (^m_titleFont) (UIFont * font) ;\
LXPropertyCopyReadOnly _name_ * (^m_imageView) (m_buttonImage imageView) ;\
LXAddControl(_name_)
#endif

//--------UIScrollView
#ifndef LXAddScrollView
#define LXAddScrollView(_name_)\
LXPropertyCopyReadOnly _name_ * (^m_contentSize)(CGSize contentSize);\
LXPropertyCopyReadOnly _name_ * (^m_setOffset)(CGPoint offset);\
LXPropertyCopyReadOnly _name_ * (^m_setOffsetAnimated)(CGPoint offset,BOOL animaited);\
LXPropertyCopyReadOnly _name_ * (^m_delegate)(id delegate);\
LXPropertyCopyReadOnly _name_ * (^m_showsVertical)(BOOL isShow);\
LXPropertyCopyReadOnly _name_ * (^m_showsHorizontal)(BOOL isShow);\
LXPropertyCopyReadOnly _name_ * (^m_adJustedContentIOS11) (void);\
LXPropertyCopyReadOnly _name_ * (^m_setContentInset) (UIEdgeInsets edges);\
LXPropertyCopyReadOnly _name_ * (^m_bounces) (BOOL bounces);\
LXPropertyCopyReadOnly _name_ * (^m_pagingEnabled) (BOOL pagingEnabled);\
LXPropertyCopyReadOnly _name_ * (^m_scrollEnabled) (BOOL scrollEnabled);\
LXPropertyCopyReadOnly _name_ * (^m_scrollIndicatorInsets) (UIEdgeInsets scrollIndicatorInsets);\
LXPropertyCopyReadOnly _name_ * (^m_indicatorStyle) (UIScrollViewIndicatorStyle indicatorStyle);\
LXPropertyCopyReadOnly _name_ * (^m_scrollsToTop) (BOOL scrollsToTop);\
LXAddView(_name_)
#endif

//-------UILabel
#ifndef LXAddLabel
#define LXAddLabel(_name_)\
LXPropertyCopyReadOnly _name_ * (^m_text) (NSString *text) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_font) (UIFont *font) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_textColor) (UIColor *textColor) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_textAlignment) (NSTextAlignment alignment) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_attributed) (NSAttributedString *attributedString) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_lineBreak) (NSLineBreakMode lineBreakMode) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_numberOfLines) (NSInteger numberLines) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_adjustsFontSize) (BOOL adjustsFontSize) ;\
LXAddView(_name_)
#endif

#ifndef LXAddImageView
#define LXAddImageView(_name_)\
LXAddView(_name_)\
LXPropertyCopyReadOnly _name_ * (^m_image) (UIImage *image) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_highlightedImage) (UIImage *highlightedImage) ;\

#endif

#ifndef LXAddTextFeild
#define LXAddTextFeild(_name_)\
LXAddControl(_name_)\
LXPropertyCopyReadOnly _name_ * (^m_leftView) (UIView *view) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_rightView) (UIView *view) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_returnKeyType) (UIReturnKeyType type) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_font) (UIFont *font) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_textColor) (UIColor *color) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_leftVieLXode) (UITextFieldVieLXode model) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_rightVieLXode) (UITextFieldVieLXode model) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_tintColor) (UIColor *color) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_placeholder) (NSString *text) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_text) (NSString *text) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_placeholderColor) (UIColor *color) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_placeholderFont) (UIFont *font) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_clearButtonMode) (UITextFieldVieLXode model) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_delegate) (id<UITextFieldDelegate> delegate) ;

#endif


#ifndef LXAddTableView
#define LXAddTableView(_name_)\
\
LXPropertyCopyReadOnly _name_ * (^m_rowHeight) (CGFloat rowHeight) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_sectionHeaderHeight) (CGFloat sectionHeaderHeight) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_sectionFooterHeight) (CGFloat sectionFooterHeight) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_registerCellNib) (UINib *nib, NSString * indetifier) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_registerCellClass) (Class clas, NSString * indetifier) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_registerHeaderFooterNib) (UINib *nib, NSString * indetifier) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_registerHeaderFooterClass) (Class clas, NSString * indetifier) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_backgroundView) (UIView *view) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_scrollToRowAtIndexPath) (NSIndexPath *indexPath, UITableViewScrollPosition position, BOOL animated) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_scrollToRowAtRowSection) (NSInteger row, NSInteger section, UITableViewScrollPosition position, BOOL animated) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_selectRowAtIndexPath) (NSIndexPath *indexPath, BOOL animated, UITableViewScrollPosition scrollPosition) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_deselectRowAtIndexPath) (NSIndexPath *indexPath, BOOL animated) ;\
\
LXPropertyCopyReadOnly _name_ * (^m_dataSource)(id <UITableViewDataSource>dataSource);\
LXAddScrollView(_name_)
#endif


#ifndef LXAddCollectionView
#define LXAddCollectionView(_name_)\
LXAddScrollView(_name_)
#endif



#endif /* LXDefine_h */
