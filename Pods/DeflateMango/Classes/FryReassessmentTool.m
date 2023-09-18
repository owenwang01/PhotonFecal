






#import "FryReassessmentTool.h"
#import <Toast/Toast.h>

@interface FryReassessmentTool ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) CSToastStyle *psPredictEven;
@property (nonatomic, strong) UIView *prntSessionHelpView;
@end

@implementation FryReassessmentTool

+ (instancetype)sharedInstance{
    static FryReassessmentTool *slUnderlineHard;
    static dispatch_once_t dmgProgramMany;
    dispatch_once(&dmgProgramMany, ^{
        slUnderlineHard = [[FryReassessmentTool alloc] init];
    });
    return slUnderlineHard;
}

- (instancetype)init{
    self = [super init];
    if(self){
        CSToastStyle *sideRfrsh = [[CSToastStyle alloc] initWithDefaultStyle];
        sideRfrsh.backgroundColor = [UIColor grayColor];
        sideRfrsh.messageColor = [UIColor whiteColor];

        self.psPredictEven = sideRfrsh;
    }
    return self;
}

- (UIView *)prntSessionHelpView{
    if(!_prntSessionHelpView){
        _prntSessionHelpView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, PLYHUS_REGULARIZE, PERFUNCTORILY_CONCOCTION)];
        _prntSessionHelpView.userInteractionEnabled = YES;
        _prntSessionHelpView.backgroundColor = [[UIColor swipeScabiesNomad:@"#000000"] colorWithAlphaComponent:0.3];
        UITapGestureRecognizer *modeCnfgur = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(airwayLashGodown:)];
        modeCnfgur.delegate = self;
        [_prntSessionHelpView addGestureRecognizer:modeCnfgur];
    }
    return _prntSessionHelpView;
}

- (void)airwayLashGodown:(UITapGestureRecognizer *)mnfstMemo{
    
}

+ (void)masterJuristSojourn{
    UIWindow *wlcmFlag = [[UIApplication sharedApplication] keyWindow];
    [wlcmFlag addSubview:[FryReassessmentTool sharedInstance].prntSessionHelpView];
    [[FryReassessmentTool sharedInstance].prntSessionHelpView makeToastActivity:CSToastPositionCenter];
}

+ (void)arsnHauteurAutomate{
    UIWindow *wlcmFlag = [[UIApplication sharedApplication] keyWindow];
    [wlcmFlag hideToastActivity];
    [wlcmFlag hideAllToasts];
    [[FryReassessmentTool sharedInstance].prntSessionHelpView hideToastActivity];
    [[FryReassessmentTool sharedInstance].prntSessionHelpView hideAllToasts];
    [[FryReassessmentTool sharedInstance].prntSessionHelpView removeFromSuperview];
}

+ (void)tambrTosserAmoeba:(NSString *)caseRnstt{
    CAShapeLayer *sameMphsz = [CAShapeLayer layer];
    sameMphsz.frame = CGRectMake((120-10*4-10*(4-1))*0.5, 30, 10, 10);
    sameMphsz.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 10, 10)].CGPath;
    sameMphsz.fillColor = [UIColor orangeColor].CGColor;
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 0)];
    scale.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 0)];
    scale.autoreverses = YES;
    scale.duration = 0.5;
    scale.repeatCount = HUGE;
    [sameMphsz addAnimation:scale forKey:@"scaleAnimation"];
    
    CAReplicatorLayer *safeFmlr = [CAReplicatorLayer layer];
    safeFmlr.instanceDelay = 0.2;
    safeFmlr.instanceCount = 4;
    safeFmlr.instanceTransform = CATransform3DMakeTranslation(20, 0, 0); 
    safeFmlr.frame = CGRectMake(0, 0, 10, 10);
    [safeFmlr addSublayer:sameMphsz];
    
    UIView *pymntLast = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
    pymntLast.tag = 3032213;
    pymntLast.layer.cornerRadius = 10.0f;
    pymntLast.layer.masksToBounds = YES;
    pymntLast.center = CGPointMake(PLYHUS_REGULARIZE*0.5, PERFUNCTORILY_CONCOCTION*0.5);
    pymntLast.backgroundColor = [UIColor whiteColor];
    [pymntLast.layer addSublayer:safeFmlr];
    if(![NSString saintSansPictogram:caseRnstt]){
        UILabel *clckwsVice = [[UILabel alloc] initWithFrame:CGRectMake(0, 120-30-20, 120, 30)];
        if (@available(iOS 8.2, *)) {
            clckwsVice.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightMedium];
        } else {
            clckwsVice.font = [UIFont boldSystemFontOfSize:14.0f];
        }
        clckwsVice.textAlignment = NSTextAlignmentCenter;
        clckwsVice.text = LOCKDOWN_BOGAN(caseRnstt).narcisssTwillMouldy;
        clckwsVice.textColor = [UIColor swipeScabiesNomad:@"#ff9d35"];
        [pymntLast addSubview:clckwsVice];
    }
    [[FryReassessmentTool sharedInstance].prntSessionHelpView addSubview:pymntLast];
    UIWindow *wlcmFlag = [[UIApplication sharedApplication] keyWindow];
    [wlcmFlag addSubview:[FryReassessmentTool sharedInstance].prntSessionHelpView];
}

+ (void)ngrateflUncoolGooey:(NSString *)bsltMega andSinglExhaustRoll:(NSURL *)thrughYear duration:(NSTimeInterval)helpVrsn{
    CGFloat scanMgntc = 120.0f;
    UIView *nquryRead = [[UIView alloc] initWithFrame:CGRectMake((PLYHUS_REGULARIZE-scanMgntc)*0.5, (PERFUNCTORILY_CONCOCTION-scanMgntc)*0.55, scanMgntc, scanMgntc)];
    nquryRead.layer.cornerRadius = 5.0f;
    nquryRead.layer.masksToBounds = YES;
    nquryRead.backgroundColor = [UIColor swipeScabiesNomad:@"#303242"];
    UIImageView *lossStrc = [[UIImageView alloc] init];
    [lossStrc sd_setImageWithURL:thrughYear];
    lossStrc.frame = CGRectMake((scanMgntc - 35) * 0.5, 15, 35, 35);
    [nquryRead addSubview:lossStrc];
    UILabel *mnfstGiga = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(lossStrc.frame) + 5, scanMgntc - 20, scanMgntc - CGRectGetMaxY(lossStrc.frame) - 20)];
    mnfstGiga.textAlignment = NSTextAlignmentCenter;
    mnfstGiga.numberOfLines = 0;
    mnfstGiga.textColor = [UIColor whiteColor];
    mnfstGiga.lineBreakMode = NSLineBreakByWordWrapping;
    mnfstGiga.text = bsltMega;
    [nquryRead addSubview:mnfstGiga];
    UIWindow *wlcmFlag = [[UIApplication sharedApplication] keyWindow];
    [wlcmFlag showToast:nquryRead duration:helpVrsn position:CSToastPositionCenter completion:^(BOOL didTap) {}];
}

+ (void)stylsAmoebaPalatal{
    UIView *pymntLast = [[FryReassessmentTool sharedInstance].prntSessionHelpView viewWithTag:3032213];
    if(pymntLast.superview){
        [pymntLast removeFromSuperview];
    }
    [[FryReassessmentTool sharedInstance].prntSessionHelpView removeFromSuperview];
}

+ (void)favelaLashMalevolent:(NSString *)bsltMega{
    UIWindow *wlcmFlag = [[UIApplication sharedApplication] keyWindow];
    [self favelaLashMalevolent:bsltMega toView:wlcmFlag];
}

+ (void)favelaLashMalevolent:(NSString *)bsltMega toView:(UIView *)ncrsTone{
    [ncrsTone makeToast:bsltMega duration:2.0 position:CSToastPositionCenter style:[FryReassessmentTool sharedInstance].psPredictEven];
}

+(void)show:(UIAlertController*)meanSmlr{
    UIWindow *wlcmFlag = [[UIApplication sharedApplication] keyWindow];;
    UIViewController *copyLnkg = wlcmFlag.rootViewController.presentedViewController;
    if (copyLnkg) {
        while (1) {
            UIViewController *pymntPair = [FryReassessmentTool nerlgyRemedyHealer:copyLnkg];
            if (pymntPair) {
                copyLnkg = pymntPair;
            }else{
                break;
            }
        }
        [copyLnkg presentViewController:meanSmlr animated:YES completion:nil];
    } else {
        [wlcmFlag.rootViewController presentViewController:meanSmlr animated:YES completion:nil];
    }
}

+(UIViewController *)nerlgyRemedyHealer:(UIViewController *)copyLnkg{
    return copyLnkg.presentedViewController;
}

@end