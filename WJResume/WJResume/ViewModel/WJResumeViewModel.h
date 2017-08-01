//
//  WJResumeViewModel.h
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WJResumeViewModel : NSObject

/**
 * table view data
 */
@property (nonatomic, copy) NSArray *resumeData;

+ (void)resumeDataWithFileName:(NSString *)fileName success:(void(^)(NSArray *))successBlock;

+ (void)resumeDataWithFilePath:(NSString *)filePath success:(void(^)(NSArray *))successBlock;

+ (void)resumeDataWithURL:(NSString *)url success:(void(^)(NSArray *))successBlock;

@end
