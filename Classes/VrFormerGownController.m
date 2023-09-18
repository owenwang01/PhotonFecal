







#import "VrFormerGownController.h"
#import "SothastrnDumdumManager.h"

@interface VrFormerGownController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *hbitWideView;
@property (nonatomic, strong) UIView *twicEnvironCard;
@property (nonatomic, weak, nullable) MSBornPlume *player;
@property (nonatomic, strong) UILabel *hightEmphasizeEach;
@property (nonatomic, strong) UIButton *thghInsteadRootBtn;
@property (nonatomic, strong) UIView *bginSimilarSame;
@property (nonatomic, strong) UITableView *srisReserveSaleTable;
@property (nonatomic, strong) NSArray *clrRuntimeTaskArr;
@property (nonatomic, strong) NSArray *npckLatencyFastImage;

@end

@implementation VrFormerGownController
@synthesize restarted = _restarted;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ecrClockLash];
    self.clrRuntimeTaskArr = @[MUNICIPAL_INDISCRETION(174), MUNICIPAL_INDISCRETION(467)];
    self.npckLatencyFastImage = @[ENCOURAGE_FREEHOLD(104), ENCOURAGE_FREEHOLD(173)];
}

- (void)ecrClockLash {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.hbitWideView = [SothastrnDumdumManager peppyDoorInsane];
    [self.view addSubview:self.hbitWideView];
    
    self.twicEnvironCard = [SothastrnDumdumManager kraalSatireTested];
    [self.hbitWideView addSubview:self.twicEnvironCard];
    
    self.hightEmphasizeEach = [SothastrnDumdumManager prizefightDoomSisal];
    [self.hbitWideView addSubview:self.hightEmphasizeEach];
    
    self.thghInsteadRootBtn = [SothastrnDumdumManager blndRemovableTosser];
    [self.hbitWideView addSubview:self.thghInsteadRootBtn];
    
    self.bginSimilarSame = [SothastrnDumdumManager stylsTankerSans];
    [self.hbitWideView addSubview:self.bginSimilarSame];
    
    self.srisReserveSaleTable = [SothastrnDumdumManager rsnClockwiseDateView:self];
    [self.hbitWideView addSubview:self.srisReserveSaleTable];
    
    [self.hbitWideView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.offset(0);
        make.width.mas_equalTo(360);
    }];
    
    [self.twicEnvironCard mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.hightEmphasizeEach mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.twicEnvironCard).offset(50);
        make.leading.mas_equalTo(self.twicEnvironCard).offset(50);
        make.size.mas_equalTo(CGSizeMake(70, 19));
    }];
    
    [self.thghInsteadRootBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.twicEnvironCard).inset(38);
        make.centerY.equalTo(self.hightEmphasizeEach);
        make.size.mas_equalTo(CGSizeMake(42, 42));
    }];
    
    [self.bginSimilarSame mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.hightEmphasizeEach);
        make.trailing.mas_equalTo(self.twicEnvironCard);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(self.hightEmphasizeEach.mas_bottom).offset(15);
    }];
    
    [self.srisReserveSaleTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.hightEmphasizeEach);
        make.top.mas_equalTo(self.bginSimilarSame.mas_bottom).offset(24);
        make.trailing.mas_equalTo(self.twicEnvironCard).inset(24);
        make.bottom.mas_equalTo(self.twicEnvironCard).inset(41);
    }];
}






- (void)restartControlLayer {
    _restarted = YES;
    if ( self.player.isFurry ) [self.player needHiddenStatusBar];
    ms_view_makeAppear(self.plume_controlView, YES);
    ms_view_makeAppear(self.hbitWideView, YES);
}






- (void)exitControlLayer {
    _restarted = NO;
    
    ms_view_makeDisappear(self.hbitWideView, YES);
    ms_view_makeDisappear(self.plume_controlView, YES, ^{
        if ( !self->_restarted ) [self.plume_controlView removeFromSuperview];
    });
}

- (UIView *)plume_controlView {
    return self.view;
}




- (void)installedControlViewToPlume:(__kindof MSBornPlume *)machSubjct {
    _player = machSubjct;
    
    if ( self.view.layer.needsLayout ) {
        ms_view_initializes(self.hbitWideView);
    }
    
    ms_view_makeDisappear(self.hbitWideView, NO);
}




- (void)controlLayerNeedAppear:(__kindof MSBornPlume *)machSubjct {}




- (void)controlLayerNeedDisappear:(__kindof MSBornPlume *)machSubjct {}




- (BOOL)plume:(__kindof MSBornPlume *)machSubjct gestureRecognizerShouldTrigger:(MSCharmGestureType)ncludGive location:(CGPoint)cpturThen {
    if ( ncludGive == MSCharmGestureType_SingleTap ) {
        if ( !CGRectContainsPoint(self.hbitWideView.frame, cpturThen) ) {
            if ( [self.delegate respondsToSelector:@selector(lipstickLashViand:)] ) {
                [self.delegate lipstickLashViand:self];
            }
        }
    }
    return NO;
}




- (BOOL)canTriggerRotationOfPlume:(__kindof MSBornPlume *)machSubjct {
    return NO;
}


- (NSInteger)tableView:(UITableView *)fullMult numberOfRowsInSection:(NSInteger)rflctShut {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)fullMult cellForRowAtIndexPath:(NSIndexPath *)alsoRbuld {
    MckWilcoVariableCell *leftXclusv = [fullMult dequeueReusableCellWithIdentifier:NSStringFromClass([MckWilcoVariableCell class]) forIndexPath:alsoRbuld];
    leftXclusv.selectionStyle = UITableViewCellSelectionStyleNone;
    leftXclusv.btinFourscoreVice = self.clrRuntimeTaskArr[alsoRbuld.row];
    leftXclusv.lvCorrectPort = self.npckLatencyFastImage[alsoRbuld.row];
    return leftXclusv;
}

- (void)tableView:(UITableView *)fullMult didSelectRowAtIndexPath:(NSIndexPath *)alsoRbuld {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sppliantInfectCorked:)]) {
        [self.delegate sppliantInfectCorked:alsoRbuld.row];
    }
}


- (void)ughKulfiScramble:(UIButton *)mnfstMemo {
    mnfstMemo.selected = !mnfstMemo.selected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(tenderftJuristTwill:)]) {
        [self.delegate tenderftJuristTwill:mnfstMemo.selected];
    }
}

@end
