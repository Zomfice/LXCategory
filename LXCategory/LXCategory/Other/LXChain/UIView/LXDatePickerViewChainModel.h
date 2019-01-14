//
//  LXUIDatePickerViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXControlChainModel.h"

NS_ASSUME_NONNULL_BEGIN
@class LXDatePickerViewChainModel;
@interface LXDatePickerViewChainModel : LXControlChainModel<LXDatePickerViewChainModel *>
LXCATEGORY_CHAIN_PROPERTY LXDatePickerViewChainModel * (^ datePickerMode) (UIDatePickerMode datePickerMode);
LXCATEGORY_CHAIN_PROPERTY LXDatePickerViewChainModel * (^ locale) (NSLocale* locale);
LXCATEGORY_CHAIN_PROPERTY LXDatePickerViewChainModel * (^ calendar) (NSCalendar* calendar);
LXCATEGORY_CHAIN_PROPERTY LXDatePickerViewChainModel * (^ timeZone) (NSTimeZone* timeZone);
LXCATEGORY_CHAIN_PROPERTY LXDatePickerViewChainModel * (^ date) (NSDate * date);
LXCATEGORY_CHAIN_PROPERTY LXDatePickerViewChainModel * (^ minimumDate) (NSDate * minimumDate);
LXCATEGORY_CHAIN_PROPERTY LXDatePickerViewChainModel * (^ maximumDate) (NSDate * maximumDate);
LXCATEGORY_CHAIN_PROPERTY LXDatePickerViewChainModel * (^ countDownDuration) (NSTimeInterval countDownDuration);
LXCATEGORY_CHAIN_PROPERTY LXDatePickerViewChainModel * (^ minuteInterval) (NSInteger minuteInterval);
LXCATEGORY_CHAIN_PROPERTY LXDatePickerViewChainModel * (^ setDateWithAnimated) (NSDate *date, BOOL animated);

@end
LXCreate(UIDatePicker)
LXCATEGORY_EXINTERFACE(UIDatePicker, LXDatePickerViewChainModel)

NS_ASSUME_NONNULL_END
