//
//  ViewController.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/11/20.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "ViewController.h"
#import "LXCategory.h"
#import "LXDefine.h"
#import "UIView+LXChain.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor *color = [UIColor redColor];
    [[UITableView alloc] init].makeChain
    .backgroundColor(color)
    .frame(CGRectMake(0, 0, 100, 100))
    .center(self.view.center)
    .addToSuperView(self.view)
    .cornerRadius(50)
    .border(1, [UIColor blackColor])
    .registerCellClass([UITableViewCell class], @"class");
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

//- (NSInteger)aaaaa{
//    return 1;
//}
//
//
//@dynamic w_center_s;

@end
