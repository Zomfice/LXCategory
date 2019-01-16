//
//  LXSliderViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseControllChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXSliderViewChainModel;
@interface LXSliderViewChainModel : LXBaseControllChainModel<LXSliderViewChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ value) (float value);
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ minimumValue) (float minimumValue);
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ maximumValue) (float maximumValue);
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ minimumValueImage) (UIImage * minimumValueImage);
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ maximumValueImage) (UIImage * maximumValueImage);
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ continuous) (BOOL continuous);
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ minimumTrackTintColor) (UIColor * minimumTrackTintColor);
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ maximumTrackTintColor) ( UIColor *maximumTrackTintColor);
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ thumbTintColor) (UIColor * thumbTintColor);
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ setThumbImage) (UIImage *image,UIControlState status);
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ setMinimumTrackImage) (UIImage *image,UIControlState status);
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ setMaximumTrackImage) (UIImage *image,UIControlState status);
LXCATEGORY_CHAIN_PROPERTY LXSliderViewChainModel * (^ setValueAnimated) (float value, BOOL animated);
@end
LXCreate(UISlider)
LXCATEGORY_EXINTERFACE(UISlider, LXSliderViewChainModel)
NS_ASSUME_NONNULL_END
