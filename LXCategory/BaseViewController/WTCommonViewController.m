//
//  WTCommonViewController.m
//  WisdomTree
//
//  Created by 麻小亮 on 2018/12/20.
//  Copyright © 2018 able-elec. All rights reserved.
//

#import "WTCommonViewController.h"
@implementation WTCommonTableViewModel

@end

@implementation WTCommonCollectionViewModel

@end

@interface WTCommonViewController ()

@end

@implementation WTCommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self conformsToProtocol:@protocol(WTCommonNavigationProtocol)]) {
        [self commonSetupNavigationView];
    }
    if ([self conformsToProtocol:@protocol(WTCommonTableViewProtocol)]) {
        [self commonSetupTableView];
    }
    if ([self conformsToProtocol:@protocol(WTCommonCollectionViewProtocol)]) {
        [self commonSetupCollectionView];
    }
    // Do any additional setup after loading the view.
}

- (void)setSwipeCanPop:(BOOL)swipeCanPop{
    _swipeCanPop = swipeCanPop;
    self.navigationController.interactivePopGestureRecognizer.enabled = swipeCanPop;
}

- (void)commonSetupTableView{
    id <WTCommonTableViewProtocol> vc = (id <WTCommonTableViewProtocol>) self;
    SEL sel = NSSelectorFromString(@"commonTableViewModel:");
    WTCommonTableViewModel *model = [WTCommonTableViewModel new];
    if ([self respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:sel withObject:model];
#pragma clang diagnostic pop
    }
    Class class;
    if (model.clas.length > 0) {
        class = NSClassFromString(model.clas);
    }
    if (![class isSubclassOfClass:[UITableView class]]) {
        class = [UITableView class];
    }
    UITableViewStyle style = model.style;
    UITableView *tableView = [class tableViewStyle:style];
    tableView.dataSource = vc;
    tableView.delegate = vc;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    vc.tableView = tableView;
    [tableView adJustedContentIOS11];
    UIView *view = self.view;
    SEL sel1 = NSSelectorFromString(@"comonTableViewSuperView");
    if ([self respondsToSelector:sel1]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        view = [self performSelector:sel1];
#pragma clang diagnostic pop
    }
    if (model.tableView) {
        model.tableView(tableView);
    }
    if (view) {
        [view addSubview:tableView];
    }
    
    UIView *topView = nil;
    if ([self conformsToProtocol:@protocol(WTCommonNavigationProtocol)]) {
        topView = [(id <WTCommonNavigationProtocol>) vc navigationBar];
        [self.view bringSubviewToFront:topView];
    }
    
    if (view == self.view && !model.isCustomLayout) {
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (topView) {
                make.top.equalTo(topView.mas_bottom);
            }else{
                make.top.equalTo(self.view.mas_top);
            }
            make.left.bottom.right.mas_offset(0);
        }];
    }
}


- (void)commonSetupCollectionView{
    id <WTCommonCollectionViewProtocol> vc = (id <WTCommonCollectionViewProtocol>) self;
    SEL sel = NSSelectorFromString(@"commonCollectionModel:");
    WTCommonCollectionViewModel *model = [WTCommonCollectionViewModel new];
    if ([self respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:sel withObject:model];
#pragma clang diagnostic pop
    }
    UICollectionViewFlowLayout *layout = model.layout;
    if (!layout) {
        layout = [[UICollectionViewFlowLayout alloc] init];
    }
    if (model.layoutSetting) {
        model.layoutSetting(layout);
    }
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.delegate = vc;
    collectionView.dataSource = vc;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.backgroundColor = [UIColor whiteColor];
    vc.collectionView = collectionView;
    SEL sel1 = NSSelectorFromString(@"commonCollectionViewSuperView");
    UIView *view = self.view;
    if ([self respondsToSelector:sel1]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        view = [self performSelector:sel1];
#pragma clang diagnostic pop
    }
    if (view) {
        [view addSubview:collectionView];
    }
    UIView *topView = nil;
    if ([self conformsToProtocol:@protocol(WTCommonNavigationProtocol)]) {
        topView = [(id <WTCommonNavigationProtocol>) vc navigationBar];
        [self.view bringSubviewToFront:topView];
    }
    if (view == self.view) {
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (topView) {
                make.top.equalTo(topView.mas_bottom);
            }else{
                make.top.equalTo(self.view);
            }
            make.left.bottom.right.mas_offset(0);
        }];
    }
}



- (void)commonSetupNavigationView{
    WTCommonNavigationBar *bar = [WTCommonNavigationBar new];
    id <WTCommonNavigationProtocol> vc =  (id <WTCommonNavigationProtocol>)self;
    [vc setNavigationBar:bar];
    bar.delegate = vc;
    UIView * view = self.view;
    SEL superSel = NSSelectorFromString(@"commonNavigationViewSuperView");
    if ([self respondsToSelector:superSel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        view = [self performSelector:superSel];
#pragma clang diagnostic pop
    }
    [view addSubview:bar];
    if (self.view == view) {
        [bar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_offset(0);
            make.height.mas_equalTo(StatusBarHeight + NavigationBarHeight);
        }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
