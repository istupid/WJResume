//
//  WJTableViewDelegate.m
//  WJResume
//
//  Created by William on 2017/7/18.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJResumeDelegate.h"
#import "WJHeadView.h"

@interface WJResumeDelegate ()
@property (nonatomic, copy) NSArray *sectionTitle;
@end

@implementation WJResumeDelegate

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section != 0) {
        WJHeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"WJHeadView"];
        if (!headView) {
            headView = [[WJHeadView alloc] initWithReuseIdentifier:@"WJHeadView"];
        }
        headView.title = self.sectionTitle[section];
        return headView;
    }
    return nil;
}

- (NSArray *)sectionTitle {
    if (!_sectionTitle) {
        _sectionTitle = @[@"", @"工作经历", @"教育经历", @"项目经验", @"专业技术", @"其他经验"];
    }
    return _sectionTitle;
}

@end
