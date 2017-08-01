//
//  WJDescMsgCell.m
//  WJResume
//
//  Created by William on 2017/7/12.
//  Copyright © 2017年 William. All rights reserved.
//

#import "WJDescMsgCell.h"
#import "WJDescMsg.h"
#define kScreenW (UIScreen.mainScreen.bounds.size.width)
#define kImageW 10
#define kPaddingW 15
#define kPaddingH 10

@implementation WJDescMsgCell {
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
    
    _titleLabel = [UILabel wj_labelWithFontSize:12 lines:0 textColor:[UIColor blackColor]];
    [self.contentView addSubview:_titleLabel];
}

- (void)setComponent {
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(0);
        make.leading.equalTo(self.contentView).offset(15);
        make.width.height.equalTo(@10);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(0);
        make.leading.equalTo(_imageView.mas_trailing).offset(15);
        make.trailing.equalTo(self.contentView).offset(-15);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}

- (void)setObjc:(id)objc {
    NSString *desc = ((WJDescMsg *)objc).desc;
    CGFloat width = kScreenW - 3*kPaddingW - kImageW;
    if ([desc hasPrefix:@"&"]) {    //
        desc = [desc substringFromIndex:1];
        CGFloat lineSpacing = 10.f;
        if ([desc wj_isSingleRowWithWidth:width - 12.f * 2 fontSize:12.f]) {
            lineSpacing = 0.f;
        }
        _titleLabel.attributedText = [NSAttributedString wj_attrWithText:desc fontSize:12.f lineSpacing:lineSpacing headIndent:12.f * 2];
    }
    else if ([desc wj_isSingleRowWithWidth:width fontSize:12.f]) {
        _titleLabel.text = desc;
    } else {
        _titleLabel.attributedText = [NSAttributedString wj_attrWithText:desc fontSize:12.f textColor:[UIColor blackColor] lineSpacing:10.f];
    }

//    if ([objc class] == ClassSkill.class) {
//        _imageView.hidden = NO;
//        [UIImage wj_cornerRadiusImageWithSize:CGSizeMake(10, 10) fillColor:[UIColor blackColor] completion:^(UIImage *image) {
//            _imageView.image = image;
//        }];
//        _titleLabel.attributedText = [self attrString:((ClassSkill *)objc).desc];
//    }
//    else if ([objc class] == Personal.class) {
//        [UIImage wj_cornerRadiusImageWithSize:CGSizeMake(10, 10) fillColor:[UIColor blackColor] completion:^(UIImage *image) {
//            _imageView.image = image;
//        }];
//        _imageView.hidden = NO;
//        _titleLabel.attributedText = [self attrString:((Personal *)objc).desc];
//    } else if ([objc class] == ProjectSkill.class) {
//        _imageView.hidden = YES;
//        _titleLabel.attributedText = [self attrString:((ProjectSkill *)objc).desc];
//    }
    
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
