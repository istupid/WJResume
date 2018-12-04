//
//  WJHeadView.m
//  WJResume
//
//  Created by William on 2017/7/12.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJHeadView.h"

@implementation WJHeadView {
    UIView *_bgView;
    UILabel *_titleLabel;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setUI];
        [self setComponent];
    }
    return self;
}

- (void)setUI {
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor colorWithRed:147/256.0 green:206/256.0 blue:190/256.0 alpha:1.0];
    [self.contentView addSubview:_bgView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    [self.contentView addSubview:_titleLabel];
}

- (void)setComponent {
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.leading.equalTo(self.contentView).offset(10);
        make.width.equalTo(@20);
        make.height.equalTo(@25);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_bgView);
        make.leading.equalTo(_bgView.mas_trailing).offset(10);
        make.trailing.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}

@end
