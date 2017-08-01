//
//  UIImage+Extension.h
//  WJResume
//
//  Created by William on 2017/7/12.
//  Copyright © 2017年 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+ (UIImage *)wj_rectImageWithSize:(CGSize)size fileColor:(UIColor *)color;

+ (void)wj_cornerRadiusImageWithSize:(CGSize)size fillColor:(UIColor *)color completion:(void(^)(UIImage *))completion;

@end
