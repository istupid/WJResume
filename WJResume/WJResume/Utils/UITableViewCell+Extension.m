//
//  UITableViewCell+Extension.m
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import "UITableViewCell+Extension.h"
#import <objc/runtime.h>

@implementation UITableViewCell (Extension)

- (void)setObjc:(id)objc {
    objc_setAssociatedObject(self, @selector(objc), objc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)objc {
    return objc_getAssociatedObject(self, _cmd);
}
@end
