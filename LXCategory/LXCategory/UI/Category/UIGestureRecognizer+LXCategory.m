//
//  UIGestureRecognizer+LXCategory.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/28.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "UIGestureRecognizer+LXCategory.h"
#import <objc/runtime.h>
static const int block_key;

@interface LXGetureTarget : NSObject
@property (nonatomic, copy) GestureTargetAction action;
@end

@implementation LXGetureTarget

- (instancetype)initWithBlock:(GestureTargetAction)action{
    if (self = [super init]) {
        _action = action;
    }
    return self;
}

- (void)sendGesture:(UIGestureRecognizer *)ges{
    if (_action) {
        _action(ges);
    }
}

@end

@implementation UIGestureRecognizer (LXCategory)

- (instancetype)initWithActionBlock:(void (^)(id sender))block {
    self = [self init];
    [self addTargetBlock:block];
    return self;
}

- (void)addTargetBlock:(GestureTargetAction)block{
    LXGetureTarget *target = [[LXGetureTarget alloc]initWithBlock:block];
    [self addTarget:target action:@selector(sendGesture:)];
    [[self lx_getstureTagetsArr] addObject:target];
}
- (void)addTargetBlock:(GestureTargetAction)block tag:(NSString *)tag{
    if (!block) return;
    if (!tag) {
        [self addTargetBlock:block];
    }else{
      [self removeTargetBlockByTag:tag];
      LXGetureTarget *target = [[LXGetureTarget alloc]initWithBlock:block];
      [self addTarget:target action:@selector(sendGesture:)];
      [[self lx_getstureTagetsDic] setObject:target forKey:tag];
    }
}
- (void)removeTargetBlockByTag:(NSString *)tag{
    if (!tag) return;
    NSMutableDictionary *targets = [self lx_getstureTagetsDic];
    LXGetureTarget *target = [targets objectForKey:tag];
    if (!target) return;
    [self removeTarget:target action:@selector(sendGesture:)];
    [targets removeObjectForKey:tag];
}
- (void)removeAllTargetBlock{
    [[self lx_getstureTagetsDic] enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [self removeTarget:obj action:@selector(sendGesture:)];
    }];
    [[self lx_getstureTagetsArr] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self removeTarget:obj action:@selector(sendGesture:)];
    }];
}

- (NSMutableArray *)lx_getstureTagetsArr{
    NSMutableArray *targets = objc_getAssociatedObject(self, &block_key);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}

- (NSMutableDictionary *)lx_getstureTagetsDic{
    NSMutableDictionary *targets = objc_getAssociatedObject(self, &block_key);
    if (!targets) {
        targets = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}
@end
