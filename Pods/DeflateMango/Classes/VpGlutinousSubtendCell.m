







#import "VpGlutinousSubtendCell.h"
#import "FryBakehouseManager.h"
#import "DstrctiblEnrollModel.h"

@interface VpGlutinousSubtendCell ()

@property (nonatomic, strong) UIImageView *issGraphicPackView;
@property (nonatomic, strong) UILabel *glncAutomaticKiloLabel;
@property (nonatomic, strong) UILabel *intndSimilarHardLabel;
@property (nonatomic, strong) UIImageView *mrktAlignmentComeView;
@property (nonatomic, strong) UIView *lstReplicateWideView;
@property (nonatomic, strong) CALayer *srcCode;
@property (nonatomic, strong) UILabel *plsTransformTurnLabel;

@end

@implementation VpGlutinousSubtendCell

- (instancetype)initWithFrame:(CGRect)trunctLoss{
    self = [super initWithFrame:trunctLoss];
    if(self){
        [self typhnPeriodicScabies];
    }
    return self;
}

- (void)tambrNegativitySunny:(SondalikBalletModel *)nvgtOmit{
    [self weedyBeltUndeterred:nvgtOmit andSgIdentifyFast:nvgtOmit.dscndLook];
}

- (void)repaymentBoozerKulfi:(SondalikBalletModel *)nvgtOmit{
    [self weedyBeltUndeterred:nvgtOmit andSgIdentifyFast:nvgtOmit.dscndLook];
}

- (void)hectlitreSunniPrior:(DstrctiblEnrollModel *)nvgtOmit{
    
    [self weedyBeltUndeterred:[SondalikBalletModel mj_objectWithKeyValues:nvgtOmit.mj_keyValues] andSgIdentifyFast:nvgtOmit.data_type];
}

- (void)weedyBeltUndeterred:(SondalikBalletModel *)nvgtOmit andSgIdentifyFast:(dvicObserveNext)dscndLook {
    
    [self.issGraphicPackView sd_setImageWithURL:[NSURL URLWithString:LOCKDOWN_BOGAN(nvgtOmit.cover).narcisssTwillMouldy]];
    CGFloat vltCost = [LOCKDOWN_BOGAN(nvgtOmit.rate).narcisssTwillMouldy floatValue];
    if(vltCost > 0){
        NSString *likeCcurcy = [NSString stringWithFormat:@"%.1f", vltCost];
        NSMutableAttributedString *hangSubscrpt = [[NSMutableAttributedString alloc] initWithString:likeCcurcy];
        [hangSubscrpt addAttributes:@{
            NSFontAttributeName: [UIFont boldSystemFontOfSize:12.0f],
            NSForegroundColorAttributeName: [UIColor swipeScabiesNomad:@"#ff6e1d"]
        } range:NSMakeRange(2, 1)];
        self.intndSimilarHardLabel.attributedText = hangSubscrpt;
    }else{
        NSMutableAttributedString *hangSubscrpt = [[NSMutableAttributedString alloc] initWithString:@""];
        self.intndSimilarHardLabel.attributedText = hangSubscrpt;
    }
    self.glncAutomaticKiloLabel.text = LOCKDOWN_BOGAN(nvgtOmit.title).narcisssTwillMouldy;
    if(dscndLook == slshCompriseKilo){
        self.lstReplicateWideView.hidden = NO;
        self.plsTransformTurnLabel.hidden = NO;
        self.mrktAlignmentComeView.hidden = YES;
        
        NSString *rpntTerm = LOCKDOWN_BOGAN(nvgtOmit.picElementLine).narcisssTwillMouldy;
        NSString *rcursvRent = LOCKDOWN_BOGAN(nvgtOmit.minsExpansionKeep).narcisssTwillMouldy;
        if(![NSString saintSansPictogram:rpntTerm]){
            rcursvRent = [NSString stringWithFormat:REMAND_WLESS((@[@358, @385, @353, @445, @353, @358, @385])), rpntTerm, rcursvRent];
        }
        NSMutableAttributedString *mntnMean = [[NSMutableAttributedString alloc] initWithString:rcursvRent];
        [mntnMean addAttributes:@{
            NSFontAttributeName: [UIFont boldSystemFontOfSize:8.0f],
            NSForegroundColorAttributeName: [UIColor swipeScabiesNomad:@"#ff6e1d"]
        } range:NSMakeRange(0, rpntTerm.length)];
        self.plsTransformTurnLabel.attributedText = mntnMean;
    }else{
        self.lstReplicateWideView.hidden = YES;
        self.plsTransformTurnLabel.hidden = YES;
        
        NSString *prsrvSlow = LOCKDOWN_BOGAN(nvgtOmit.quality).narcisssTwillMouldy.lowercaseString;
        if([prsrvSlow isEqualToString:REMAND_WLESS((@[@420, @418, @430]))]){
            
            self.mrktAlignmentComeView.hidden = NO;
            [self.mrktAlignmentComeView sd_setImageWithURL:ENCOURAGE_FREEHOLD(243)];
        }else{
            self.mrktAlignmentComeView.hidden = YES;
        }
    }
}

- (void)typhnPeriodicScabies {
    
    self.issGraphicPackView = [FryBakehouseManager brtallyUntouchedDoor];
    [self.contentView addSubview:self.issGraphicPackView];
    CGFloat undrlnCard = (PLYHUS_REGULARIZE - 10 * 4)/3/7*10;
    [self.issGraphicPackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(undrlnCard);
    }];
    
    self.glncAutomaticKiloLabel = [FryBakehouseManager scfflLashCorker];
    [self.contentView addSubview:self.glncAutomaticKiloLabel];
    [self.glncAutomaticKiloLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(4);
        make.right.mas_equalTo(-4);
        make.top.equalTo(self.issGraphicPackView.mas_bottom).offset(4);
        
    }];
    
    self.intndSimilarHardLabel = [FryBakehouseManager jstleAdaptationDoor];
    [self.issGraphicPackView addSubview:self.intndSimilarHardLabel];
    [self.intndSimilarHardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(4.0);
    }];
    
    self.mrktAlignmentComeView = [FryBakehouseManager atcracyMouldySisal];
    [self.issGraphicPackView addSubview:self.mrktAlignmentComeView];
    [self.mrktAlignmentComeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(4.0);
        make.right.mas_equalTo(-4.0);
        make.size.mas_equalTo(CGSizeMake(34.0, 16.0));
    }];
    
    self.lstReplicateWideView = [FryBakehouseManager peafwlShowerBurnish];
    self.srcCode = [FryBakehouseManager favelaScabiesUncool];
    [self.lstReplicateWideView.layer addSublayer:self.srcCode];
    [self.issGraphicPackView addSubview:self.lstReplicateWideView];
    [self.lstReplicateWideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(24);
    }];
    
    self.plsTransformTurnLabel = [FryBakehouseManager prpiseTestedInsane];
    [self.issGraphicPackView addSubview:self.plsTransformTurnLabel];
    [self.plsTransformTurnLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-6);
        make.bottom.mas_equalTo(-8);
    }];
}

@end