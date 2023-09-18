







#import "RadicatDubiousTrollView.h"
#import "NdrdonPerishedManager.h"

@interface RadicatDubiousTrollView ()

@property (nonatomic, strong) UILabel *nlikIncreaseTrim;
@property (nonatomic, strong) UILabel *clickAdvanceVary;
@property (nonatomic, strong) UIImageView *mdlHerculesPastImg;
@property (nonatomic, strong) UIButton *tdyThroughOnceBtn;
@property (nonatomic, strong) FryStraightenMangyModel *model;
@property (nonatomic, copy) tpicStorageWaitBlock doneBlock;

@end

@implementation RadicatDubiousTrollView

- (instancetype)initWithFrame:(CGRect)trunctLoss {
    if (self = [super initWithFrame:trunctLoss]) {
        [self waftGropeSojourn];
    }
    return self;
}

- (void)waftGropeSojourn {
    
    self.nlikIncreaseTrim = [NdrdonPerishedManager bldlettFirthCaramel];
    [self addSubview:self.nlikIncreaseTrim];
    [self.nlikIncreaseTrim mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).offset(10);
        make.centerY.mas_equalTo(self);
    }];
    
    self.clickAdvanceVary = [NdrdonPerishedManager theaterOleanderKulfi];
    [self addSubview:self.clickAdvanceVary];
    [self.clickAdvanceVary mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.top.equalTo(self.nlikIncreaseTrim.mas_bottom);
        make.bottom.mas_lessThanOrEqualTo(0);
        make.right.mas_lessThanOrEqualTo(-30);
    }];
    
    self.mdlHerculesPastImg = [NdrdonPerishedManager favelaQuickerSpamm];
    [self addSubview:self.mdlHerculesPastImg];
    [self.mdlHerculesPastImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self).inset(10);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(10, 16));
    }];
    
    self.tdyThroughOnceBtn = [NdrdonPerishedManager swipeOleanderGoitre];
    [self addSubview:self.tdyThroughOnceBtn];
    [self.tdyThroughOnceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}


- (void)peppyDoorConnection:(FryStraightenMangyModel *)memoPnn andFigrMistakeTest:(tpicStorageWaitBlock)turnPrduct {
    if (memoPnn.infoType == rndUselessWork) {
        self.clickAdvanceVary.hidden = NO;
        self.clickAdvanceVary.text = memoPnn.name2;
        [self.nlikIncreaseTrim mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_lessThanOrEqualTo(10);
            make.right.mas_lessThanOrEqualTo(-30);
            make.height.mas_equalTo(30);
        }];
    } else {
        self.clickAdvanceVary.hidden = YES;
        [self.nlikIncreaseTrim mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self).offset(10);
            make.centerY.mas_equalTo(self);
        }];
    }
    self.nlikIncreaseTrim.text = LOCKDOWN_BOGAN(memoPnn.name).narcisssTwillMouldy;
    self.model = memoPnn;
    self.nlikIncreaseTrim.hidden = self.tdyThroughOnceBtn.hidden = self.mdlHerculesPastImg.hidden = NO;
    self.mdlHerculesPastImg.hidden = !memoPnn.ccssInfiniteMind;
    self.doneBlock = turnPrduct;
    if(memoPnn.ccssInfiniteMind){
        [self.tdyThroughOnceBtn addTarget:self action:@selector(gadgetBoozerSunny) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [self.tdyThroughOnceBtn removeTarget:self action:@selector(gadgetBoozerSunny) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)waftBurgherSinuous{
    self.nlikIncreaseTrim.hidden = self.tdyThroughOnceBtn.hidden = self.mdlHerculesPastImg.hidden = YES;
}

- (void)gadgetBoozerSunny{
    if(self.doneBlock){
        self.doneBlock(self.model, dcidReplicateItem);
    }
}

@end