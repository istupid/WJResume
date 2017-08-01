//
//  WJTableViewDataSource.h
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJTableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, copy) NSArray *resumeData;

@end
