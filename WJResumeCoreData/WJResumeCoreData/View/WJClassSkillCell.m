//
//  WJClassSkillCell.m
//  WJResume
//
//  Created by William on 2017/7/12.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJClassSkillCell.h"
#import "ClassSkill+CoreDataClass.h"
#import "Personal+CoreDataClass.h"
#import "ProjectSkill+CoreDataClass.h"

@implementation WJClassSkillCell {
    UIImageView *_imageView;
    UILabel *_titleLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
        [self setComponent];
    }
    return self;
}

- (void)setUI {
    _imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:12];
    _titleLabel.numberOfLines = 0;
    [self.contentView addSubview:_titleLabel];
}

- (void)setComponent {
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(5);
        make.leading.equalTo(self.contentView).offset(15);
        make.width.height.equalTo(@10);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(5);
        make.leading.equalTo(_imageView.mas_trailing).offset(15);
        make.trailing.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-5);
    }];
}

- (void)setObjc:(id)objc {
    
    if ([objc class] == ClassSkill.class) {
        _imageView.hidden = NO;
        [UIImage wj_cornerRadiusImageWithSize:CGSizeMake(20, 20) fillColor:[UIColor blackColor] completion:^(UIImage *image) {
            _imageView.image = image;
        }];
        _titleLabel.text = ((ClassSkill *)objc).desc;
    }
    else if ([objc class] == Personal.class) {
        [UIImage wj_cornerRadiusImageWithSize:CGSizeMake(20, 20) fillColor:[UIColor blackColor] completion:^(UIImage *image) {
            _imageView.image = image;
        }];
        _imageView.hidden = NO;
        _titleLabel.text = ((Personal *)objc).desc;
    } else if ([objc class] == ProjectSkill.class) {
        _imageView.hidden = YES;
        _titleLabel.text = ((ProjectSkill *)objc).desc;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
