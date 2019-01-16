//
//  ViewController.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/11/20.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "ViewController.h"
#import "YYModel.h"
#import "EXTConcreteProtocol.h"


@protocol MyProtocol <NSObject>

@concrete
- (UILabel *)myView;
- (id <MyProtocol>)masf;
@end

@concreteprotocol(MyProtocol)

- (id<MyProtocol>)masf{
    self.myView.text = @"1111";
    return nil;
}

@end

@protocol MyProtocol1 <MyProtocol>
@concrete
+ (NSUInteger)meaningfulNumber;
- (NSString *)getSomeString;
@end

@concreteprotocol(MyProtocol1)

@end

@interface ViewController ()<LXommonTableViewProtocol, LXommonNavigationProtocol>
@property (nonatomic, strong) UILabel * label;
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
    
    [self.navigationBar setupTag:0 WithBlock:^(LXommonNavigationBar * _Nonnull bar) {
        [UIView animateWithDuration:0.15 animations:^{
            bar.line.hidden = YES;
            bar.backgroundColor = [UIColor redColor];
            bar.middleButton.makeChain.textColor([UIColor yellowColor], UIControlStateNormal);
        }];
    }];
    
    [self.navigationBar setupTag:1 WithBlock:^(LXommonNavigationBar * _Nonnull bar) {
        [UIView animateWithDuration:0.15 animations:^{
            bar.line.hidden = NO;
            bar.backgroundColor = [UIColor whiteColor];
            bar.middleButton.makeChain.textColor([UIColor blackColor], UIControlStateNormal);
        }];
    }];
    UILabelCreate().makeChain
    .addToSuperView(self.view)
    .center(self.view.center)
    .userInteractionEnabled(YES)
    .addGesture(UITapGestureRecognizerCreate().makeChain.addTargetBlock(^(id  _Nonnull gesture) {
        NSLog(@"1");
    }).gesture)
    .textColor([UIColor blackColor])
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-100);
    })
    //    .image([UIImage imageWithSmallGIFData:data scale:1])
    .assignTo(^(id  _Nonnull view) {
        self.label = view;
    });
    
    [self.navigationBar setTag:0];
}

- (UILabel *)myView{
    return self.label;
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
