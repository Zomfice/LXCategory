//
//  LXWebViewChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/28.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXScrollViewChainModel.h"
@import WebKit;
NS_ASSUME_NONNULL_BEGIN
@class LXWebViewChainModel;
@interface LXWebViewChainModel : LXScrollViewChainModel<LXWebViewChainModel *>

@end
LXCATEGORY_EXINTERFACE(WKWebView, LXWebViewChainModel)
NS_ASSUME_NONNULL_END
