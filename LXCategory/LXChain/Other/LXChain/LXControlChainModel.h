//
//  LXControlChainModel.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "LXBaseViewChainModel.h"
#import "UIControl+LXCategory.h"
NS_ASSUME_NONNULL_BEGIN


#define LXCONTROLSUPERCHAINMODEL_INTEFACE(classType)\
LXCATEGORY_CHAIN_PROPERTY classType *(^ enabled)(BOOL enabled);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ selected)(BOOL selected);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ highlighted)(BOOL highlighted);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ contentVerticalAlignment)(UIControlContentVerticalAlignment contentVerticalAlignment);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ contentHorizontalAlignment)(UIControlContentHorizontalAlignment contentHorizontalAlignment);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ addTargetBlock)(void (^addTargetBlock)(id sender), UIControlEvents controlEvents);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ setTargetBlock)(void (^addTargetBlock)(id sender), UIControlEvents controlEvents);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ addTarget)(id target, SEL action, UIControlEvents controlEvents);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ setTarget)(id target, SEL action, UIControlEvents controlEvents);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ removeTarget) (id target,SEL action, UIControlEvents controlEvents);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ removeAllTarget)(void);\
LXCATEGORY_CHAIN_PROPERTY classType *(^ removeAllTargetBlock)(UIControlEvents controlEvents);\

#define LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(LXMethod,LXParaType,classType) LXCATEGORY_CHAIN_IMPLEMENTATION(LXMethod,LXParaType, classType *,UIControl)

#define LXCONTROLSUPERCHAINMODEL_IMPLEMENTATION(classType)\
LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(enabled, BOOL, classType)\
LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(selected, BOOL, classType)\
LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(highlighted, BOOL, classType)\
LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(contentVerticalAlignment, UIControlContentVerticalAlignment, classType)\
LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(contentHorizontalAlignment, UIControlContentHorizontalAlignment, classType)\
- (classType * _Nonnull (^)(id _Nonnull, SEL _Nonnull, UIControlEvents))addTarget{\
    return ^ (id target, SEL action, UIControlEvents events){\
        [(UIControl *)(self.view) addTarget:target action:action forControlEvents:events];\
        return self;\
    };\
}\
- (classType * _Nonnull (^)(id _Nonnull, SEL _Nonnull, UIControlEvents))setTarget{\
    return ^ (id target, SEL action, UIControlEvents events){\
        [(UIControl *)(self.view) setTarget:target eventAction:action forControlEvents:events];\
        return self;\
    };\
}\
- (classType * _Nonnull (^)(void (^ _Nonnull)(id _Nonnull), UIControlEvents))addTargetBlock{\
    return ^ (controlTargeAction block, UIControlEvents events){\
        [(UIControl *)(self.view) addEventBlock:block forEvents:events];\
        return self;\
    };\
}\
- (classType * _Nonnull (^)(void (^ _Nonnull)(id _Nonnull), UIControlEvents))setTargetBlock{\
    return ^ (controlTargeAction block, UIControlEvents events){\
        [(UIControl *)(self.view) setEventBlock:block forEvents:events];\
        return self;\
    };\
}\
\
- (classType * _Nonnull (^)(id _Nonnull, SEL _Nonnull, UIControlEvents))removeTarget{\
    return ^ (id target, SEL action, UIControlEvents events){\
        [(UIControl *)(self.view) removeTarget:target action:action forControlEvents:events];\
        return self;\
    };\
}\
- (classType * _Nonnull (^)(void))removeAllTarget{\
    return ^ (){\
        [(UIControl *)(self.view) removeAllEvents];\
        return self;\
    };\
}\
- (classType * _Nonnull (^)(UIControlEvents))removeAllTargetBlock{\
    return ^ (UIControlEvents events){\
        [(UIControl *)(self.view) removeAllEventBlocksForEvents:events];\
        return self;\
    };\
}\

@class LXControlChainModel;
@interface LXControlChainModel : LXBaseViewChainModel<LXControlChainModel *>

LXCONTROLSUPERCHAINMODEL_INTEFACE(LXControlChainModel)

@end
LXCATEGORY_EXINTERFACE(UIControl, LXControlChainModel)
NS_ASSUME_NONNULL_END
