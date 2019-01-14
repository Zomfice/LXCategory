//
//  LXSegmentedControlChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXSegmentedControlChainModel.h"
#define LXCATEGORY_CHAIN_SEGMENT_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXSegmentedControlChainModel *,UISegmentedControl)
LXCATEGORY_VIEW_IMPLEMENTATION(UISegmentedControl, LXSegmentedControlChainModel)

#define LXCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION(LXTYPE,METHOD)\
- (LXSegmentedControlChainModel * _Nonnull (^)(LXTYPE, NSUInteger))METHOD{\
    return ^ (LXTYPE t, NSUInteger i){\
        [(UISegmentedControl *)self.view METHOD:t forSegmentAtIndex:i];\
        return self;\
    };\
}\

@implementation LXSegmentedControlChainModel

LXCATEGORY_CHAIN_SEGMENT_IMPLEMENTATION(momentary, BOOL)
LXCATEGORY_CHAIN_SEGMENT_IMPLEMENTATION(apportionsSegmentWidthsByContent, BOOL)

- (LXSegmentedControlChainModel * _Nonnull (^)(void))removeAllSegments{
    return ^ (){
        [(UISegmentedControl *)self.view removeAllSegments];
        return self;
    };
}
LXCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION(NSString * , setTitle)
LXCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION(UIImage * , setImage)
LXCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION(CGFloat , setWidth)
LXCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION(CGSize, setContentOffset)
LXCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION(BOOL , setEnabled)
LXCATEGORY_CHAIN_SEGMENT_IMPLEMENTATION(selectedSegmentIndex, NSInteger)

- (LXSegmentedControlChainModel * _Nonnull (^)(UIImage * _Nonnull, UIControlState, UIBarMetrics))setBackgroundImage{
    return ^ (UIImage * _Nonnull a , UIControlState b, UIBarMetrics c){
        [(UISegmentedControl *)self.view setBackgroundImage:a forState:b barMetrics:c];
        return self;
    };
}

- (LXSegmentedControlChainModel * _Nonnull (^)(UIImage * _Nonnull, UIControlState, UIControlState, UIBarMetrics))setDividerImage{
    return ^ (UIImage * _Nonnull a , UIControlState b, UIControlState b1, UIBarMetrics c){
        [(UISegmentedControl *)self.view setDividerImage:a forLeftSegmentState:b rightSegmentState:b1 barMetrics:c];
        return self;
    };
}

- (LXSegmentedControlChainModel * _Nonnull (^)(NSDictionary<NSAttributedStringKey,id> * _Nonnull, UIControlState))setTitleTextAttributes{
    return ^ (NSDictionary<NSAttributedStringKey,id> * _Nonnull a, UIControlState b){
        [(UISegmentedControl *)self.view setTitleTextAttributes:a forState:b];
        return self;
    };
}


- (LXSegmentedControlChainModel * _Nonnull (^)(UIOffset, UISegmentedControlSegment, UIBarMetrics))setContentPositionAdjustment{
    return ^ (UIOffset a, UISegmentedControlSegment b, UIBarMetrics c){
        [(UISegmentedControl *)self.view setContentPositionAdjustment:a forSegmentType:b barMetrics:c];
        return self;
    };
}

@end
#undef LXCATEGORY_CHAIN_SEGMENT_IMPLEMENTATION
#undef LXCATEGORY_CHAIN_SEGMENT_METHOD_IMPLEMENTATION
