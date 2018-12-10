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
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)].w_center_s(self.view.center);
    view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}
//- (NSInteger)aaaaa{
//    return 1;
//}
//
//
//@dynamic w_center_s;

@end
