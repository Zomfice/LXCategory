//
//  LXommonViewController.h
//  WisdomTree
//
//  Created by 麻小亮 on 2018/12/20.
//  Copyright © 2018 able-elec. All rights reserved.
//

#import "LXommonNavigationBar.h"

//------------------tableView
@interface LXommonTableViewModel : NSObject
//tableView的类
@property (nonatomic, copy) NSString * clas;
//tableView的样式
@property (nonatomic, assign) UITableViewStyle  style;
//是否自定义布局
@property (nonatomic, assign) BOOL  isCustomLayout;
//详细设置tableView属性
@property (nonatomic, copy) void (^tableView) (UITableView *tableView);
@end

//协议
@protocol LXommonTableViewProtocol <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@optional
//设置父视图
- (UIView *)comonTableViewSuperView;
//设置一些属性
- (void)commonTableViewModel:(LXommonTableViewModel *)model;

@end


//------------------collectionView

@interface LXommonCollectionViewModel : NSObject

@property (nonatomic, strong) UICollectionViewFlowLayout * layout;

@property (nonatomic, copy) void (^layoutSetting) (UICollectionViewFlowLayout *layout);

@end

@protocol LXommonCollectionViewProtocol <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView * collectionView;
@optional

- (UIView *)commonCollectionViewSuperView;

- (void)commonCollectionModel:(LXommonCollectionViewModel *)model;

@end

@protocol LXommonNavigationProtocol <LXommonNavigationBarDelegate>

@property (nonatomic, strong) LXommonNavigationBar * navigationBar;

@optional
- (UIView *)commonNavigationViewSuperView;
@end

NS_ASSUME_NONNULL_BEGIN

@interface LXommonViewController : UIViewController
@property (nonatomic, assign) BOOL swipeCanPop;
@end

NS_ASSUME_NONNULL_END
