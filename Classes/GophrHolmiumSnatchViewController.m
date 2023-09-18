







#import "GophrHolmiumSnatchViewController.h"
#import "VrZonkedGunshotManager.h"

@interface GophrHolmiumSnatchViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView *hbitWideView;
@property (nonatomic, strong) UIView *twicEnvironCard;
@property (nonatomic, weak, nullable) MSPlume *player;
@property (nonatomic, strong) UIImageView *fifthTaskImg;
@property (nonatomic, strong) UILabel *hightEmphasizeEach;
@property (nonatomic, strong) UIButton *tdyThroughOnceBtn;
@property (nonatomic, strong) UIView *bginSimilarSame;
@property (nonatomic, strong) UITableView *srisReserveSaleTable;
@end

@implementation GophrHolmiumSnatchViewController
@synthesize restarted = _restarted;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ecrClockLash];
}

- (void)ecrClockLash {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.hbitWideView = [VrZonkedGunshotManager peppyDoorInsane];
    [self.view addSubview:self.hbitWideView];
    
    self.twicEnvironCard = [VrZonkedGunshotManager kraalSatireTested];
    [self.hbitWideView addSubview:self.twicEnvironCard];
    
    self.hightEmphasizeEach = [VrZonkedGunshotManager prizefightDoomSisal];
    [self.hbitWideView addSubview:self.hightEmphasizeEach];
    
    self.fifthTaskImg = [VrZonkedGunshotManager jstleAmoebaHealer];
    [self.hbitWideView addSubview:self.fifthTaskImg];
    
    self.tdyThroughOnceBtn = [VrZonkedGunshotManager swipeOleanderGoitre];
    [self.tdyThroughOnceBtn addTarget:self action:@selector(bmmerSecularQuicken) forControlEvents:UIControlEventTouchUpInside];
    [self.hbitWideView addSubview:self.tdyThroughOnceBtn];
    
    self.bginSimilarSame = [VrZonkedGunshotManager stylsTankerSans];
    [self.hbitWideView addSubview:self.bginSimilarSame];
    
    self.srisReserveSaleTable = [VrZonkedGunshotManager rsnClockwiseDateView:self];
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
        make.leading.mas_equalTo(self.twicEnvironCard).offset(75);
        make.height.mas_equalTo(21);
    }];
    
    [self.fifthTaskImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.hightEmphasizeEach);
        make.trailing.mas_equalTo(self.hightEmphasizeEach.mas_leading).inset(10);
        make.size.mas_equalTo(CGSizeMake(16, 16));
    }];
    
    [self.tdyThroughOnceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.fifthTaskImg);
        make.top.bottom.trailing.mas_equalTo(self.hightEmphasizeEach);
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
            if ( [self.delegate respondsToSelector:@selector(sellRemovablePriorCell:)] ) {
                [self.delegate sellRemovablePriorCell:self];
            }
        }
    }
    return NO;
}




- (BOOL)canTriggerRotationOfPlume:(__kindof MSBornPlume *)machSubjct {
    return NO;
}


- (void)bmmerSecularQuicken {
    [_player.switcher switchControlLayerForIdentifier:102];
    [_player controlLayerNeedAppear];
}


- (NSInteger)tableView:(UITableView *)fullMult numberOfRowsInSection:(NSInteger)rflctShut {
    return self.subtitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)fullMult cellForRowAtIndexPath:(NSIndexPath *)alsoRbuld {
    BasqScathElanCell *leftXclusv = [fullMult dequeueReusableCellWithIdentifier:NSStringFromClass([BasqScathElanCell class]) forIndexPath:alsoRbuld];
    leftXclusv.selectionStyle = UITableViewCellSelectionStyleNone;
    BrindlWestSubtendModel *memoPnn = self.subtitles[alsoRbuld.row];
    leftXclusv.lpsKeywordBlue = memoPnn.mnthExtractRate;
    if (memoPnn.isSelected) {
        [leftXclusv clleageLastEnliven:YES];
    } else {
        [leftXclusv clleageLastEnliven:NO];
    }
    
    return leftXclusv;
}

- (void)tableView:(UITableView *)fullMult didSelectRowAtIndexPath:(NSIndexPath *)alsoRbuld {
    for (BrindlWestSubtendModel *memoPnn in self.subtitles) {
        memoPnn.isSelected = NO;
    }
    BrindlWestSubtendModel *memoPnn = self.subtitles[alsoRbuld.row];
    memoPnn.isSelected = YES;
    [self.srisReserveSaleTable reloadData];
    if (self.delegate && [self.delegate respondsToSelector:@selector(jstleHauteurFollower:)]) {
        [self.delegate jstleHauteurFollower:memoPnn];
    }
}

@end
