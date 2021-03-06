//
//  WTCommonViewController.m
//  WisdomTree
//
//  Created by 麻小亮 on 2018/12/20.
//  Copyright © 2018 able-elec. All rights reserved.
//

#import "WTCommonViewController.h"
#import "UITableView+LXCategory.h"
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


- (void)commonSetupTableView{
    id <WTCommonTableViewProtocol> vc = (id <WTCommonTableViewProtocol>) self;
    SEL sel = NSSelectorFromString(@"commonTableViewModel:");
    WTCommonTableViewModel *model = [WTCommonTableViewModel new];
    if ([self respondsToSelector:sel]) {
        [self performSelectorWithArguments:sel,model];
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
    tableView.makeChain
    .adJustedContentIOS11()
    .dataSource(vc)
    .delegate(vc)
    .separatorStyle(UITableViewCellSeparatorStyleNone);
    
    vc.tableView = tableView;
    UIView *view = self.view;
    SEL sel1 = NSSelectorFromString(@"comonTableViewSuperView");
    if ([self respondsToSelector:sel1]) {
        view = [self performSelectorWithArguments:sel1];
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
        [self performSelectorWithArguments:sel,model];
    }
    UICollectionViewFlowLayout *layout = model.layout;
    if (!layout) {
        layout = [[UICollectionViewFlowLayout alloc] init];
    }
    if (model.layoutSetting) {
        model.layoutSetting(layout);
    }
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.makeChain.delegate(vc)
    .dataSource(vc)
    .showsVerticalScrollIndicator(NO)
    .showsHorizontalScrollIndicator(NO)
    .adJustedContentIOS11()
    .backgroundColor([UIColor whiteColor]);

    vc.collectionView = collectionView;
    SEL sel1 = NSSelectorFromString(@"commonCollectionViewSuperView");
    UIView *view = self.view;
    if ([self respondsToSelector:sel1]) {
        view = [self performSelectorWithArguments:sel1];
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
        view = [self performSelectorWithArguments:superSel];
    }
    [view addSubview:bar];
    if (self.view == view) {
        [bar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_offset(0);
            make.height.mas_equalTo(64);
        }];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}



- (NSMutableDictionary *)extraInfo{
    if (!_extraInfo) {
        _extraInfo = [NSMutableDictionary dictionary];
    }
    return _extraInfo;
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
