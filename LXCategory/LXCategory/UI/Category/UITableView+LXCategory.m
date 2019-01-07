//
//  UITableView+LXCategory.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "UITableView+LXCategory.h"
#import "UIScrollView+LXCategory.h"
@implementation UITableView (LXCategory)

+ (UITableView *)tableViewStyle:(UITableViewStyle)style{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    return tableView;
}

- (void)adJustedContentIOS11{
    UITableView *tableView = (UITableView *)self;
    [tableView setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
}
@end
