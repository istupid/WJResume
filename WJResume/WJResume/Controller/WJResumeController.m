//
//  WJResumeController.m
//  WJResume
//
//  Created by William on 2017/7/11.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJResumeController.h"
#import "WJTableViewDataSource.h"
#import "WJTableViewDelegate.h"
#import "WJResumeViewModel.h"
#import "WJPersonInfoCell.h"
#import "WJExperienceCell.h"
#import "WJDescMsgCell.h"
#import "WJHeadView.h"

@interface WJResumeController ()

@property (nonatomic, strong) WJResumeViewModel *viewModel;

@property (nonatomic, strong) NSArray *resumeData;

@end

@implementation WJResumeController {
    UITableView *_tableView;
    WJTableViewDataSource *_dataSource;
    WJTableViewDelegate *_delegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    [self resumeData];
}

#pragma mark - UI 处理

- (void)setUI {
    
    _dataSource = [[WJTableViewDataSource alloc] init];
    _delegate = [[WJTableViewDelegate alloc] init];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[WJPersonInfoCell class] forCellReuseIdentifier:@"WJPersonInfoCell"];
    [_tableView registerClass:[WJExperienceCell class] forCellReuseIdentifier:@"WJExperienceCell"];
    [_tableView registerClass:[WJDescMsgCell class] forCellReuseIdentifier:@"WJDescMsgCell"];

    [_tableView registerClass:[WJHeadView class] forHeaderFooterViewReuseIdentifier:@"WJHeadView"];
    
    _tableView.dataSource = _dataSource;
    _tableView.delegate = _delegate;
    
    _tableView.estimatedRowHeight = 60;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    _tableView.estimatedSectionHeaderHeight = 50;
    _tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.allowsSelection = NO;
    
}

#pragma mark - 加载数据

- (NSArray *)resumeData {
    if (!_resumeData) {
        [WJResumeViewModel resumeDataWithFileName:@"projects-demo.json" success:^(NSArray *resumeData) {
            _resumeData = resumeData;
            _dataSource.resumeData = resumeData;
            [_tableView reloadData];
        }];
    }
    return _resumeData;
}

@end
