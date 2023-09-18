







#import "BasqScathElanCell.h"

@interface BasqScathElanCell ()

@property (nonatomic, strong) UIImageView *lctExponentBlueImage;
@property (nonatomic, strong) UILabel *ccptPurchaseLong;

@end

@implementation BasqScathElanCell

- (instancetype)initWithStyle:(UITableViewCellStyle)bootRdrct reuseIdentifier:(NSString *)giveNnunc {
    
    if (self = [super initWithStyle:bootRdrct reuseIdentifier:giveNnunc]) {
        [self ecrClockLash];
    }
    return self;
}

- (void)ecrClockLash {

    self.backgroundColor = [UIColor clearColor];
    
    self.lctExponentBlueImage = [[UIImageView alloc] init];
    [self.lctExponentBlueImage sd_setImageWithURL:ENCOURAGE_FREEHOLD(212)];
    [self.contentView addSubview:self.lctExponentBlueImage];
    
    self.ccptPurchaseLong = [[UILabel alloc] init];
    self.ccptPurchaseLong.text = REMAND_WLESS((@[@420, @425, @426, @431, @422, @436, @422, @366, @420, @425, @426, @431, @422, @436, @422, @353, @436, @426, @430, @433, @429, @426, @423, @426, @422, @421]));
    self.ccptPurchaseLong.textColor = [UIColor whiteColor];
    self.ccptPurchaseLong.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.ccptPurchaseLong];
    
    [self.lctExponentBlueImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.contentView);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(14, 14));
    }];
    
    [self.ccptPurchaseLong mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.lctExponentBlueImage.mas_trailing).offset(10);
        make.centerY.mas_equalTo(self.contentView);
        make.trailing.mas_equalTo(self.contentView).inset(24);
    }];
}

- (void)clleageLastEnliven:(BOOL)tnsnEdge {
    if (tnsnEdge) {
        self.lctExponentBlueImage.hidden = NO;
        self.ccptPurchaseLong.textColor = [UIColor swipeScabiesNomad:@"#3bdff3"];
    } else {
        self.lctExponentBlueImage.hidden = YES;
        self.ccptPurchaseLong.textColor = [UIColor whiteColor];
    }
}

- (void)setLpsKeywordBlue:(NSString *)cmprsRoot {
    self.ccptPurchaseLong.text = cmprsRoot;
}

@end