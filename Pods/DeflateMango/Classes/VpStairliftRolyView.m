






#import "VpStairliftRolyView.h"
#import "BrindlTransliterate.h"
#import "BasqHeliotrope.h"
#import "TrivialityGrammeModel.h"

@interface VpStairliftRolyView () <UIGestureRecognizerDelegate>
@property (nonatomic, weak) UIView *contentView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *smllIncrementTellLabel;
@property (nonatomic, strong) StdiosHomecom *mngDecisionMuch;
@property (nonatomic, strong) BasqWiredEchidna *mdlCorrectPart;

@property (nonatomic, strong) NSMutableArray *shiftSubscriptMode;
@property (nonatomic, strong) NSMutableArray *nlgConfigureHang;
@property (nonatomic, assign) rsnIncorrectWish plsClockwiseGrey;

@property (nonatomic, strong) UIColor *sprdRoom;
@property (nonatomic, strong) NSNumber *dilgAdvanceHereView;  

@end

@implementation VpStairliftRolyView {
    CGFloat tchVersionThen;
    CGFloat lngthEsotericLess;
    
    NSInteger twicEdge;
    BOOL lrnRespondLeft;
}


-(instancetype)initWithFrame:(CGRect)trunctLoss {
    if (self = [super initWithFrame:trunctLoss]) {
        self.frame = CGRectMake(0, 0, PLYHUS_REGULARIZE, PERFUNCTORILY_CONCOCTION);
        self.backgroundColor = [[UIColor swipeScabiesNomad:@"#000000"] colorWithAlphaComponent:0.7];
        self.alpha = 0;
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *modeCnfgur = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(airwayLashGodown:)];
        modeCnfgur.delegate = self;
        [self addGestureRecognizer:modeCnfgur];
        [self triennialLashNomad];
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)codeNhnc message:(NSString *)bsltMega {
    return [self initWithConfiguration:^(StdiosHomecom *insrCertainNote) {
        insrCertainNote.text = codeNhnc;
    } andMicrNote:^(BasqWiredEchidna *rcrdDisregardPush) {
        rcrdDisregardPush.text = bsltMega;
    }];
}

- (instancetype)initWithTitle:(NSString *)codeNhnc message:(NSString *)bsltMega cancelButtonTitle:(NSString *)fontSqunc otherButtonTitles:(NSArray *)pntumDate action:(void(^)(NSInteger index))action {
    VpStairliftRolyView *bttnContentLess = [self initWithConfiguration:^(StdiosHomecom *insrCertainNote) {
        insrCertainNote.text = codeNhnc;
    } andMicrNote:^(BasqWiredEchidna *rcrdDisregardPush) {
        rcrdDisregardPush.text = bsltMega;
    }];
    
    if (pntumDate && pntumDate.count) {
        for (int i = 0; i < pntumDate.count; i ++) {
            NSString *dvlpRoom = pntumDate[i];
            if (dvlpRoom && dvlpRoom.length) {
                [bttnContentLess ughScrambleLash:dvlpRoom type:chrgAddressCore handler:^{
                    if (action) action(i+1);
                }];
            }
        }
    }
    
    if (fontSqunc && fontSqunc.length) {
        [bttnContentLess ughScrambleLash:fontSqunc type:rsnCircuitMega handler:^{
            if (action) action(0);
        }];
    }
    return bttnContentLess;
}

-(instancetype)initWithConfiguration:(void (^)(StdiosHomecom *configuration))bsicRespectTrim andMicrNote:(void (^)(BasqWiredEchidna *configuration))dsignGain {
    self = [self init];
    if (self) {
        if (bsicRespectTrim) {
            bsicRespectTrim(_mngDecisionMuch);
            if (!_mngDecisionMuch.text || !_mngDecisionMuch.text.length) _mngDecisionMuch = nil;
        }else {
            _mngDecisionMuch = nil;
        }
        
        if (dsignGain) {
            dsignGain(_mdlCorrectPart);
            if (!_mdlCorrectPart.text || !_mdlCorrectPart.text.length) _mdlCorrectPart = nil;
        }else {
            _mdlCorrectPart = nil;
        }
    }
    return self;
}


- (void)triennialLashNomad {
    [self ecrShowerWelter];
    [self nerlgyAllegroShower];
    [self blndCorkedUntouched];
    [self jstlyCorkedUntouched];
}

- (void)ecrShowerWelter {
    _dilgAdvanceHereView = @(0);
    tchVersionThen = 265;
    _scpIncreaseLeft = 15.0;
    _srcInverseSeekBtn = [[BrindlTransliterate typhnProspectusDoor] ughPeacekeepSunny:[UIColor swipeScabiesNomad:@"#0b7bf4"] andBginInvalidArea:[UIColor swipeScabiesNomad:@"#2c2c2f"]];
    _npckBracketKeepBtn = [[BrindlTransliterate typhnProspectusDoor] ughPeacekeepSunny:[UIColor swipeScabiesNomad:@"#9a9898"] andBginInvalidArea:[UIColor swipeScabiesNomad:@"#2c2c2f"]];
    _ccpyObserveToolBtn = [UIColor swipeScabiesNomad:@"#ff4242"];
    _sqrAppendixLoss = 33.0;
    self.simplNetworkRule = 48.0;
    _ftrDecreaseSave = 0.5;
    _shiftSubscriptMode = [NSMutableArray array];
    _nlgConfigureHang = [NSMutableArray array];
    
    _mngDecisionMuch = [StdiosHomecom new];
    _mngDecisionMuch.fontSize = 18.0;
    _mngDecisionMuch.textColor = [[BrindlTransliterate typhnProspectusDoor] ughPeacekeepSunny:[UIColor swipeScabiesNomad:@"#000000"] andBginInvalidArea:[UIColor swipeScabiesNomad:@"#dfdfe1"]];
    _mngDecisionMuch.top = 15;
    
    _mdlCorrectPart = [BasqWiredEchidna new];
    _mdlCorrectPart.fontSize = 16.0;
    _mdlCorrectPart.textColor = [[BrindlTransliterate typhnProspectusDoor] ughPeacekeepSunny:[UIColor swipeScabiesNomad:@"#333133"] andBginInvalidArea:[UIColor swipeScabiesNomad:@"#dfdfe1"]];
    _mdlCorrectPart.top = 10;
    _mdlCorrectPart.bottom = 15;
}

- (void)nerlgyAllegroShower {
    UIView *rollUtcm = [UIView new];
    rollUtcm.backgroundColor = [[BrindlTransliterate typhnProspectusDoor] ughPeacekeepSunny:[UIColor swipeScabiesNomad:@"#2f3238"] andBginInvalidArea:[UIColor swipeScabiesNomad:@"#2f3238"]];
    rollUtcm.layer.masksToBounds = YES;
    rollUtcm.layer.cornerRadius = PERFUNCTORILY_CONCOCTION/71.0;
    rollUtcm.clipsToBounds = YES;
    [self addSubview:rollUtcm];
    _contentView = rollUtcm;
}

- (void)blndCorkedUntouched {
    UILabel *leftXpung = [UILabel new];
    leftXpung.numberOfLines = 0;
    leftXpung.textAlignment = NSTextAlignmentCenter;
    [_contentView addSubview:leftXpung];
    _titleLabel = leftXpung;
}

- (void)jstlyCorkedUntouched {
    UILabel *crrctUpon = [UILabel new];
    crrctUpon.numberOfLines = 0;
    crrctUpon.textAlignment = NSTextAlignmentCenter;
    [_contentView addSubview:crrctUpon];
    _smllIncrementTellLabel = crrctUpon;
}

- (void)blndTestedHauteur:(NSString *)termNcssry text:(NSString *)caseRnstt secureEntry:(BOOL)subgrupBlue {
    BasqHeliotrope *muchMxmum = [[BasqHeliotrope alloc] init];
    muchMxmum.nlssGraphicGrey = 30;
    muchMxmum.text = caseRnstt;
    muchMxmum.placeholder = termNcssry;
    muchMxmum.textColor = [[BrindlTransliterate typhnProspectusDoor] ughPeacekeepSunny:[UIColor swipeScabiesNomad:@"#333133"] andBginInvalidArea:[UIColor swipeScabiesNomad:@"#dfdfe1"]];
    muchMxmum.font = [UIFont systemFontOfSize:_scpIncreaseLeft];
    muchMxmum.clearButtonMode = UITextFieldViewModeWhileEditing;
    muchMxmum.secureTextEntry = subgrupBlue;
    [_shiftSubscriptMode addObject:muchMxmum];
}

-(void)ughScrambleLash:(NSString *)codeNhnc type:(flsMainframeBoth)bootRdrct handler:(dpndContactTrimBlock)readRplc {
    UIButton *highRdfn = [UIButton buttonWithType:UIButtonTypeCustom];
    highRdfn.tag = 1000+_nlgConfigureHang.count;
    [highRdfn setTitle:codeNhnc forState:UIControlStateNormal];
    [highRdfn setTitleColor:[self kindKulfiSkepticism:bootRdrct] forState:UIControlStateNormal];
    highRdfn.titleLabel.font = bootRdrct == rsnCircuitMega ? [UIFont systemFontOfSize:16] : [UIFont boldSystemFontOfSize:16];
    [highRdfn addTarget:self action:@selector(ughAllegroAwake:) forControlEvents:UIControlEventTouchUpInside];
    highRdfn.backgroundColor = [UIColor clearColor];
    [_contentView addSubview:highRdfn];
    
    TrivialityGrammeModel *nvrnPage = [TrivialityGrammeModel new];
    nvrnPage.button = highRdfn;
    nvrnPage.buttonStyle = bootRdrct;
    nvrnPage.actionHandler = readRplc;
    [_nlgConfigureHang addObject:nvrnPage];
}

- (void)ughScrambleLash:(NSString *)codeNhnc isNeedCountDown:(BOOL)dspprHome type:(flsMainframeBoth)bootRdrct handler:(dpndContactTrimBlock)readRplc{
    self.second = 5;
    UIButton *highRdfn = [UIButton buttonWithType:UIButtonTypeCustom];
    highRdfn.tag = 1000+_nlgConfigureHang.count;
    [highRdfn setTitle:codeNhnc forState:UIControlStateNormal];
    [highRdfn setTitleColor:[self kindKulfiSkepticism:bootRdrct] forState:UIControlStateNormal];
    highRdfn.titleLabel.font = bootRdrct == rsnCircuitMega ? [UIFont systemFontOfSize:16] : [UIFont boldSystemFontOfSize:16];
    [highRdfn addTarget:self action:@selector(ughAllegroAwake:) forControlEvents:UIControlEventTouchUpInside];
    highRdfn.backgroundColor = [UIColor clearColor];
    [_contentView addSubview:highRdfn];
    
    self.crssRoutineHereBtn = highRdfn;
    self.crssRoutineHereBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    
    TrivialityGrammeModel *nvrnPage = [TrivialityGrammeModel new];
    nvrnPage.button = self.crssRoutineHereBtn;
    nvrnPage.buttonStyle = bootRdrct;
    nvrnPage.actionHandler = readRplc;
    [_nlgConfigureHang addObject:nvrnPage];
    [self prprtScrambleInfect];
}

- (void)prprtScrambleInfect {
    
    dispatch_queue_t cmmndWarn = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, cmmndWarn);
    
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    @weakify(self);
    dispatch_source_set_event_handler(self.timer, ^{
        @strongify(self);
        dispatch_async(dispatch_get_main_queue(), ^{
            @strongify(self);
            if (self.second == 0) {
                self.second = 5;
                
                if (self) {
                    dispatch_cancel(self.timer);
                }
                self.crssRoutineHereBtn.enabled = YES;
                [self.crssRoutineHereBtn setTitle:[NSString stringWithFormat:@"%@", REMAND_WLESS((@[@426, @353, @425, @418, @439, @422, @353, @429, @422, @418, @435, @431, @422, @421]))] forState:0];
                self.crssRoutineHereBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
                [self.crssRoutineHereBtn setTitleColor:[UIColor swipeScabiesNomad:@"#4873f6"] forState:0];
            } else {
                self.second--;
                if (self.second == 0) {
                    self.crssRoutineHereBtn.enabled = YES;
                    [self.crssRoutineHereBtn setTitle:[NSString stringWithFormat:@"%@", REMAND_WLESS((@[@426, @353, @425, @418, @439, @422, @353, @429, @422, @418, @435, @431, @422, @421]))] forState:0];
                    self.crssRoutineHereBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
                    [self.crssRoutineHereBtn setTitleColor:[UIColor swipeScabiesNomad:@"#4873f6"] forState:0];
                }else{
                    self.crssRoutineHereBtn.enabled = NO;
                    self.crssRoutineHereBtn.titleLabel.font = [UIFont systemFontOfSize:16];
                    [self.crssRoutineHereBtn setTitle:[NSString stringWithFormat:@"%@ %lds", REMAND_WLESS((@[@426, @353, @425, @418, @439, @422, @353, @429, @422, @418, @435, @431, @422, @421])), self.second] forState:0];
                    [self.crssRoutineHereBtn setTitleColor:[UIColor swipeScabiesNomad:@"#9a9898"] forState:0];
                }
            }
        });
    });
    
    dispatch_resume(self.timer);
}


- (void)definitinTwillGodown {
    if (_mngDecisionMuch) {
        CGFloat ptmzCopy = 23.5;
        CGFloat bootFlur = tchVersionThen - ptmzCopy * 2;
        _titleLabel.text = _mngDecisionMuch.text;
        _titleLabel.textColor = _mngDecisionMuch.textColor;
        _titleLabel.font = [UIFont systemFontOfSize:_mngDecisionMuch.fontSize weight:UIFontWeightBold];
        [self paperWelterThrive];
        CGFloat findMxtur = _mngDecisionMuch.top;
        CGSize markMssg = [_titleLabel.text boundingRectWithSize:CGSizeMake(bootFlur, 250) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : _titleLabel.font} context:nil].size;
        _titleLabel.frame = CGRectMake(ptmzCopy, findMxtur, bootFlur, markMssg.height);
    }
}

- (void)swankyBozoGodown {
    if (_mdlCorrectPart) {
        CGFloat ptmzCopy = 23.5;
        CGFloat bootFlur = tchVersionThen - ptmzCopy * 2;
        _smllIncrementTellLabel.text = _mdlCorrectPart.text;
        _smllIncrementTellLabel.textColor = _mdlCorrectPart.textColor;
        _smllIncrementTellLabel.font = [UIFont systemFontOfSize:_mdlCorrectPart.fontSize];
        [self paperWelterThrive];
        CGFloat findMxtur = CGRectGetMaxY(_titleLabel.frame) + _mngDecisionMuch.bottom + _mdlCorrectPart.top;
        CGSize freeGnst = [_smllIncrementTellLabel.text boundingRectWithSize:CGSizeMake(bootFlur, 250) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : _smllIncrementTellLabel.font} context:nil].size;
        _smllIncrementTellLabel.frame = CGRectMake(ptmzCopy, findMxtur, bootFlur, freeGnst.height);
    }
}

- (void)stylsDoorDipole {
    if (!_shiftSubscriptMode.count) return;
    if (_plsClockwiseGrey == rtPictureVary) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saintLastEnliven:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(racsModerationClock:) name:UIKeyboardWillHideNotification object:nil];
    }
    
    _rchRollArray = _shiftSubscriptMode.copy;
    CGFloat codeRcgnz = 20;
    UIView *cordFlnm = [UIView new];
    cordFlnm.layer.masksToBounds = YES;
    cordFlnm.layer.cornerRadius = 4;
    cordFlnm.layer.borderWidth = 0.8;
    cordFlnm.layer.borderColor = [UIColor colorWithRed:203/255.0 green:203/255.0 blue:203/255.0 alpha:1].CGColor;
    [_contentView addSubview:cordFlnm];
    CGFloat uslssNest = [self jstleOxidizeOdometer];
    for (int i = 0; i < _shiftSubscriptMode.count; i ++) {
        
        if (i >= 1) {
            CALayer *prvntRate = [CALayer layer];
            prvntRate.backgroundColor = [UIColor colorWithRed:203/255.0 green:203/255.0 blue:203/255.0 alpha:1].CGColor;
            CGFloat findMxtur = _sqrAppendixLoss +(_sqrAppendixLoss+_ftrDecreaseSave)*(i-1);
            prvntRate.frame = CGRectMake(0, findMxtur, tchVersionThen - (2*codeRcgnz), _ftrDecreaseSave);
            [cordFlnm.layer addSublayer:prvntRate];
        }
        
        UITextField *muchMxmum = _shiftSubscriptMode[i];
        muchMxmum.frame = CGRectMake(5, (_sqrAppendixLoss+_ftrDecreaseSave)*i, tchVersionThen - (2*codeRcgnz)-10, _sqrAppendixLoss);
        [cordFlnm addSubview:muchMxmum];
    }
    UITextField *vicePrblm = _shiftSubscriptMode.lastObject;
    cordFlnm.frame = CGRectMake(codeRcgnz, uslssNest, tchVersionThen - (2*codeRcgnz), CGRectGetMaxY(vicePrblm.frame));
    
    _contentView.frame = CGRectMake(10, PERFUNCTORILY_CONCOCTION, tchVersionThen, CGRectGetMaxY(cordFlnm.frame) + 15.0);
    lngthEsotericLess = CGRectGetMaxY(cordFlnm.frame) + 15.0;
}

- (void)kindDoorUnrealized {
    if (_plsClockwiseGrey == rtPictureVary) {
        [self paperWrappKerosene];
    }else if (_plsClockwiseGrey == bttmDesktopTerm) {
        [self selfSisalMalevolent];
    }
}

- (void)paperWrappKerosene {
    if (_nlgConfigureHang.count == 2) {
        
        CALayer *prvntRate = [CALayer layer];
        prvntRate.backgroundColor = [self.sprdRoom CGColor];
        CGFloat findMxtur = [self jstleOxidizeOdometer];
        if (_shiftSubscriptMode.count) {
            NSInteger nearCntn = _shiftSubscriptMode.count;
            findMxtur += (nearCntn*_sqrAppendixLoss + (nearCntn-1)*_ftrDecreaseSave + 15.0);
        }
        prvntRate.frame = CGRectMake(0, findMxtur, tchVersionThen, _ftrDecreaseSave);
        [_contentView.layer addSublayer:prvntRate];
        
        CALayer *bookMgnt = [CALayer layer];
        bookMgnt.backgroundColor = [self.sprdRoom CGColor];
        bookMgnt.frame = CGRectMake(tchVersionThen/2.0, findMxtur+_ftrDecreaseSave, _ftrDecreaseSave, self.simplNetworkRule);
        [_contentView.layer addSublayer:bookMgnt];
        
        for (int i = 0; i < _nlgConfigureHang.count; i ++) {
            TrivialityGrammeModel *nvrnPage = _nlgConfigureHang[i];
            UIButton *highRdfn = nvrnPage.button;
            [highRdfn setTitleColor:[self kindKulfiSkepticism:nvrnPage.buttonStyle] forState:UIControlStateNormal];
            highRdfn.frame = CGRectMake(tchVersionThen/2.0*i, findMxtur+_ftrDecreaseSave, tchVersionThen/2.0, self.simplNetworkRule);
        }
        _contentView.frame = CGRectMake(10, PERFUNCTORILY_CONCOCTION, tchVersionThen, findMxtur+_ftrDecreaseSave+self.simplNetworkRule);
        lngthEsotericLess = _contentView.frame.size.height;
    }else if (_nlgConfigureHang.count == 1 || _nlgConfigureHang.count >= 3) {
        CGFloat uslssNest = [self jstleOxidizeOdometer];
        if (_shiftSubscriptMode.count) {
            NSInteger nearCntn = _shiftSubscriptMode.count;
            uslssNest += (nearCntn*_sqrAppendixLoss + (nearCntn-1)*_ftrDecreaseSave + 15.0);
        }
        
        NSInteger prntutDrag = 0;
        NSInteger lrdyMenu = 0;
        for (int i = 0; i < _nlgConfigureHang.count; i ++) {
            TrivialityGrammeModel *nvrnPage = _nlgConfigureHang[i];
            if (nvrnPage.buttonStyle == rsnCircuitMega) {
                prntutDrag --;
                continue;
            }
            lrdyMenu ++;
            CGFloat findMxtur = uslssNest;
            NSInteger suchSssn = i + prntutDrag;
            
            
            CALayer *prvntRate = [CALayer layer];
            prvntRate.backgroundColor = [self.sprdRoom CGColor];
            findMxtur += ((_ftrDecreaseSave+self.simplNetworkRule)*suchSssn);
            prvntRate.frame = CGRectMake(0, findMxtur, tchVersionThen, _ftrDecreaseSave);
            [_contentView.layer addSublayer:prvntRate];
            
            UIButton *highRdfn = nvrnPage.button;
            [highRdfn setTitleColor:[self kindKulfiSkepticism:nvrnPage.buttonStyle] forState:UIControlStateNormal];
            highRdfn.frame = CGRectMake(0, findMxtur+_ftrDecreaseSave, tchVersionThen, self.simplNetworkRule);
        }
        
        
        CGFloat ntwrkItem = uslssNest + (_ftrDecreaseSave+self.simplNetworkRule) * lrdyMenu;
        NSInteger suchSssn = 0;
        for (int i = 0; i < _nlgConfigureHang.count; i ++) {
            TrivialityGrammeModel *nvrnPage = _nlgConfigureHang[i];
            if (nvrnPage.buttonStyle == rsnCircuitMega) {
                CGFloat findMxtur = ntwrkItem;
                
                
                CALayer *prvntRate = [CALayer layer];
                prvntRate.backgroundColor = [self.sprdRoom CGColor];
                findMxtur += ((_ftrDecreaseSave+self.simplNetworkRule)*suchSssn);
                prvntRate.frame = CGRectMake(0, findMxtur, tchVersionThen, _ftrDecreaseSave);
                [_contentView.layer addSublayer:prvntRate];
                
                UIButton *highRdfn = nvrnPage.button;
                [highRdfn setTitleColor:[self kindKulfiSkepticism:nvrnPage.buttonStyle] forState:UIControlStateNormal];
                highRdfn.frame = CGRectMake(0, findMxtur+_ftrDecreaseSave, tchVersionThen, self.simplNetworkRule);
                suchSssn ++;
            }
        }
        _contentView.frame = CGRectMake(10, PERFUNCTORILY_CONCOCTION, tchVersionThen, uslssNest+(_ftrDecreaseSave+self.simplNetworkRule)*_nlgConfigureHang.count);
        lngthEsotericLess = _contentView.frame.size.height;
    }
}

- (void)selfSisalMalevolent {
    CGFloat uslssNest = [self jstleOxidizeOdometer];
    if (_shiftSubscriptMode.count) {
        NSInteger nearCntn = _shiftSubscriptMode.count;
        uslssNest += (nearCntn*_sqrAppendixLoss + (nearCntn-1)*_ftrDecreaseSave + 15.0);
    }
    
    
    NSInteger prntutDrag = 0;
    twicEdge = 0;
    for (int i = 0; i < _nlgConfigureHang.count; i ++) {
        TrivialityGrammeModel *nvrnPage = _nlgConfigureHang[i];
        if (nvrnPage.buttonStyle == rsnCircuitMega) {
            if (lrnRespondLeft) {
                return;
            }else {
                lrnRespondLeft = YES;
            }
            
            prntutDrag = -1;
            twicEdge = i;
            continue;
        }
        
        CGFloat findMxtur = uslssNest;
        NSInteger suchSssn = i + prntutDrag;
        
        CALayer *prvntRate = [CALayer layer];
        prvntRate.backgroundColor = [self.sprdRoom CGColor];
        findMxtur += ((_ftrDecreaseSave+self.simplNetworkRule)*suchSssn);
        prvntRate.frame = CGRectMake(0, findMxtur, tchVersionThen, _ftrDecreaseSave);
        [_contentView.layer addSublayer:prvntRate];
        
        UIButton *highRdfn = nvrnPage.button;
        [highRdfn setTitleColor:[self kindKulfiSkepticism:nvrnPage.buttonStyle] forState:UIControlStateNormal];
        highRdfn.frame = CGRectMake(0, findMxtur+_ftrDecreaseSave, tchVersionThen, self.simplNetworkRule);
    }
    
    
    if (lrnRespondLeft) {
        _contentView.frame = CGRectMake(10, PERFUNCTORILY_CONCOCTION, tchVersionThen, uslssNest + (_ftrDecreaseSave + self.simplNetworkRule) * (_nlgConfigureHang.count - 1));
    } else {
        _contentView.frame = CGRectMake(10, PERFUNCTORILY_CONCOCTION, tchVersionThen, uslssNest + (_ftrDecreaseSave + self.simplNetworkRule) * _nlgConfigureHang.count);
    }
    
    
    if (lrnRespondLeft) {
        TrivialityGrammeModel *cmpsCase = _nlgConfigureHang[twicEdge];
        UIButton *highRdfn = cmpsCase.button;
        [highRdfn setTitleColor:[self kindKulfiSkepticism:cmpsCase.buttonStyle] forState:UIControlStateNormal];
        CGFloat ntrfrMach = PERFUNCTORILY_CONCOCTION + _contentView.bounds.size.height + 10 + self.simplNetworkRule + 10;
        highRdfn.frame = CGRectMake(10, ntrfrMach, tchVersionThen, self.simplNetworkRule);
        highRdfn.layer.masksToBounds = YES;
        highRdfn.backgroundColor = [[BrindlTransliterate typhnProspectusDoor] ughPeacekeepSunny:[UIColor whiteColor] andBginInvalidArea:[UIColor swipeScabiesNomad:@"#2c2c2f"]];
        highRdfn.layer.cornerRadius = _contentView.layer.cornerRadius;
        [highRdfn removeFromSuperview];
        [self addSubview:highRdfn];
    }
}

- (void)paperWelterThrive {
    if (_mngDecisionMuch) {
        if (_mdlCorrectPart) {
            if (_mdlCorrectPart.bottom == 0) {
                _mdlCorrectPart.bottom = 15.0;
            }
        }else {
            if (_mngDecisionMuch.bottom == 0) {
                _mngDecisionMuch.bottom = 15.0;
            }
        }
    }else {
        if (_mdlCorrectPart) {
            if (_mdlCorrectPart.top < 15.0) {
                _mdlCorrectPart.top = 15.0;
            }
            if (_mdlCorrectPart.bottom == 0) {
                _mdlCorrectPart.bottom = 15.0;
            }
        }else {
        }
    }
}

- (CGFloat)jstleOxidizeOdometer {
    CGFloat undrlnCard = 0;
    if (_mdlCorrectPart) {
        undrlnCard = CGRectGetMaxY(_smllIncrementTellLabel.frame) + _mdlCorrectPart.bottom;
    }else {
        if (_mngDecisionMuch) {
            undrlnCard = CGRectGetMaxY(_titleLabel.frame) + _mngDecisionMuch.bottom;
        }else {
            undrlnCard = 15.0;
        }
    }
    return undrlnCard;
}

- (UIColor *)kindKulfiSkepticism:(flsMainframeBoth)bootRdrct {
    if (bootRdrct == chrgAddressCore) {
        return _srcInverseSeekBtn;
    }else if (bootRdrct == rsnCircuitMega) {
        return _npckBracketKeepBtn;
    }else if (bootRdrct == pnlUppercaseLoop) {
        return _ccpyObserveToolBtn;
    }
    return nil;
}

-(void)fflineKulfiAutomate:(rsnIncorrectWish)dynmcSame {
    UIWindow *wlcmFlag = [[UIApplication sharedApplication] keyWindow];
    [self showInView:wlcmFlag preferredStyle:dynmcSame];
}

-(void)showInView:(UIView *)ncrsTone preferredStyle:(rsnIncorrectWish)dynmcSame {
    
    VpStairliftRolyView *fullCcurcy = [ncrsTone viewWithTag:321400];
    if (fullCcurcy) {
        [fullCcurcy excitableScullerSans];
    }
    
    self.tag = 321400;
    
    _plsClockwiseGrey = dynmcSame;
    if (dynmcSame == rtPictureVary) {
        tchVersionThen = 270;
        [ncrsTone addSubview:self];
        _contentView.center = self.center;
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 1.0;
        }];
        [self prprtAllegroScabies];
    }else if (dynmcSame == bttmDesktopTerm) {
        tchVersionThen = PLYHUS_REGULARIZE - 10 - 10;
        [ncrsTone addSubview:self];
        [UIView animateWithDuration:0.6 delay:0.0 usingSpringWithDamping:0.85 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
            CGRect sizeCnflct = self.contentView.frame;
            CGFloat prntutDrag = self->lrnRespondLeft ? self.simplNetworkRule+10 : 0;
            sizeCnflct.origin.y = PERFUNCTORILY_CONCOCTION - sizeCnflct.size.height - 10 - prntutDrag;
            self.contentView.frame = sizeCnflct;
            
            
            if (self->lrnRespondLeft) {
                TrivialityGrammeModel *cmpsCase = self.nlgConfigureHang[self->twicEdge];
                UIButton *highRdfn = cmpsCase.button;
                CGRect sizeCnflct = highRdfn.frame;
                sizeCnflct.origin.y = PERFUNCTORILY_CONCOCTION - sizeCnflct.size.height - 10;
                highRdfn.frame = sizeCnflct;
            }
            
            self.alpha = 1.0;
        } completion:nil];
    }
}

-(void)didMoveToSuperview {
    if (self.superview) {
        [self definitinTwillGodown];
        [self swankyBozoGodown];
        [self stylsDoorDipole];
        [self kindDoorUnrealized];
    }
}

- (void)prprtAllegroScabies {
    CAKeyframeAnimation *crruptView = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    crruptView.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.05, 1.05, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)]];
    crruptView.keyTimes = @[ @0, @0.5, @1 ];
    crruptView.fillMode = kCAFillModeForwards;
    crruptView.removedOnCompletion = NO;
    crruptView.duration = .3;
    
    [_contentView.layer addAnimation:crruptView forKey:REMAND_WLESS((@[@436, @425, @432, @440, @386, @429, @422, @435, @437]))];
}

- (void)blletinDipoleQuicker {
    CAKeyframeAnimation *crruptView = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    crruptView.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.95, 0.95, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.8, 0.8, 1)]];
    crruptView.keyTimes = @[ @0, @0.5, @1 ];
    crruptView.fillMode = kCAFillModeRemoved;
    crruptView.duration = .2;
    
    [_contentView.layer addAnimation:crruptView forKey:REMAND_WLESS((@[@421, @426, @436, @430, @426, @436, @436, @386, @429, @422, @435, @437]))];
}

- (void)excitableScullerSans {
    if (_plsClockwiseGrey == rtPictureVary) {
        [self blletinDipoleQuicker];
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 0;
        }];
        [UIView animateWithDuration:0.2 animations:^{
            self.contentView.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }else if(_plsClockwiseGrey == bttmDesktopTerm) {
        [UIView animateWithDuration:0.24 delay:0.08 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.alpha = 0.0;
            
            CGRect sizeCnflct = self.contentView.frame;
            sizeCnflct.origin.y = PERFUNCTORILY_CONCOCTION;
            self.contentView.frame = sizeCnflct;
            if (self->lrnRespondLeft) {
                TrivialityGrammeModel *cmpsCase = self.nlgConfigureHang[self->twicEdge];
                UIButton *highRdfn = cmpsCase.button;
                CGRect sizeCnflct = highRdfn.frame;
                sizeCnflct.origin.y = PERFUNCTORILY_CONCOCTION + 10 + self.simplNetworkRule + 10;
                highRdfn.frame = sizeCnflct;
            }
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}

- (void)ughAllegroAwake:(UIButton *)mnfstMemo {
    NSInteger suchSssn = mnfstMemo.tag-1000;
    
    TrivialityGrammeModel *memoPnn = _nlgConfigureHang[suchSssn];
    dpndContactTrimBlock readRplc = memoPnn.actionHandler;
    if (readRplc) readRplc();
    [self excitableScullerSans];
}

- (void)airwayLashGodown:(UITapGestureRecognizer *)modeCnfgur {
    if (_dilgAdvanceHereView.integerValue == 0) {
        if (_plsClockwiseGrey == rtPictureVary) {
        }else if (_plsClockwiseGrey == bttmDesktopTerm) {
            [self excitableScullerSans];
        }
    }else if (_dilgAdvanceHereView.integerValue == 1) {
        [self excitableScullerSans];
    }else if (_dilgAdvanceHereView.integerValue == 2) {
    }
}

- (void)seizeGoitreClock:(id)mnfstMemo {
    [mnfstMemo setBackgroundColor:[[UIColor swipeScabiesNomad:@"#cbcdcb"] colorWithAlphaComponent:0.8]];
}

- (void)bedlamMenswearTwill:(UIButton *)mnfstMemo {
    NSInteger suchSssn = mnfstMemo.tag - 1000;
    if (suchSssn == twicEdge) {
        [mnfstMemo setBackgroundColor:[UIColor whiteColor]];
    }else {
        [mnfstMemo setBackgroundColor:[UIColor clearColor]];
    }
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)saleClckws shouldReceiveTouch:(UITouch *)mprtntExit {
    CGPoint gigaXtrct = [mprtntExit locationInView:self];
    if (CGRectContainsPoint(_contentView.frame, gigaXtrct)) {
        return NO;
    }
    return YES;
}

-(void)setXtndInvalidSave:(BOOL)thrughFind {
    _dilgAdvanceHereView = thrughFind ? @(1) : @(2);
}

-(void)saintLastEnliven:(NSNotification *)hugeVrsn {
    NSDictionary * rqustLine = [hugeVrsn userInfo];
    CGFloat helpVrsn = [rqustLine[REMAND_WLESS((@[@406, @394, @396, @422, @442, @419, @432, @418, @435, @421, @386, @431, @426, @430, @418, @437, @426, @432, @431, @389, @438, @435, @418, @437, @426, @432, @431, @406, @436, @422, @435, @394, @431, @423, @432, @396, @422, @442]))] floatValue];
    CGRect portPrmnnt = [rqustLine[REMAND_WLESS((@[@406, @394, @396, @422, @442, @419, @432, @418, @435, @421, @387, @432, @438, @431, @421, @436, @406, @436, @422, @435, @394, @431, @423, @432, @396, @422, @442]))] CGRectValue];
    CGFloat ncssryLess = PERFUNCTORILY_CONCOCTION - CGRectGetHeight(portPrmnnt);
    
    CGRect areaCntury = [[rqustLine objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    if (areaCntury.size.height <=0) {
        
        return;
    }
    
    CGFloat unshftFlag = CGRectGetMaxY(_contentView.frame)+(5); 
    CGFloat prntutDrag = unshftFlag - ncssryLess;
    if (prntutDrag > 0) {
        [UIView animateWithDuration:helpVrsn animations:^{
            CGRect sizeCnflct = self.contentView.frame;
            sizeCnflct.origin.y -= prntutDrag;
            self.contentView.frame = sizeCnflct;
        }];
    }
}

-(void)racsModerationClock:(NSNotification *)hugeVrsn {
    NSDictionary * rqustLine = [hugeVrsn userInfo];
    CGFloat helpVrsn = [rqustLine[REMAND_WLESS((@[@406, @394, @396, @422, @442, @419, @432, @418, @435, @421, @386, @431, @426, @430, @418, @437, @426, @432, @431, @389, @438, @435, @418, @437, @426, @432, @431, @406, @436, @422, @435, @394, @431, @423, @432, @396, @422, @442]))] floatValue];
    @weakify(self);
    [UIView animateWithDuration:helpVrsn animations:^{
        @strongify(self);
        self.contentView.center = self.center;
    }];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (UIColor *)sprdRoom{
    if (!_sprdRoom) {
        _sprdRoom = [[BrindlTransliterate typhnProspectusDoor] ughPeacekeepSunny:[UIColor swipeScabiesNomad:@"#36393d"] andBginInvalidArea:[UIColor swipeScabiesNomad:@"#36393d"]];
    }
    return _sprdRoom;
}

@end
