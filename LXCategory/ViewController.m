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
@interface ViewController ()<WTCommonTableViewProtocol, WTCommonNavigationProtocol>

@end

@implementation ViewController
@synthesize tableView = _tableView, navigationBar = _navigationBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.middleButton.makeChain
    .text(@"海贼王", UIControlStateNormal)
    .textColor([UIColor blackColor], UIControlStateNormal);
    
    self.tableView.makeChain
    .registerCellClass([UITableViewCell class], @"cell");
    
    [self.navigationBar setupTag:0 WithBlock:^(WTCommonNavigationBar * _Nonnull bar) {
        bar.line.hidden = YES;
        bar.backgroundColor = [UIColor redColor];
        bar.middleButton.makeChain.textColor([UIColor yellowColor], UIControlStateNormal);
    }];
    
    [self.navigationBar setupTag:1 WithBlock:^(WTCommonNavigationBar * _Nonnull bar) {
        bar.line.hidden = NO;
        bar.backgroundColor = [UIColor whiteColor];
        bar.middleButton.makeChain.textColor([UIColor blackColor], UIControlStateNormal);
    }];
    
    
    [self.navigationBar setTag:0];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)middleButtonTap:(UIButton *)button{
    NSLog(@"海贼王");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.navigationBar setTag:scrollView.contentOffset.y > 50];
}
//- (NSInteger)aaaaa{
//    return 1;
//}
//
//
//@dynamic w_center_s;

@end
