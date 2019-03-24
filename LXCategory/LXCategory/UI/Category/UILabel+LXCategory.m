//
//  UILabel+LXCategory.m
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/28.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "UILabel+LXCategory.h"
#import "NSString+LXCategory.h"
#import "NSAttributedString+LXCategory.h"
@implementation UILabel (LXCategory)

- (CGSize)sizeWithoutLimitSize{
    return [self sizeWithLimitSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
}

- (CGSize)sizeWithLimitSize:(CGSize)size{
    if (self.attributedText) {
        return [self.attributedText sizeWithLimitSize:size];
    }else{
        return [self.text sizeWithAttributes:@{NSFontAttributeName:self.font} limitSize:size];
    }
}
@end
