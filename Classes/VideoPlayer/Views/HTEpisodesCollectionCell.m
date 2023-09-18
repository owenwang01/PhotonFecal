//
//  HTEpisodesCollectionCell.m
// 
//
//  Created by dn on 2023/1/28.
//  Copyright © 2023 admin. All rights reserved.
//

#import "HTEpisodesCollectionCell.h"

@implementation HTEpisodesCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self lgjeropj_setupSubviews];
    }
    return self;
}

- (void)lgjeropj_setupSubviews {
    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)ht_changeCellBgClolor:(BOOL)isSelected {
    if (isSelected) {
        // selected
        self.backgroundColor = [[UIColor ht_colorWithHexString:@"#3CDEF4"] colorWithAlphaComponent:0.3];
        self.titleLabel.textColor = [UIColor ht_colorWithHexString:@"#3CDEF4"];
    } else {
        // unselected
        self.backgroundColor = [[UIColor ht_colorWithHexString:@"#000000"] colorWithAlphaComponent:0.5];
        self.titleLabel.textColor = [UIColor whiteColor];
    }
}

@end
