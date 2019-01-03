//
//  NSString+LXCategory.h
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/3.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LXCategory)

- (CGSize)sizeWithAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs limitSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
