







#import "GophrFixKnapsackCell.h"

@interface GophrFixKnapsackCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation GophrFixKnapsackCell

- (instancetype)initWithStyle:(UITableViewCellStyle)bootRdrct reuseIdentifier:(NSString *)giveNnunc {
    if (self = [super initWithStyle:bootRdrct reuseIdentifier:giveNnunc]) {
        [self selfKulfiKerosene];
    }
    return self;
}

- (void)selfKulfiKerosene {
    self.backgroundColor = [UIColor clearColor];
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor swipeScabiesNomad:@"#5c5c6f"];
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

- (void)setLgicDelimitCome:(NSAttributedString *)vrllCall {
    self.titleLabel.attributedText = vrllCall;
}

- (void)setCstmLinkageKnow:(UIColor *)spcfcCord {
    self.titleLabel.textColor = spcfcCord;
}

@end