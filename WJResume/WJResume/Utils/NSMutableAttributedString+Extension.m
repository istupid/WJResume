//
//  NSMutableAttributedString+Extension.m
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import "NSMutableAttributedString+Extension.h"

@implementation NSMutableAttributedString (Extension)

+ (instancetype)wj_appendArray:(NSArray<NSString *> *)array split:(UIImage *)image {
    
    return [self wj_appendArray:array split:image fontSize:14.f];
}

+ (instancetype)wj_appendArray:(NSArray<NSString *> *)array
                         split:(UIImage *)image
                      fontSize:(CGFloat)fontSize {
    UIColor *textColor = [UIColor darkGrayColor];
    return [self wj_appendArray:array split:image fontSize:fontSize textColor:textColor];
}

+ (instancetype)wj_appendArray:(NSArray<NSString *> *)array
                         split:(UIImage *)image
                      fontSize:(CGFloat)fontSize
                     textColor:(UIColor *)textColor {
    
    NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc] init];
    
    if (array.count) {
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = image;
        attach.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
        NSAttributedString *icon = [NSAttributedString attributedStringWithAttachment:attach];
        [array enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSAttributedString *attr = [NSAttributedString wj_attrWithText:obj fontSize:fontSize textColor:textColor];
            [mAttr appendAttributedString:attr];
            if (array.count - 1 != idx) {
                [mAttr appendAttributedString:icon];
            }
        }];
    }
    
    return mAttr;
}

@end
