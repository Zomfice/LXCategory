//
//  LXDefine.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/11/20.
//  Copyright © 2018 xllpp. All rights reserved.
//

#ifndef LXDefine_h
#define LXDefine_h
#import <UIKit/UIKit.h>
#import "NSObject+LX.h"

#ifndef LXWeak
#define LXWeak  __weak __typeof(self) weakSelf = self;
#endif


#ifndef LXStrong
#define LXStrong  __strong __typeof(weakSelf) self = weakSelf;
#endif

#define UTILS_WIDTH [UIScreen mainScreen].bounds.size.width

#define UTILS_HEIGHT [UIScreen mainScreen].bounds.size.height

#define UTILS_SCALE (NSInteger) ([UIScreen mainScreen].bounds.size.width / 375 * 100) /100.0

#define Is_IPHONE_XR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

#define Is_IPHONE_XS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define Is_IPHONE_XSMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define IsIPhoneX (Is_IPHONE_XR || Is_IPHONE_XS || Is_IPHONE_XSMax)

#define StatusBarHeight (IsIPhoneX ? (20.f + 24.f) : 20.f)

#define NavigationBarHeight 44.f

typedef NS_ENUM (NSInteger, LXBlankStatus){
    LXBlankStatusFalse,
    LXBlankStatusZero,
    LXBlankStatusNil
};

static inline LXBlankStatus LXDataBlankStatus (id data) {
    if (data == [NSNull null]) return LXBlankStatusNil;
    if (!data) return LXBlankStatusNil;
    BOOL isBlank = NO;
    if ([data isKindOfClass:[NSNumber class]]) {isBlank = [(NSNumber *)data integerValue] == 0;}
    else if ([data isKindOfClass:[NSString class]]) {isBlank = [(NSString *)data length] == 0;}
    else if ([data isKindOfClass:[NSArray class]]) {isBlank = [(NSArray *)data count] == 0;}
    else if ([data isKindOfClass:[NSDictionary class]]) {isBlank = [(NSDictionary *)data count] == 0;}
    else if ([data isKindOfClass:[NSSet class]]) {isBlank = [(NSSet *)data count] == 0;}
    else if ([data isKindOfClass:[NSIndexSet class]]) {isBlank = [(NSIndexSet *)data count] == 0;}
    else if ([data isKindOfClass:[NSData class]]) {isBlank = [(NSData *)data length] == 0;}
    return isBlank ? LXBlankStatusZero : LXBlankStatusFalse;
}

static inline BOOL LXIsNotBlank(id data){
    return LXDataBlankStatus(data) == LXBlankStatusFalse;
}

static inline BOOL LXIsNilBlank(id data){
    return LXDataBlankStatus(data) == LXBlankStatusNil;
}

static inline BOOL LXIsZeroBlank(id data){
    return LXDataBlankStatus(data) == LXBlankStatusZero;
}




#endif /* LXDefine_h */
