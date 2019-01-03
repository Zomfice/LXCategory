//
//  NSString+LXCategory.m
//  LXCategory
//
//  Created by 麻小亮 on 2019/1/3.
//  Copyright © 2019 xllpp. All rights reserved.
//

#import "NSString+LXCategory.h"

@implementation NSString (LXCategory)
- (CGSize)sizeWithAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs size:(CGSize)size{
    CGRect strRect = [self boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attrs context:nil];
    return strRect.size;
}
@end
