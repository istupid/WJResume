//
//  WJHeadView.m
//  WJResume
//
//  Created by William on 2017/7/12.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJHeadView.h"
#import "Masonry.h"
#import "UIColor+Extension.h"

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
    _bgView.backgroundColor = [UIColor wj_colorWithRed:147 green:206 blue:190];
    [self.contentView addSubview:_bgView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    [self.contentView addSubview:_titleLabel];
}

- (void)setComponent {
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.leading.equalTo(self.contentView).offset(10);
        make.width.equalTo(@15);
        make.height.equalTo(@25);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_bgView);
        make.leading.equalTo(_bgView.mas_trailing).offset(10);
        make.trailing.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}

- (void)setTitleStr:(NSString *)titleStr {
    _titleLabel.text = titleStr;
}


@end
