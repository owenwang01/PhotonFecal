







#import "NdrdonCircumferenceViewController.h"
#import "VrFormerGownController.h"
#import "AirflowDeftVigourViewController.h"
#import "VrStairliftInfluxViewController.h"
#import "GophrHolmiumSnatchViewController.h"
#import "LayttEngagedBanditoViewController.h"
#import "PrognitorMesmericManager.h"

@interface NdrdonCircumferenceViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UILabel *hightEmphasizeEach;
@property (nonatomic, strong) UIButton *thghInsteadRootBtn;
@property (nonatomic, strong) UIView *bginSimilarSame;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *njyHome;
@property (nonatomic, strong) NSArray *clrRuntimeTaskArr;
@property (nonatomic, strong) NSArray *npckLatencyFastImage;

@end

@implementation NdrdonCircumferenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ecrClockLash];
    self.clrRuntimeTaskArr = @[MUNICIPAL_INDISCRETION(174), MUNICIPAL_INDISCRETION(467)];
    self.npckLatencyFastImage = @[ENCOURAGE_FREEHOLD(104), ENCOURAGE_FREEHOLD(173)];
    
    self.title = MUNICIPAL_INDISCRETION(251);
    self.view.backgroundColor = [UIColor swipeScabiesNomad:@"#242235"];
}

- (void)nerlgyLassMouldy{
    [super nerlgyLassMouldy];
    [self peafwlThriveCorked:[UIColor swipeScabiesNomad:@"#242235"]];
    self.navigationItem.leftBarButtonItem = [PrognitorMesmericManager racsAnointLash:self andRflwCarouselHost:NO];
}

- (void)nexpldedMouldyGooey{
    [self waftPalatalDipole];
}

- (void)ecrClockLash {
    
    self.bginSimilarSame = [PrognitorMesmericManager stylsTankerSans];
    [self.view addSubview:self.bginSimilarSame];
    
    self.hightEmphasizeEach = [PrognitorMesmericManager prizefightDoomSisal];
    [self.view addSubview:self.hightEmphasizeEach];
    
    self.thghInsteadRootBtn = [PrognitorMesmericManager blndRemovableTosser];
    [self.thghInsteadRootBtn addTarget:self action:@selector(lcbrateSaneOverboard:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.thghInsteadRootBtn];
    
    self.tableView = [PrognitorMesmericManager rsnClockwiseDateView:self];
    [self.view addSubview:self.tableView];
    
    self.njyHome = [PrognitorMesmericManager theaterShowerHealer];
    [self.njyHome addTarget:self action:@selector(waftPalatalDipole) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.njyHome];
    
    [self.bginSimilarSame mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(HEATHLAND_UNCOORDINATED);
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    [self.hightEmphasizeEach mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bginSimilarSame.mas_bottom).offset(22);
        make.left.mas_equalTo(16);
    }];
    [self.thghInsteadRootBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.inset(12);
        make.centerY.equalTo(self.hightEmphasizeEach);
        make.size.mas_equalTo(CGSizeMake(42, 42));
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(12);
        make.top.mas_equalTo(self.hightEmphasizeEach.mas_bottom).offset(12);
        make.trailing.mas_equalTo(self.view).inset(16);
        make.bottom.equalTo(self.njyHome.mas_top);
    }];
    [self.njyHome mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
    }];
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

- (CGFloat)tableView:(UITableView *)fullMult heightForRowAtIndexPath:(NSIndexPath *)alsoRbuld{
    return 50.0f;
}

- (void)tableView:(UITableView *)fullMult didSelectRowAtIndexPath:(NSIndexPath *)alsoRbuld {
    if(alsoRbuld.row == 0){
        VrStairliftInfluxViewController *nywhrMind = [[VrStairliftInfluxViewController alloc] init];
        nywhrMind.player = self.player;
        CZECH_MIDGET
        nywhrMind.sgSpecificRuleBlock = ^(NSInteger type) {
            if([phrsBackwardTeam.glncAlthoughSame respondsToSelector:@selector(barrenRemovableSans:)]){
                [phrsBackwardTeam.glncAlthoughSame barrenRemovableSans:type];
            }
        };
        [self.navigationController pushViewController:nywhrMind animated:YES];
    }else if(alsoRbuld.row == 1){
        AirflowDeftVigourViewController *mstkFlow = [[AirflowDeftVigourViewController alloc] init];
        mstkFlow.subtitles = self.subtitles;
        CZECH_MIDGET
        mstkFlow.thghCompareCodeBlock = ^(BrindlWestSubtendModel * _Nonnull model) {
            if([phrsBackwardTeam.delegate respondsToSelector:@selector(jstleHauteurFollower:)]){
                [phrsBackwardTeam.delegate jstleHauteurFollower:model];
            }
        };
        [self.navigationController pushViewController:mstkFlow animated:YES];
    }
}


- (void)schlhseLassPederast:(UISwitch *)mnfstMemo{
    mnfstMemo.selected = !mnfstMemo.selected;
}

- (void)waftPalatalDipole{
    [self.navigationController willMoveToParentViewController:nil];
    [self.navigationController.view removeFromSuperview];
    [self.navigationController removeFromParentViewController];
}


- (void)lcbrateSaneOverboard:(UIButton *)mnfstMemo {
    mnfstMemo.selected = !mnfstMemo.selected;
    if (self.srchAddressHugeBlock) {
        self.srchAddressHugeBlock(mnfstMemo.selected);
    }
}

@end