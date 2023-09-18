







#import "MckWilcoVariableCell.h"

@interface MckWilcoVariableCell ()
@property (nonatomic, strong) UIImageView *lctExponentBlueImage;
@property (nonatomic, strong) UILabel *ccptPurchaseLong;
@end

@implementation MckWilcoVariableCell


- (instancetype)initWithStyle:(UITableViewCellStyle)bootRdrct reuseIdentifier:(NSString *)giveNnunc {
    if (self = [super initWithStyle:bootRdrct reuseIdentifier:giveNnunc]) {
        [self ecrClockLash];
    }
    
    return self;
}

- (void)ecrClockLash {
    
    self.backgroundColor = [UIColor clearColor];
    
    self.lctExponentBlueImage = [[UIImageView alloc] init];
    [self.contentView addSubview:self.lctExponentBlueImage];
    
    self.ccptPurchaseLong = [[UILabel alloc] init];
    self.ccptPurchaseLong.text = MUNICIPAL_INDISCRETION(174);
    self.ccptPurchaseLong.textColor = [UIColor whiteColor];
    self.ccptPurchaseLong.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.ccptPurchaseLong];
    
    [self.lctExponentBlueImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.contentView);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(26, 26));
    }];
    
    [self.ccptPurchaseLong mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.lctExponentBlueImage.mas_trailing).offset(10);
        make.centerY.mas_equalTo(self.contentView);
        make.trailing.mas_equalTo(self.contentView).inset(24);
    }];
}

- (void)setBtinFourscoreVice:(NSString *)mphszMean {
    if (mphszMean.length > 0) {
        self.ccptPurchaseLong.text = mphszMean;
    }
}

- (void)setLvCorrectPort:(id)vrwrtSlow {
    if (vrwrtSlow != nil) {
        if([vrwrtSlow isKindOfClass:[UIImage class]]) {
            self.lctExponentBlueImage.image = vrwrtSlow;
        } else if([vrwrtSlow isKindOfClass:[NSString class]]) {
            self.lctExponentBlueImage.image = [UIImage imageNamed:vrwrtSlow];
        } else if([vrwrtSlow isKindOfClass:[NSURL class]]) {
            [self.lctExponentBlueImage sd_setImageWithURL:vrwrtSlow];
        }
    }
}

@end