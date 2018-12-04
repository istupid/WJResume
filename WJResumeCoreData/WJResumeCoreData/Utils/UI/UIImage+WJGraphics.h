//
//  UIImage+WJGraphics.h
//  WJResumeCoreData
//
//  Created by William on 2017/7/17.
//  Copyright © 2017年 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (WJGraphics)

+ (UIImage *)wj_rectImageWithSize:(CGSize)size
                        fileColor:(UIColor *)color;

+ (void)wj_cornerRadiusImageWithSize:(CGSize)size
                           fillColor:(UIColor *)color
                          completion:(void(^)(UIImage *))completion;

@end
