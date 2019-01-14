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
    NSString *filePath1 = [[NSBundle mainBundle] pathForResource:@"11" ofType:@"gif"];
    NSData*  data=[NSData dataWithContentsOfFile:filePath1];
    UIActivityIndicatorViewCreate().makeChain
    .addToSuperView(self.view)
    .center(self.view.center)
    .userInteractionEnabled(YES)
    .activityIndicatorViewStyle(UIActivityIndicatorViewStyleGray)
    .addGesture(UITapGestureRecognizerCreate().makeChain.addTargetBlock(^(id  _Nonnull gesture) {
        NSLog(@"1");
    }).gesture)
    .color([UIColor blackColor])
    .startAnimating()
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-100);
    })
//    .image([UIImage imageWithSmallGIFData:data scale:1])
    .assignTo(^(id  _Nonnull view) {
        self.label = view;
        
    });
    
    [[NSFileManager defaultManager] addPreNameAtPath:@"/Users/maxiaoliang/Desktop/1/LSYReader/LSYReader/Reader/MXLCatalogVC" preName:@"MXL"];
    
}

- (void)changeFileName{
    
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
