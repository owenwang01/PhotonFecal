//
//  HTDropDownListCell.m
// 
//
//  Created by dn on 2023/1/29.
//  Copyright © 2023 admin. All rights reserved.
//

#import "HTDropDownListCell.h"

@implementation HTDropDownListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self ht_addCellSubviews];
    }
    return self;
}

- (void)ht_addCellSubviews{
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 5, 0, 0));
    }];
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.text = @"";
        _contentLabel.textColor = [UIColor whiteColor];
    }
    return _contentLabel;
}

@end
