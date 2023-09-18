







#import "MckSponsorshipView.h"

@interface MckSponsorshipView ()

@property (nonatomic, strong) UIButton *brwnContinueCashBtn;
@property (nonatomic, strong) UIButton *spillAccidentStepBtn;
@property (nonatomic, assign) NSInteger psdGraphicBook;

@end

@implementation MckSponsorshipView

- (instancetype)initWithFrame:(CGRect)trunctLoss {
    if (self = [super initWithFrame:trunctLoss]) {
        [self selfKulfiKerosene];
    }
    return self;
}


- (void)selfKulfiKerosene {
    self.backgroundColor = [UIColor swipeScabiesNomad:@"#191b26"];
    self.layer.cornerRadius = 4;
    self.clipsToBounds = YES;
    
    [self addSubview:self.brwnContinueCashBtn];
    [self addSubview:self.spillAccidentStepBtn];
    
    [self.brwnContinueCashBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(29);
        make.leading.mas_equalTo(self).offset(15);
        make.trailing.mas_equalTo(self).inset(15);
        make.height.mas_equalTo(34);
    }];
    
    [self.spillAccidentStepBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.brwnContinueCashBtn.mas_bottom).offset(24);
        make.leading.mas_equalTo(self).offset(15);
        make.trailing.mas_equalTo(self).inset(15);
        make.height.mas_equalTo(34);
    }];
    
}

- (void)dismiss{
    if(self.superview){
        [self removeFromSuperview];
    }
}

+ (void)arsnPeriodicRemedy:(UIView *)rsrvSeek andNcdConfigureTeam:(CGPoint)gigaXtrct andFigrMistakeTest:(cstmDiscardMachBlock)turnPrduct{
    if(rsrvSeek){
        for (UIView *view in rsrvSeek.subviews) {
            if([view isKindOfClass:MckSponsorshipView.class]){
                [view removeFromSuperview];
            }
        }
    }
    CGFloat prflArea = CGRectGetHeight(rsrvSeek.frame);
    CGFloat yearTrnsfrm = 0;
    if(prflArea > 150){
        yearTrnsfrm = (prflArea - 150) * 0.5;
    }else{
        yearTrnsfrm = gigaXtrct.y;
    }
    yearTrnsfrm = gigaXtrct.y;
    MckSponsorshipView *mssgSafe = [[MckSponsorshipView alloc] initWithFrame:CGRectMake(gigaXtrct.x, yearTrnsfrm, 230, 150)];
    mssgSafe.tag = 3210065;
    [rsrvSeek addSubview:mssgSafe];
    @weakify(mssgSafe);
    [mssgSafe.lphInterruptEdit subscribeNext:^(id  _Nullable x) {
        if(turnPrduct){
            turnPrduct(mssgSafe_weak_, rdrwReplicateSuch);
        }
    }];
    [mssgSafe.psSemicolonLike subscribeNext:^(id  _Nullable x) {
        if(turnPrduct){
            turnPrduct(mssgSafe_weak_, rflwPermanentWide);
        }
    }];
}

+(UIView *)atcracyBeltAutogenic
{
    return (MckSponsorshipView *)[[[UIApplication sharedApplication] keyWindow] viewWithTag:3210065];
}

- (void)clleageGropeNearside:(UIButton *)mnfstMemo {
    if (mnfstMemo == self.brwnContinueCashBtn) {
        [self.lphInterruptEdit sendNext:nil];
    } else {
        [self.psSemicolonLike sendNext:nil];
    }
}


- (UIButton *)brwnContinueCashBtn {
    if (!_brwnContinueCashBtn) {
        _brwnContinueCashBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_brwnContinueCashBtn setTitle:MUNICIPAL_INDISCRETION(1098) forState:UIControlStateNormal];
        [_brwnContinueCashBtn setBackgroundColor:[UIColor swipeScabiesNomad:@"#cdcdcd"]];
        [_brwnContinueCashBtn setTitleColor:[UIColor swipeScabiesNomad:@"#212323"] forState:UIControlStateNormal];
        _brwnContinueCashBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_brwnContinueCashBtn addTarget:self action:@selector(clleageGropeNearside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _brwnContinueCashBtn;
}

- (UIButton *)spillAccidentStepBtn {
    if (!_spillAccidentStepBtn) {
        _spillAccidentStepBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_spillAccidentStepBtn setTitle:MUNICIPAL_INDISCRETION(241) forState:UIControlStateNormal];
        [_spillAccidentStepBtn setBackgroundColor:[UIColor swipeScabiesNomad:@"#cdcdcd"]];
        [_spillAccidentStepBtn setTitleColor:[UIColor swipeScabiesNomad:@"#212323"] forState:UIControlStateNormal];
        _spillAccidentStepBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_spillAccidentStepBtn addTarget:self action:@selector(clleageGropeNearside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _spillAccidentStepBtn;
}

- (RACSubject *)lphInterruptEdit {
    if (!_lphInterruptEdit) {
        _lphInterruptEdit = [RACSubject subject];
    }
    return _lphInterruptEdit;
}

- (RACSubject *)psSemicolonLike {
    if (!_psSemicolonLike) {
        _psSemicolonLike = [RACSubject subject];
    }
    
    return _psSemicolonLike;
}


@end
