//
//  UIViewController+LXCategory.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/21.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "UIViewController+LXCategory.h"

@implementation UIViewController (LXCategory)
- (void)presentTransparentViewController:(UIViewController *)vc{
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:vc animated:NO completion:nil];
}

- (void)presentedTransparentViewController:(UIViewController *)vc{
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [vc presentViewController:self animated:NO completion:nil];
}
@end
