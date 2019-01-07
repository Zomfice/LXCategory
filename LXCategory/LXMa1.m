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

@interface sa : UITextField

@end
@implementation sa

- (void)dealloc
{
    
}

@end

@interface LXMa1 ()<UIGestureRecognizerDelegate, UITextFieldDelegate>
@property (nonatomic, strong) UIButton * label;
@end

@implementation LXMa1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"我爱" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor redColor]}];
    [att appendAttributedString:[[NSAttributedString alloc] initWithString:@"麻小亮" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]}]];
    [sa new].makeChain
    .addToSuperView(self.view)
    .center(self.view.center)
    .userInteractionEnabled(YES)
    .layerBackGroundColor([UIColor yellowColor])
    .limitLength(5)
    //    .attributedTitle(att, UIControlStateNormal)
    //    .textColor([UIColor blackColor], UIControlStateNormal)
    //    .addTargetBlock(^(id  _Nonnull sender) {
    //        NSLog(@"1");
    //    }, UIControlEventTouchUpInside)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(100);
    })
    .delegate(self)
    .assignTo(^(id  _Nonnull view) {
        self.label = view;
        
    })
    //    .image([UIImage animatedGifName:@"11"], UIControlStateNormal)
    .font([UIFont systemFontOfSize:14]);
    //    .imageDirection(LXButtonImageDirectionRight,5);
    
    //    self.label.layer.makeChain
    //    .borderColor(UIColorHexString(@"333333").CGColor)
    //    .cornerRadius(50)
    //    .borderWidth(1)
    //    .shadowColor(UIColorHexString(@"adfadf").CGColor)
    //    .shadowRadius(10)
    //    .shadowOpacity(1);
    // Do any additional setup after loading the view.
    NSLog(@"%f, %f",[UIScreen screenWidth], [UIScreen screenHeight]);
    
    NSString *string = [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sfg" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", [string jsonDictionary]);
    
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

- (void)dealloc
{
    
}

@end
