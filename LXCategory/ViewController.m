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

@end
static Byte AES_KEY[32] = {
    0xa1, 0xb1, 0xc1, 0xd1, 0xe1, 0xf1,
    0xf2, 0xa2, 0xb2, 0xc2, 0xd2, 0xe2,
    0xe3, 0xf3, 0xa3, 0xb3, 0xc3, 0xd3,
    0xd4, 0xe4, 0xf4, 0xa4, 0xb4, 0xc4,
    0xc5, 0xd5, 0xe5, 0xf5, 0xa5, 0xb5,
    0xb6, 0xc6
};

static Byte AES_IV[16] = {
    0x1a, 0x2b, 0x3c, 0x4d,
    0x5e, 0x6f, 0x7a, 0x8b,
    0x9c, 0x1d, 0x2e, 0x3f,
    0x4a, 0x5b, 0x6c, 0x7d
};
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
    //NSData *data = [NSData dataWithBytes:AES_KEY length:32];
    //NSData *vi = [NSData dataWithBytes:vi length:16];
    //NSData *data = [[@"麻小亮" utf8Data] aes256EncryptWithKey:data iv:vi];
    
    //NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    //NSLog(@"%@", [data aes256DecryptWithkey:[@"asdfas阿斯顿发到付" utf8Data] iv:[@"asdfas阿斯顿发到付" utf8Data]]);
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
