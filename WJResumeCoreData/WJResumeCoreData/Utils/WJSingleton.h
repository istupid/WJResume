//
//  WJSingleton.h
//
//
//  Created by William on 2016/4/12.
//  Copyright © 2016年 William. All rights reserved.
//
#import <Foundation/Foundation.h>

/**
 *  定义单例模式类 INTERFACE_SINGLETON(类名)
 *  实现单例模式类 IMPLEMENTATION_SINGLETON(类名)
 */
#undef  INTERFACE_SINGLETON
#define INTERFACE_SINGLETON(__class__) \
        - (__class__ *)sharedInstance; \
        + (__class__ *)sharedInstance; 

#undef  IMPLEMENTATION_SINGLETON
#define IMPLEMENTATION_SINGLETON(__class__) \
        - (__class__ *)sharedInstance { \
            return [__class__ sharedInstance]; \
        } \
        + (__class__ *)sharedInstance { \
            static dispatch_once_t once; \
            static __class__ *__singleton__; \
            dispatch_once (&once, ^{ __singleton__ = [[[self class] alloc] init]; }); \
            return __singleton__; \
        }
