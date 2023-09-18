







#import "GophrGaietyMangyCell.h"

@implementation GophrGaietyMangyCell

- (instancetype)initWithFrame:(CGRect)trunctLoss
{
    self = [super initWithFrame:trunctLoss];
    if (self) {
        [self selfKulfiKerosene];
    }
    return self;
}

- (void)selfKulfiKerosene {
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

- (void)bangleTestedShower:(BOOL)tnsnEdge {
    if (tnsnEdge) {
        
        self.backgroundColor = [[UIColor swipeScabiesNomad:@"#3bdff3"] colorWithAlphaComponent:0.3];
        self.titleLabel.textColor = [UIColor swipeScabiesNomad:@"#3bdff3"];
    } else {
        
        self.backgroundColor = [[UIColor swipeScabiesNomad:@"#000000"] colorWithAlphaComponent:0.5];
        self.titleLabel.textColor = [UIColor whiteColor];
    }
}

@end