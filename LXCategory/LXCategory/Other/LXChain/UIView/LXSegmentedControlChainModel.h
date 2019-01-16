//
//  LXSegmentedControlChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseControllChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXSegmentedControlChainModel;
@interface LXSegmentedControlChainModel : LXBaseControllChainModel<LXSegmentedControlChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ momentary) (BOOL momentary);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ apportionsSegmentWidthsByContent) (BOOL apportionsSegmentWidthsByContent);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ removeAllSegments) (void);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ insertSegmentWithTitle) (NSString * title, NSUInteger index, BOOL animated);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ insertSegmentWithImage) (UIImage * image, NSUInteger index, BOOL animated);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ removeSegmentAtIndex) (NSUInteger index);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ setTitle) (NSString *title, NSUInteger index);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ setImage) (UIImage *image, NSUInteger index);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ setWidth) (CGFloat width, NSUInteger index);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ setContentOffset) (CGSize offset, NSUInteger index);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ setEnabled) (BOOL enable, NSUInteger index);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ selectedSegmentIndex) (NSInteger selectedSegmentIndex);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ setBackgroundImage) (UIImage *image, UIControlState state, UIBarMetrics barMetrics);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ setDividerImage) (UIImage *image, UIControlState leftState, UIControlState rightState, UIBarMetrics barMetrics);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ setTitleTextAttributes) (NSDictionary <NSAttributedStringKey ,id>* attributes, UIControlState state);
LXCATEGORY_CHAIN_PROPERTY LXSegmentedControlChainModel* (^ setContentPositionAdjustment) (UIOffset adjustment, UISegmentedControlSegment leftCenterRightOrAlone, UIBarMetrics barMetrics);

@end
LXCreate(UISegmentedControl)
LXCATEGORY_EXINTERFACE(UISegmentedControl, LXSegmentedControlChainModel)
NS_ASSUME_NONNULL_END
