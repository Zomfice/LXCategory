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
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ UIDelegate) (id <WKUIDelegate> UIDelegate);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ navigationDelegate) (id <WKNavigationDelegate> navigationDelegate);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ loadRequest) (NSURLRequest * loadRequest);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ loadFileURL) (NSURL *url, NSURL * readAccessUrl);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ loadHTMLString) (NSString *string, NSURL *baseUrl);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ loadData) (NSData *data, NSString *MIMEType, NSString *characterEncodingName,NSURL *baseUrl);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ goToBackForwardListItem) (WKBackForwardListItem * item);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ goBack) (void);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ goForward) (void);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ reload) (void);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ reloadFromOrigin) (void);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ stopLoading) (void);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ evaluateJavaScript) (NSString * javaScriptString, void (^ _Nullable completionHandler)(_Nullable id, NSError * _Nullable error) );
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ allowsBackForwardNavigationGestures) (BOOL allowsBackForwardNavigationGestures);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ customUserAgent) (NSString * customUserAgent);
LXCATEGORY_CHAIN_PROPERTY LXWebViewChainModel * (^ allowsLinkPreview) (BOOL allowsLinkPreview);
@end

LXCreate(WKWebView)

static inline WKWebView *WKWebViewCreateConfigure(CGRect frame,WKWebViewConfiguration *configu){
    return [[WKWebView alloc] initWithFrame:frame configuration:configu];
}
LXCATEGORY_EXINTERFACE(WKWebView, LXWebViewChainModel)
NS_ASSUME_NONNULL_END
