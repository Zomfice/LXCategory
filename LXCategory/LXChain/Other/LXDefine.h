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
