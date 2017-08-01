//
//  NSObject+WJModel.m
//  WJResume
//
//  Created by William on 2017/7/17.
//  Copyright © 2017年 William. All rights reserved.
//

#import "NSObject+WJModel.h"
#import <objc/runtime.h>

@implementation NSObject (WJModel)

/**
 *  根据字典给对象成员属性赋值
 *
 *  @param dict 字典
 *
 *  @return 对象
 */
+ (instancetype)modelWithDictionary:(NSDictionary *)dict {
    id instance = [[self alloc] init];
    
    NSArray *keys = dict.allKeys;
    
    // 获取所有的属性
    NSArray *propertys = [self getAllPropertyName];
    
    // 给属性赋值
    [propertys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([keys containsObject:obj]) {
            [instance setValue:dict[obj] forKey:obj];
        }
        
    }];
    
    return instance;
}

/**
 *  获取类中所有属性名称
 *
 *  @return 属性名称的数组
 */
+ (NSArray *)getAllPropertyName {
    
    NSMutableArray *nmArr = [NSMutableArray array];
    
    unsigned int outCount;
    
    objc_property_t *propertys = class_copyPropertyList([self class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        
        objc_property_t property = propertys[i];
        
        // 取名字
        const char *name = property_getName(property);
        
        // 转为NSString对象
        NSString *pname = [[NSString alloc] initWithUTF8String:name];
        
        [nmArr addObject:pname];
    }
    
    return nmArr.copy;
}

@end
