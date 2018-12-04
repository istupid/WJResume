//
//  UIImage+WJGraphics.m
//  WJResumeCoreData
//
//  Created by William on 2017/7/17.
//  Copyright © 2017年 William. All rights reserved.
//

#import "UIImage+WJGraphics.h"

@implementation UIImage (WJGraphics)

+ (UIImage *)wj_rectImageWithSize:(CGSize)size fileColor:(UIColor *)color {
    
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    // 填充背景颜色
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    
    CGContextAddRect(context, CGRectMake((size.width - 1)/2.0, 0, 1, size.height));
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillPath(context);
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (void)wj_cornerRadiusImageWithSize:(CGSize)size fillColor:(UIColor *)color completion:(void (^)(UIImage *))completion {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        
        // 背景色
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        CGContextFillRect(context, rect);
        
        CGContextAddEllipseInRect(context, rect);
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(image);
            }
        });
        
    });
}

@end
