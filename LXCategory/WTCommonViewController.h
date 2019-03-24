//
//  WTCommonViewController.h
//  WisdomTree
//
//  Created by 麻小亮 on 2018/12/20.
//  Copyright © 2018 able-elec. All rights reserved.
//

#import "WTCommonNavigationBar.h"

NS_ASSUME_NONNULL_BEGIN
//------------------tableView
@interface WTCommonTableViewModel : NSObject
//tableView的类
@property (nonatomic, copy) NSString *  clas;
//tableView的样式
@property (nonatomic, assign) UITableViewStyle  style;
//是否自定义布局
@property (nonatomic, assign) BOOL  isCustomLayout;
//详细设置tableView属性
@property (nonatomic, copy) void (^tableView) (UITableView *tableView);
@end

//协议
@protocol WTCommonTableViewProtocol <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@optional
//设置父视图
- (UIView *)comonTableViewSuperView;
//设置一些属性
- (void)commonTableViewModel:(WTCommonTableViewModel *)model;

@end


//------------------collectionView

@interface WTCommonCollectionViewModel : NSObject

@property (nonatomic, strong) UICollectionViewFlowLayout * layout;

@property (nonatomic, copy) void (^layoutSetting) (UICollectionViewFlowLayout *layout);

@end

@protocol WTCommonCollectionViewProtocol <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView * collectionView;
@optional

- (UIView *)commonCollectionViewSuperView;

- (void)commonCollectionModel:(WTCommonCollectionViewModel *)model;

@end

@protocol WTCommonNavigationProtocol <WTCommonNavigationBarDelegate>

@property (nonatomic, strong) WTCommonNavigationBar * navigationBar;

@optional
- (UIView *)commonNavigationViewSuperView;
@end


typedef NS_ENUM(NSInteger, WTCAppOrientation) {
    WTCAppOrientationProtrait = 0,//竖向
    WTCAppOrientationLeft = 1,
    WTCAppOrientationWithOutDown = 2 ,//不向下
    WTCAppOrientationLandscape = 3//横向
};



@interface WTCommonViewController : UIViewController

/**
 额外的信息
 */
@property (nonatomic, strong) NSMutableDictionary * extraInfo;

@end

NS_ASSUME_NONNULL_END
