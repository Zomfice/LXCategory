//
//  LXBaseControlChainModel.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/15.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "LXBaseControlChainModel.h"
#define LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(LXMethod,LXParaType) LXCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(LXMethod,LXParaType, id ,UIControl)

@implementation LXBaseControlChainModel
LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(enabled, BOOL)
LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(selected, BOOL)
LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(highlighted, BOOL)
LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(contentVerticalAlignment, UIControlContentVerticalAlignment)
LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION(contentHorizontalAlignment, UIControlContentHorizontalAlignment)

- (id  _Nonnull (^)(id _Nonnull, SEL _Nonnull, UIControlEvents))addTarget{
    return ^ (id target, SEL action, UIControlEvents events){
        [(UIControl *)(self.view) addTarget:target action:action forControlEvents:events];
        return self;
    };
}
- ( id  _Nonnull (^)(id _Nonnull, SEL _Nonnull, UIControlEvents))setTarget{
    return ^ (id target, SEL action, UIControlEvents events){
        [(UIControl *)(self.view) setTarget:target eventAction:action forControlEvents:events];
        return self;
    };
}
- ( id  _Nonnull (^)(void (^ _Nonnull)(id _Nonnull), UIControlEvents))addTargetBlock{
    return ^ (controlTargeAction block, UIControlEvents events){
        [(UIControl *)(self.view) addEventBlock:block forEvents:events];
        return self;
    };
}
- ( id  _Nonnull (^)(void (^ _Nonnull)(id _Nonnull), UIControlEvents))setTargetBlock{
    return ^ (controlTargeAction block, UIControlEvents events){
        [(UIControl *)(self.view) setEventBlock:block forEvents:events];
        return self;
    };
}

- ( id  _Nonnull (^)(id _Nonnull, SEL _Nonnull, UIControlEvents))removeTarget{
    return ^ (id target, SEL action, UIControlEvents events){
        [(UIControl *)(self.view) removeTarget:target action:action forControlEvents:events];
        return self;
    };
}
- ( id  _Nonnull (^)(void))removeAllTarget{
    return ^ (){
        [(UIControl *)(self.view) removeAllEvents];
        return self;
    };
}
- ( id  _Nonnull (^)(UIControlEvents))removeAllTargetBlock{
    return ^ (UIControlEvents events){
        [(UIControl *)(self.view) removeAllEventBlocksForEvents:events];
        return self;
    };
}
@end
#undef LXCATEGORY_CHAIN_CONTROL_IMPLEMENTATION
