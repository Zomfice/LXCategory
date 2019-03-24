//
//  LXWebViewChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/28.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXWebViewChainModel.h"
#import "NSObject+LXCategory.h"
#define LXCATEGORY_CHAIN_WEBVIEW_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, LXWebViewChainModel *,WKWebView)
@implementation LXWebViewChainModel

- (WKWebView *)currentView{
    return (WKWebView *)self.view;
}

LXCATEGORY_CHAIN_WEBVIEW_IMPLEMENTATION(navigationDelegate, id <WKNavigationDelegate>)
LXCATEGORY_CHAIN_WEBVIEW_IMPLEMENTATION(UIDelegate,id <WKUIDelegate>)


- (LXWebViewChainModel * _Nonnull (^)(NSURLRequest * _Nonnull))loadRequest{
    return ^ (NSURLRequest *request){
        [(WKWebView *)self.view loadRequest:request];
        return self;
    };
}

- (LXWebViewChainModel * _Nonnull (^)(NSURL * _Nonnull, NSURL * _Nonnull))loadFileURL{
    return ^ (NSURL *url1, NSURL *url2){
        [self.currentView loadFileURL:url1 allowingReadAccessToURL:url2];
        return self;
    };
}

- (LXWebViewChainModel * _Nonnull (^)(NSString * _Nonnull, NSURL * _Nonnull))loadHTMLString{
    return ^ (NSString *string, NSURL *url2){
        [self.currentView loadHTMLString:string baseURL:url2];
        return self;
    };
}

- (LXWebViewChainModel * _Nonnull (^)(NSData * _Nonnull, NSString * _Nonnull, NSString * _Nonnull, NSURL * _Nonnull))loadData{
    return ^ (NSData *data, NSString *MIMEType, NSString *characterEncodingName, NSURL *baseUrl){
        [[self currentView] performSelectorWithArguments:@selector(loadData:MIMEType:textEncodingName:baseURL:), data, MIMEType, characterEncodingName,baseUrl];
        return self;
    };
}

- (LXWebViewChainModel * _Nonnull (^)(WKBackForwardListItem * _Nonnull))goToBackForwardListItem{
    return ^ (WKBackForwardListItem *item){
        [[self currentView] performSelectorWithArguments:@selector(goToBackForwardListItem:),item];
        return self;
    };
}


- (LXWebViewChainModel * _Nonnull (^)(void))goBack{
    return ^ (){
        [[self currentView] goBack];
        return self;
    };
}

- (LXWebViewChainModel * _Nonnull (^)(void))goForward{
    return ^ (){
        [[self currentView] goForward];
        return self;
    };
}

- (LXWebViewChainModel * _Nonnull (^)(void))reload{
    return ^ (){
        [[self currentView] reload];
        return self;
    };
}

- (LXWebViewChainModel * _Nonnull (^)(void))reloadFromOrigin{
    return ^ (){
        [[self currentView] reloadFromOrigin];
        return self;
    };
}

- (LXWebViewChainModel * _Nonnull (^)(void))stopLoading{
    return ^ (){
        [[self currentView] stopLoading];
        return self;
    };
}


- (LXWebViewChainModel * _Nonnull (^)(NSString * _Nonnull, void (^ _Nullable)(id _Nullable, NSError * _Nullable)))evaluateJavaScript{
    return ^ (NSString *javascripString,void (^ _Nullable block)(id _Nullable, NSError * _Nullable) ){
        [[self currentView] evaluateJavaScript:javascripString completionHandler:block];
        return self;
    };
}

LXCATEGORY_CHAIN_WEBVIEW_IMPLEMENTATION(allowsBackForwardNavigationGestures, BOOL)
LXCATEGORY_CHAIN_WEBVIEW_IMPLEMENTATION(customUserAgent, NSString *)
LXCATEGORY_CHAIN_WEBVIEW_IMPLEMENTATION(allowsLinkPreview, BOOL)

@end
LXCATEGORY_VIEW_IMPLEMENTATION(WKWebView, LXWebViewChainModel)
#undef LXCATEGORY_CHAIN_WEBVIEW_IMPLEMENTATION
