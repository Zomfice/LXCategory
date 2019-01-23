//
//  ViewController.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/11/20.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "ViewController.h"
#import "YYModel.h"



@interface ViewController ()<WTCommonTableViewProtocol, WTCommonNavigationProtocol>
@property (nonatomic, strong) UILabel * label;
@end

@implementation ViewController
@synthesize tableView = _tableView, navigationBar = _navigationBar;

- (UILabel *)myView{
    return self.label;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    NSString *str =  [[@"123456".utf8Data aesEncryptStringWithKey:@"swqrfchh" iv:@"uqwrjvds$vfvw5pd" keySize:kCCKeySizeAES128] base64EncodedString];
   
    self.navigationController.navigationBar.hidden = YES;
    self.navigationBar.middleButton.makeChain
    .text(@"海贼王", UIControlStateNormal)
    .textColor([UIColor blackColor], UIControlStateNormal);
    
    self.tableView.makeChain
    .registerCellClass([UITableViewCell class], @"cell");
 
    [self.navigationBar setupTag:0 WithBlock:^(WTCommonNavigationBar * _Nonnull bar) {
        [UIView animateWithDuration:0.15 animations:^{
            bar.line.hidden = YES;
            bar.backgroundColor = [UIColor redColor];
            bar.middleButton.makeChain.textColor([UIColor yellowColor], UIControlStateNormal);
        }];
    }];
    
    [self.navigationBar setupTag:1 WithBlock:^(WTCommonNavigationBar * _Nonnull bar) {
        [UIView animateWithDuration:0.15 animations:^{
            bar.line.hidden = NO;
            bar.backgroundColor = [UIColor whiteColor];
            bar.middleButton.makeChain.textColor([UIColor blackColor], UIControlStateNormal);
        }];
    }];
    
    [[NSFileManager defaultManager] addPreNameAtPath:@"/Users/maxiaoliang/Desktop/1/ma" preName:@"aidteach_changeterm_"];
    
    [self.navigationBar setTag:0];
    
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)middleButtonTap:(UIButton *)button{
    NSLog(@"海贼王");
}

- (void)navigationClick:(UIView *)view{
    NSLog(@"呵呵");
}

- (BOOL)navigationEventsShouldPass{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *clasName = [NSString stringWithFormat:@"LXMa%ld", indexPath.row];
    Class clas = NSClassFromString(clasName);
    if (clas) {
        [self.navigationController pushViewController:[clas new] animated:YES];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.navigationBar setTag:scrollView.contentOffset.y > 50];
}


@end
