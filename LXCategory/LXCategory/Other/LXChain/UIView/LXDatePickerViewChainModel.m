//
//  LXUIDatePickerViewChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXDatePickerViewChainModel.h"
#define LXCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXDatePickerViewChainModel *,UIDatePicker)
@implementation LXDatePickerViewChainModel
LXCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(datePickerMode, UIDatePickerMode)
LXCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(locale, NSLocale *)
LXCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(calendar, NSCalendar *)
LXCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(timeZone, NSTimeZone *)
LXCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(date, NSDate *)
LXCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(minimumDate, NSDate *)
LXCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(maximumDate, NSDate *)
LXCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(countDownDuration, NSTimeInterval)
LXCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION(minuteInterval, NSInteger)

- (LXDatePickerViewChainModel * _Nonnull (^)(NSDate * _Nonnull, BOOL))setDateWithAnimated{
    return ^ (NSDate *date, BOOL animated){
        [(UIDatePicker *)self.view setDate:date animated:animated];
        return self;
    };
}

@end
LXCATEGORY_VIEW_IMPLEMENTATION(UIDatePicker, LXDatePickerViewChainModel)
#undef LXCATEGORY_CHAIN_DATEPICKER_IMPLEMENTATION
