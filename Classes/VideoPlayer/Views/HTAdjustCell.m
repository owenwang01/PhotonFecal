//
//  HTAdjustCell.m
// 
//
//  Created by dn on 2023/1/28.
//  Copyright © 2023 admin. All rights reserved.
//

#import "HTAdjustCell.h"

@interface HTAdjustCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation HTAdjustCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self lgjeropj_setupSubviews];
    }
    return self;
}

- (void)lgjeropj_setupSubviews {
    self.backgroundColor = [UIColor clearColor];
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor ht_colorWithHexString:@"#5D5D70"];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(10);
        make.leading.mas_equalTo(self.contentView.mas_leading).offset(10);
        make.trailing.mas_equalTo(self.contentView.mas_trailing).inset(10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).inset(10);
    }];
}

- (void)setSubtitleText:(NSAttributedString *)subtitleText {
    self.titleLabel.attributedText = subtitleText;
}

- (void)setCellTextColor:(UIColor *)cellTextColor {
    self.titleLabel.textColor = cellTextColor;
}

@end
