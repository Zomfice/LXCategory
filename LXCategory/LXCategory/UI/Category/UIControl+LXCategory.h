//
//  UIControl+LXCategory.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^controlTargeAction)(id sender);

@interface UIControl (LXCategory)

/**
 移除所有点击事件
 */
- (void)removeAllEvents;

/**
 添加一个点击事件
 */
- (void)addEventBlock:(controlTargeAction)block forEvents:(UIControlEvents)events;

/**
 移除所有事件，并添加一个新的事件
 */
- (void)setTarget:(id)target eventAction:(SEL)action forControlEvents:(UIControlEvents)events;

/**
 添加点击block
 @param key 键值
 */
- (void)addEventBlock:(controlTargeAction)block forEvents:(UIControlEvents)events ForKey:(NSString *)key;

/**
 移除点击block

 @param key 键值
 */
- (void)removeEventBlockForKey:(NSString *)key event:(UIControlEvents)events;

/**
 移除所有block，并添加一个新的block
 */
- (void)setEventBlock:(controlTargeAction)block forEvents:(UIControlEvents)events;

/**
 移除所有block事件
 */
- (void)removeAllEventBlocksForEvents:(UIControlEvents)controlEvents;

@end

NS_ASSUME_NONNULL_END
