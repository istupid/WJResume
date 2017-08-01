//
//  WJProjectExperience.m
//  WJResume
//
//  Created by William on 2017/7/17.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJProjectExperience.h"

@implementation WJProjectExperience

- (void)setSkills:(NSArray<WJDescMsg *> *)skills {
    if ([skills isKindOfClass:NSArray.class]) {
        NSMutableArray<WJDescMsg *> *expers = [NSMutableArray arrayWithArray:skills];
        [expers enumerateObjectsUsingBlock:^(WJDescMsg * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSDictionary.class]) {
                expers[idx] = [WJDescMsg modelWithDictionary:(NSDictionary *)obj];
            }
        }];
        skills = expers.copy;
    }
    _skills = skills;
}

@end
