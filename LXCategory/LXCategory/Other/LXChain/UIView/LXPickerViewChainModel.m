//
//  LXPickerViewChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/11.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXPickerViewChainModel.h"
#define LXCATEGORY_CHAIN_PICKER_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXPickerViewChainModel *,UIPickerView)
LXCATEGORY_VIEW_IMPLEMENTATION(UIPickerView, LXPickerViewChainModel)
@implementation LXPickerViewChainModel
LXCATEGORY_CHAIN_PICKER_IMPLEMENTATION(dataSource, id<UIPickerViewDataSource>)
LXCATEGORY_CHAIN_PICKER_IMPLEMENTATION(delegate, id<UIPickerViewDelegate>)
LXCATEGORY_CHAIN_PICKER_IMPLEMENTATION(showsSelectionIndicator, BOOL)

- (NSInteger (^)(NSInteger))numberOfRowsInComponent{
    return ^ (NSInteger n){
        return [(UIPickerView *)self.view numberOfRowsInComponent:1];
    };
}

- (LXPickerViewChainModel * _Nonnull (^)(void))reloadAllComponents{
    return ^ (){
        [(UIPickerView *)self.view reloadAllComponents];
        return self;
    };
}

- (CGSize (^)(NSInteger))rowSizeForComponent{
    return ^ (NSInteger n){
        return [(UIPickerView *)self.view rowSizeForComponent:1];
    };
}

- (LXPickerViewChainModel * _Nonnull (^)(NSInteger))reloadComponent{
    return ^ (NSInteger n){
        [(UIPickerView *)self.view reloadComponent:1];
        return self;
    };
}

- (UIView * _Nonnull (^)(NSInteger, NSInteger))viewForRowComponent{
    return ^ (NSInteger n, NSInteger n1){
        return [(UIPickerView *)self.view viewForRow:n forComponent:n1];
    };
}

- (LXPickerViewChainModel * _Nonnull (^)(NSInteger, NSInteger, BOOL))selectRowInComponent{
    return ^ (NSInteger a, NSInteger b, BOOL c){
        [(UIPickerView *)self.view selectRow:a inComponent:b animated:c];
        return self;
    };
}

- (NSInteger (^)(NSInteger))selectedRowInComponent{
    return ^ (NSInteger n){
       return [(UIPickerView *)self.view selectedRowInComponent:1];
    };
}

@end
#undef LXCATEGORY_CHAIN_PICKER_IMPLEMENTATION
