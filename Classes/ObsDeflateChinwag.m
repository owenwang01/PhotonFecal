







#import "ObsDeflateChinwag.h"

@interface ObsDeflateChinwag ()
@property (nonatomic, strong) UIButton *hppnConnectKiloBtn;
@property (nonatomic, strong) UIButton *cyclPentiumTrapBtn;
@property (nonatomic, strong) UIButton *timsRequireGigaBtn;
@end

@implementation ObsDeflateChinwag

- (instancetype)initWithFrame:(CGRect)trunctLoss
{
    self = [super initWithFrame:trunctLoss];
    if (self) {
        [self ecrClockLash];
    }
    return self;
}

- (void)ecrClockLash {
    self.isPlaying = YES;
    [self addSubview:self.hppnConnectKiloBtn];
    [self addSubview:self.cyclPentiumTrapBtn];
    [self addSubview:self.timsRequireGigaBtn];
    
    [self.hppnConnectKiloBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.leading.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    
    [self.cyclPentiumTrapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    
    [self.timsRequireGigaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.trailing.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
}

- (void)show {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
    }];
    self.ccssAttemptFull = YES;
}

- (void)scfflKnockerSecular:(BOOL)cntntMuch {
    if(cntntMuch){
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            self.ccssAttemptFull = NO;
        }];
    }else{
        [self removeFromSuperview];
        self.ccssAttemptFull = NO;
    }
}

- (void)virsOverboardPrior:(BOOL)treeDtbs {
    self.isPlaying = !treeDtbs;
    if (treeDtbs) {
        [_cyclPentiumTrapBtn sd_setImageWithURL:ENCOURAGE_FREEHOLD(163) forState:UIControlStateNormal];
    } else {
        [_cyclPentiumTrapBtn sd_setImageWithURL:ENCOURAGE_FREEHOLD(162) forState:UIControlStateNormal];
    }
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)saleClckws shouldReceiveTouch:(UITouch *)mprtntExit{
    CGPoint gigaXtrct = [mprtntExit locationInView:self];
    BOOL trueChv = [self pointInside:gigaXtrct withEvent:UIEventTypeTouches];
    if(trueChv && _ccssAttemptFull){
        return NO;
    }
    return YES;
}


- (UIButton *)hppnConnectKiloBtn {
    if (!_hppnConnectKiloBtn) {
        _hppnConnectKiloBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_hppnConnectKiloBtn sd_setImageWithURL:ENCOURAGE_FREEHOLD(161) forState:UIControlStateNormal];
        @weakify(self);
        [[_hppnConnectKiloBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            if(self.bfrSuspendViceBlock){
                self.bfrSuspendViceBlock(thrAddressBlue);
            }
        }];
    }
    
    return _hppnConnectKiloBtn;
}

- (UIButton *)cyclPentiumTrapBtn {
    if (!_cyclPentiumTrapBtn) {
        _cyclPentiumTrapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cyclPentiumTrapBtn sd_setImageWithURL:ENCOURAGE_FREEHOLD(162) forState:UIControlStateNormal];
        @weakify(self);
        [[_cyclPentiumTrapBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            if(self.bfrSuspendViceBlock){
                self.bfrSuspendViceBlock(cttSentenceMean);
            }
        }];
    }
    
    return _cyclPentiumTrapBtn;
}

- (UIButton *)timsRequireGigaBtn {
    if (!_timsRequireGigaBtn) {
        _timsRequireGigaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_timsRequireGigaBtn sd_setImageWithURL:ENCOURAGE_FREEHOLD(164) forState:UIControlStateNormal];
        @weakify(self);
        [[_timsRequireGigaBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            if(self.bfrSuspendViceBlock){
                self.bfrSuspendViceBlock(simplInstanceBeep);
            }
        }];
    }
    return _timsRequireGigaBtn;
}

@end