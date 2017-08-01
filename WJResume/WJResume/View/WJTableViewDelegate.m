//
//  WJTableViewDelegate.m
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJTableViewDelegate.h"
#import "WJHeadView.h"

@interface WJTableViewDelegate ()
@property (nonatomic, copy) NSArray *sectionTitle;
@end

@implementation WJTableViewDelegate

#pragma mark - table view delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section != 0) {
        WJHeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"WJHeadView"];
        if (!headView) {
            headView = [[WJHeadView alloc] initWithReuseIdentifier:@"WJHeadView"];
        }
        headView.titleStr = self.sectionTitle[section];
        return headView;
    }
    return nil;
}

- (NSArray *)sectionTitle {
    if (!_sectionTitle) {
        _sectionTitle = @[@"", @"工作经历", @"教育经历", @"项目经验", @"自我描述", @"个人经历"];
    }
    return _sectionTitle;
}

@end
