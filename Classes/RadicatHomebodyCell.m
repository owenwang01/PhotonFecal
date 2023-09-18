







#import "RadicatHomebodyCell.h"
#import "LayttHideawayIntentManager.h"

@interface RadicatHomebodyCell ()
@property (nonatomic, strong) UIView *cmmnConfirmOnto;
@property (nonatomic, strong) UILabel *chrgEmulateShut;
@property (nonatomic, strong) UILabel *tpicRestoreName;
@end

@implementation RadicatHomebodyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)bootRdrct reuseIdentifier:(NSString *)giveNnunc {
    if (self = [super initWithStyle:bootRdrct reuseIdentifier:giveNnunc]) {
        [self ecrClockLash];
    }
    
    return self;
}

- (void)ecrClockLash {
    
    self.backgroundColor = [UIColor clearColor];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    self.cmmnConfirmOnto = [LayttHideawayIntentManager stylsThickenerSisal];
    [self.contentView addSubview:self.cmmnConfirmOnto];
    
    self.chrgEmulateShut = [LayttHideawayIntentManager blendedInfectTested];
    [self.cmmnConfirmOnto addSubview:self.chrgEmulateShut];
    
    self.tpicRestoreName = [LayttHideawayIntentManager brnetteLastDepart];
    [self.cmmnConfirmOnto addSubview:self.tpicRestoreName];
    
    [self.cmmnConfirmOnto mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(10);
        make.leading.trailing.bottom.mas_equalTo(self.contentView);
    }];
    
    [self.chrgEmulateShut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.cmmnConfirmOnto).offset(16);
        make.top.mas_equalTo(self.cmmnConfirmOnto).offset(10);
        make.height.mas_equalTo(19);
    }];
    
    [self.tpicRestoreName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.chrgEmulateShut);
        make.trailing.mas_equalTo(self.cmmnConfirmOnto).inset(15);
        make.top.mas_equalTo(self.chrgEmulateShut.mas_bottom).offset(4);
        make.bottom.mas_equalTo(self.cmmnConfirmOnto).inset(11);
    }];
}

- (void)barrelPeriodicSisal:(VrPersistentlyModel *)nvgtOmit {
    self.chrgEmulateShut.text = [NSString stringWithFormat:@"%@ %@", MUNICIPAL_INDISCRETION(495), nvgtOmit.mthdServiceThen];
    self.tpicRestoreName.text = nvgtOmit.title;
}

- (void)narcisssBoozerKulfi:(BOOL)tnsnEdge {
    if (tnsnEdge) {
        self.chrgEmulateShut.textColor = [UIColor swipeScabiesNomad:@"#3bdff3"];
        self.tpicRestoreName.textColor = [UIColor swipeScabiesNomad:@"#3bdff3"];
    } else {
        self.chrgEmulateShut.textColor = [UIColor whiteColor];
        self.tpicRestoreName.textColor = [UIColor whiteColor];
    }
}

@end