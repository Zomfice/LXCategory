//
//  LXSliderViewChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXSliderViewChainModel.h"
#define LXCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXSliderViewChainModel *,UISlider)

#define LXCATEGORY_CHAIN_SLIDER_METHOND_IMPLEMENTATION(MehodName)\
- (LXSliderViewChainModel * _Nonnull (^)(UIImage * _Nonnull, UIControlState))MehodName{\
return ^ (UIImage *image, UIControlState state){\
    [(UISlider *)self.view MehodName:image forState:state];\
    return self;\
};\
}

LXCATEGORY_VIEW_IMPLEMENTATION(UISlider, LXSliderViewChainModel)
@implementation LXSliderViewChainModel
LXCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(value ,float);
LXCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(minimumValue ,float);
LXCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(maximumValue ,float);
LXCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(minimumValueImage ,UIImage *);
LXCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(maximumValueImage, UIImage *);
LXCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(continuous, BOOL);
LXCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(minimumTrackTintColor, UIColor *);
LXCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(maximumTrackTintColor ,UIColor *);
LXCATEGORY_CHAIN_SLIDER_IMPLEMENTATION(thumbTintColor ,UIColor *);

- (LXSliderViewChainModel * _Nonnull (^)(float, BOOL))setValueAnimated{
    return ^ (float v, BOOL a){
        [(UISlider *)self.view setValue:v animated:a];
        return self;
    };
}



LXCATEGORY_CHAIN_SLIDER_METHOND_IMPLEMENTATION(setThumbImage)
LXCATEGORY_CHAIN_SLIDER_METHOND_IMPLEMENTATION(setMinimumTrackImage);
LXCATEGORY_CHAIN_SLIDER_METHOND_IMPLEMENTATION(setMaximumTrackImage);

@end
#undef LXCATEGORY_CHAIN_SLIDER_IMPLEMENTATION
#undef LXCATEGORY_CHAIN_SLIDER_METHOND_IMPLEMENTATION
