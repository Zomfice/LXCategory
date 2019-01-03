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
#import "YYClassInfo.h"


@interface ViewController ()<WTCommonTableViewProtocol, WTCommonNavigationProtocol, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIButton * label;
@end

@implementation ViewController
@synthesize tableView = _tableView, navigationBar = _navigationBar;

- (void)viewDidLoad {
    [super viewDidLoad];
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
    [self.navigationBar setTag:0];
    
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:@"asdfasdf" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20], NSForegroundColorAttributeName:[UIColor redColor]}];
    [att appendAttributedString:[[NSAttributedString alloc] initWithString:@"麻小亮" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10]}]];
    UIButtonCreate().makeChain
    .addToSuperView(self.view)
    .center(self.view.center)
    .userInteractionEnabled(YES)
    .backgroundColor([UIColor yellowColor])
    .attributedTitle(att, UIControlStateNormal)
    .textColor([UIColor blackColor], UIControlStateNormal)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.center.equalTo(self.view);
    })
    .assignTo(^(id  _Nonnull view) {
        self.label = view;
    }).image([[[UIImage imageNamed:@"Bitmap"] imageByGrayColor] imageByResizeToSize:CGSizeMake(50, 40)], UIControlStateNormal)
    .font([UIFont systemFontOfSize:14])
    .imageDirection(LXButtonImageDirectionRight, 0);
    
    // Do any additional setup after loading the view, typically from a nib.
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.navigationBar setTag:scrollView.contentOffset.y > 50];
}


@end
