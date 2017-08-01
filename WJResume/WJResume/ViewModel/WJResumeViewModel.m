//
//  WJResumeViewModel.m
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJResumeViewModel.h"
#import "WJResume.h"

@implementation WJResumeViewModel 

#pragma mark - public

+ (void)resumeDataWithFileName:(NSString *)fileName success:(void (^)(NSArray *))successBlock {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    [self resumeDataWithFilePath:filePath success:^(NSArray *resumeData) {
        if (successBlock) {
            successBlock(resumeData);
        }
    }];
}

+ (void)resumeDataWithFilePath:(NSString *)filePath success:(void (^)(NSArray *))successBlock {
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *resumeData;
    if (data) {
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        WJResume *resume = [WJResume modelWithDictionary:rootDict];
        resumeData = [self resumeDataWithResume:resume];
    } else {
        NSLog(@"数据未正确读取");
    }
    
    if (successBlock) {
        successBlock(resumeData);
    }
}

+ (void)resumeDataWithURL:(NSString *)url success:(void (^)(NSArray *))successBlock {
    
}

#pragma mark - private

// 数据转换
+ (NSArray *)resumeDataWithResume:(WJResume *)resume {
    
        NSMutableArray *projects = [NSMutableArray array];
        for (WJProjectExperience *exp in resume.proExpers) {
            [projects addObject:exp];
            for (WJDescMsg *msg in exp.skills) {
                [projects addObject:msg];
            }
            exp.skills = nil;
        }
        
        return @[@[resume.personInfo],resume.workExpers, resume.edusInfo,
                 projects.copy, resume.classSkills, resume.personals];
}

@end
