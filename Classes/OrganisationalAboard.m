







#import "OrganisationalAboard.h"
#import "VpGaietyRoundwormManager.h"

@interface OrganisationalAboard ()

@property (nonatomic, strong) UILabel *chrgEmulateShut;
@property (nonatomic, strong) UIView *btinWelcomeText;
@property (nonatomic, strong) UILabel *brshIndirectCase;
@property (nonatomic, strong) UILabel *frgtRecursiveKnow;
@property (nonatomic, strong) UILabel *tchDatabaseWise;
@property (nonatomic, strong) UILabel *mngKeyboardHelp;
@property (nonatomic, strong) UILabel *mthdDisplayMark;
@property (nonatomic, strong) UIView *bginSimilarSame;
@property (nonatomic, strong) AirflowInfluxView *stckRedefineCostView;
@property (nonatomic, strong) HCSStarRatingView * vwlNumericMachView;

@end

@implementation OrganisationalAboard

- (instancetype)initWithFrame:(CGRect)trunctLoss andIntndNavigateWell:(NSInteger)dscndLook {
    
    if (self = [super initWithFrame:trunctLoss]) {
        [self perclatrTestedBelt:dscndLook];
    }
    return self;
}

- (void)perclatrTestedBelt:(dvicObserveNext)eachVrus {
    
    self.chrgEmulateShut = [VpGaietyRoundwormManager blendedInfectTested];
    [self addSubview:self.chrgEmulateShut];
    
    self.btinWelcomeText = [VpGaietyRoundwormManager typhnHealerNearside];
    [self addSubview:self.btinWelcomeText];
    
    self.brshIndirectCase = [VpGaietyRoundwormManager gadgetTwillNovember];
    [self.btinWelcomeText addSubview:self.brshIndirectCase];
    
    self.frgtRecursiveKnow = [VpGaietyRoundwormManager fiscallyHauteurSane];
    [self addSubview:self.frgtRecursiveKnow];
    
    self.tchDatabaseWise = [VpGaietyRoundwormManager tfitterPederastSisal];
    [self addSubview:self.tchDatabaseWise];
    
    self.mngKeyboardHelp = [VpGaietyRoundwormManager lipstickLastCorked];
    [self addSubview:self.mngKeyboardHelp];
    
    self.mthdDisplayMark = [VpGaietyRoundwormManager weedyAttendanceLash];
    [self addSubview:self.mthdDisplayMark];
    
    self.bginSimilarSame = [VpGaietyRoundwormManager stylsTankerSans];
    [self addSubview:self.bginSimilarSame];

    [self layoutIfNeeded];    
    
    [self.chrgEmulateShut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.width.mas_lessThanOrEqualTo(PLYHUS_REGULARIZE-58);
        make.top.mas_equalTo(13);
        make.height.mas_equalTo(21);
    }];
    
    [self.btinWelcomeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.chrgEmulateShut);
        make.top.mas_equalTo(self.chrgEmulateShut.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(140, 20));
    }];
    
    [self.brshIndirectCase mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.trailing.bottom.mas_equalTo(self.btinWelcomeText);
        make.centerY.equalTo(self.btinWelcomeText.mas_centerY);
    }];
    
    [self.frgtRecursiveKnow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.width.mas_lessThanOrEqualTo(PLYHUS_REGULARIZE-28);
        make.top.mas_equalTo(self.btinWelcomeText.mas_bottom).offset(16);
    }];
    
    [self.tchDatabaseWise mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.width.mas_lessThanOrEqualTo(PLYHUS_REGULARIZE-28);
        make.top.mas_equalTo(self.frgtRecursiveKnow.mas_bottom).offset(6);
    }];
    
    [self.mngKeyboardHelp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(14);
        make.width.mas_lessThanOrEqualTo(PLYHUS_REGULARIZE-28);
        make.top.mas_equalTo(self.tchDatabaseWise.mas_bottom).offset(6);
    }];
    
    [self.mthdDisplayMark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mngKeyboardHelp.mas_bottom).offset(15);
        make.leading.mas_equalTo(self.chrgEmulateShut);
        make.bottom.mas_equalTo(self).inset(14);
    }];
    
    [self.bginSimilarSame mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.bottom.trailing.mas_equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    self.vwlNumericMachView = [VpGaietyRoundwormManager saceAttendanceRemedy];
    [self.btinWelcomeText addSubview:self.vwlNumericMachView];
    
    self.stckRedefineCostView = [VpGaietyRoundwormManager bangleRosebudSinuous];
    @weakify(self);
    [self.stckRedefineCostView baneflKnockerSecular:^(AirflowInfluxView *zeroCntury) {
        @strongify(self);
        if (self.thirdConfigureToneBlock) {
            self.thirdConfigureToneBlock(zeroCntury.mtrixFeatureRoom.wrSqueezeOnce, zeroCntury.circlEllipsisCost);
        }
    }];
    [self addSubview:self.stckRedefineCostView];
    [self.stckRedefineCostView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self).inset(15);
        make.size.mas_equalTo(CGSizeMake(98, 28));
        make.centerY.mas_equalTo(self.mthdDisplayMark);
    }];
}

- (void)weedyMornTwill:(StdiosAsciiPassengerModel *)nvgtOmit {
    self.chrgEmulateShut.text = nvgtOmit.title;
    CGFloat vltCost = [LOCKDOWN_BOGAN(nvgtOmit.rate).narcisssTwillMouldy floatValue];
    if(vltCost > 0){
        self.vwlNumericMachView.hidden = NO;
        self.vwlNumericMachView.value = vltCost * 0.5;
        self.brshIndirectCase.hidden = NO;
        self.brshIndirectCase.text = [NSString stringWithFormat:@"%.1f", vltCost];
        [self.btinWelcomeText mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.chrgEmulateShut);
            make.top.mas_equalTo(self.chrgEmulateShut.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(140, 20));
        }];
    }else{
        
        self.vwlNumericMachView.hidden = YES;
        self.vwlNumericMachView.value = 0;
        self.brshIndirectCase.hidden = YES;
        self.brshIndirectCase.text = @"";
        [self.btinWelcomeText mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self.chrgEmulateShut);
            make.top.mas_equalTo(self.chrgEmulateShut.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(140, 0));
        }];
    }
    self.frgtRecursiveKnow.text = nvgtOmit.country;
    self.tchDatabaseWise.text = nvgtOmit.whlObserveWish;
    
    NSMutableArray *fmlrSoft = [NSMutableArray array];
    for (FryDownscaleModel *dclrFast in nvgtOmit.byndNecessaryRule) {
        [fmlrSoft addObject:dclrFast.nglExpungeList];
    }
    
    self.mngKeyboardHelp.text = [fmlrSoft componentsJoinedByString:@" "];
        
    NSMutableArray *tinyPnn = [NSMutableArray array];
    for (int i = 0; i < nvgtOmit.lvlMaintainFall.count; i++) {
        NlavndAsciiAftModel *memoPnn = nvgtOmit.lvlMaintainFall[i];
        NSString *flowXtnsn = memoPnn.ffctExtensionList;
        MothballInternet *muchCnfrm = [[MothballInternet alloc] initWithItem:flowXtnsn withName:memoPnn.title];
        [tinyPnn addObject:muchCnfrm];
    }
    self.stckRedefineCostView.dataSource = tinyPnn;
    self.btinWelcomeText.hidden = NO;
    self.mthdDisplayMark.hidden = NO;
    self.stckRedefineCostView.hidden = NO;
    self.bginSimilarSame.hidden = NO;
}

- (void)favelaCorkedSculler:(NSInteger)sntncTrap{
    self.stckRedefineCostView.circlEllipsisCost = sntncTrap;
}

@end