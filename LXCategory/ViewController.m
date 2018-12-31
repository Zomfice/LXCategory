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
@interface ViewController ()<WTCommonTableViewProtocol, WTCommonNavigationProtocol, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UILabel * label;
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
    [self.navigationBar setTag:0];
   
    UILabelCreate()
    .makeChain
    .text(@"23")
    .textColor([UIColor yellowColor])
    .frame(CGRectMake(0, 0, 100, 100))
    .addToSuperView(self.view)
    .backgroundColor([UIColor randomColor])
    .center(self.view.center)
    .userInteractionEnabled(YES)
    .addGesture([[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        NSLog(@"1");
    }].makeChain.delegate(self).gesture)
    .assignTo(^(id  _Nonnull view) {
        self.label = view;
    });
    // Do any additional setup after loading the view, typically from a nib.
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.navigationBar setTag:scrollView.contentOffset.y > 50];
}


@end
