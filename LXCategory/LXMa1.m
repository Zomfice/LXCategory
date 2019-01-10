//
//  LXMa1.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/7.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXMa1.h"
#import "LXCategory.h"
#import "LXDefine.h"
#import "UIView+LXChain.h"
#import "YYClassInfo.h"



@interface LXMa1 ()<UIGestureRecognizerDelegate, UITextFieldDelegate>
@property (nonatomic, strong) UIButton * label;

@end

@implementation LXMa1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UIImageView new].makeChain
    .addToSuperView(self.view)
    .center(self.view.center)
    .userInteractionEnabled(YES)
    .layerBackGroundColor([UIColor yellowColor])
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-100);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(100);
    })
    .image([[UIImage imageNamed:@"Bitmap"] imageByBlurRadius:20 tintColor:[UIColor colorWithWhite:1 alpha:0.5] tintMode:kCGBlendModeNormal saturation:1.0 maskImage:nil])
    .assignTo(^(id  _Nonnull view) {
        self.label = view;
        
    });
    //    .image([UIImage animatedGifName:@"11"], UIControlStateNormal)
    //    .imageDirection(LXButtonImageDirectionRight,5);
    
    //    self.label.layer.makeChain
    //    .borderColor(UIColorHexString(@"333333").CGColor)
    //    .cornerRadius(50)
    //    .borderWidth(1)
    //    .shadowColor(UIColorHexString(@"adfadf").CGColor)
    //    .shadowRadius(10)
    //    .shadowOpacity(1);
    
}



//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    
//    if (textField.text.length == textField.limitLength && string.length > 0 && ![textField isTextEditing]) {
//        return NO;
//    }else{
//        return YES;
//    }
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */




@end
