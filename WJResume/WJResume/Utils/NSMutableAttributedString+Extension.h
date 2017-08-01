//
//  NSMutableAttributedString+Extension.h
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSAttributedString+Extension.m"

@interface NSMutableAttributedString (Extension)

+ (instancetype)wj_appendArray:(NSArray<NSString *> *)array
                         split:(UIImage *)image;

+ (instancetype)wj_appendArray:(NSArray<NSString *> *)array
                         split:(UIImage *)image
                      fontSize:(CGFloat)fontSize;

+ (instancetype)wj_appendArray:(NSArray<NSString *> *)array
                         split:(UIImage *)image
                      fontSize:(CGFloat)fontSize
                     textColor:(UIColor *)textColor;

@end
