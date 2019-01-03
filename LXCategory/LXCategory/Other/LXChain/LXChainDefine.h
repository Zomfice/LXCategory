//
//  LXChainDefine.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#ifndef LXChainDefine_h
#define LXChainDefine_h
#import <UIKit/UIKit.h>
#define LXCreate(ViewClass)\
static inline ViewClass *ViewClass##Create(void){\
return [ViewClass new];\
}

#define LXCATEGORY_CHAIN_PROPERTY @property (nonatomic, copy, readonly)

#define LXCATEGORY_CHAIN_IMPLEMENTATION(LXMethod,LXParaType, LXProperty, LXModelType, LXPropertyClass)\
- (LXModelType  _Nonnull (^)(LXParaType))LXMethod{\
return ^ (LXParaType LXMethod){\
    ((LXPropertyClass *)self.LXProperty).LXMethod = LXMethod;\
    return self;\
};\
}

#define LXCATEGORY_EXINTERFACE(LXClass, modelType)\
@interface LXClass(EXT)\
LXCATEGORY_CHAIN_PROPERTY modelType * makeChain;\
@end


#endif /* LXChainDefine_h */
