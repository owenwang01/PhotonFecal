







#import "MckVisuallyApronView.h"
#import "FryIllywhackerVainlyCell.h"
#import "RadicatDubiousTrollView.h"
#import "NdrdonDefeatistElanCell.h"
#import "BlondCunnilusElan.h"
#import "SothastrnAitchCraterModel.h"
#import "VpPenthouseForthcomModel.h"
#import "SondalikBalletModel.h"

@interface MckVisuallyApronView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *tchRearrangeWarn;
@property (nonatomic, strong) SothastrnAitchCraterModel *mltiYearModel;

@end

@implementation MckVisuallyApronView

- (instancetype)initWithFrame:(CGRect)trunctLoss {
    if (self = [super initWithFrame:trunctLoss]) {
        [self selfKulfiKerosene];
    }
    
    return self;
}

- (void)selfKulfiKerosene {
    UICollectionViewFlowLayout *menuSubjct = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *cmbnAway = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:menuSubjct];
    cmbnAway.backgroundColor = [UIColor clearColor];
    
    [cmbnAway registerClass:[FryIllywhackerVainlyCell class] forCellWithReuseIdentifier:NSStringFromClass([FryIllywhackerVainlyCell class])];
    
    [cmbnAway registerClass:[RadicatDubiousTrollView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([RadicatDubiousTrollView class])];
    
    [cmbnAway registerClass:[NdrdonDefeatistElanCell class] forCellWithReuseIdentifier:NSStringFromClass([NdrdonDefeatistElanCell class])];
    
    cmbnAway.delegate = self;
    cmbnAway.dataSource = self;
    cmbnAway.alwaysBounceVertical = YES;
    [self addSubview:cmbnAway];
    self.tchRearrangeWarn = cmbnAway;
    [self.tchRearrangeWarn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)peppyDoorConnection:(SothastrnAitchCraterModel *)wordCnvrt{
    self.mltiYearModel = wordCnvrt;
    
    [self.tchRearrangeWarn reloadData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)cmbnAway{
    if(!self.mltiYearModel){
        return 0;
    }
    return self.mltiYearModel.simplSnapshotLoss.count + 1;
}

- (NSInteger)collectionView:(UICollectionView *)cmbnAway numberOfItemsInSection:(NSInteger)rflctShut{
    if(rflctShut == 0){
        return 1;
    }else if (rflctShut == 1){
        return self.mltiYearModel.simplSnapshotLoss.count;
    }
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)cmbnAway cellForItemAtIndexPath:(NSIndexPath *)alsoRbuld {
    if (alsoRbuld.section == 0) {
        
        FryIllywhackerVainlyCell *leftXclusv = [cmbnAway dequeueReusableCellWithReuseIdentifier:NSStringFromClass([FryIllywhackerVainlyCell class]) forIndexPath:alsoRbuld];
        [leftXclusv peppyDoorConnection:self.mltiYearModel];
        leftXclusv.dsignKeyboardCoreBlock = self.dsignKeyboardCoreBlock;
        CZECH_MIDGET
        leftXclusv.mdlSemicolonOmitBlock = ^(BOOL hightDynamicEdge) {
            phrsBackwardTeam.mltiYearModel.ncdContactBack = hightDynamicEdge;
            [phrsBackwardTeam.tchRearrangeWarn reloadData];
        };
        return leftXclusv;
    } else {
        NdrdonDefeatistElanCell *leftXclusv = [cmbnAway dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NdrdonDefeatistElanCell class]) forIndexPath:alsoRbuld];
        FryStraightenMangyModel *memoPnn = [self.mltiYearModel.simplSnapshotLoss objectAtIndex:alsoRbuld.section-1];
        leftXclusv.dpthExplainWish = YES;
        VpPenthouseForthcomModel *beepMply = (VpPenthouseForthcomModel *)memoPnn.phrsMainframeLine.firstObject;
        [leftXclusv barrelPeriodicSisal:beepMply.simplSnapshotLoss andMngOverflowHuge:memoPnn andPrintDependentRoom:^(FryStraightenMangyModel * _Nonnull sectionModel, SondalikBalletModel *wordCnvrt) {
            if(self.ftnContainTakeBlock){
                self.ftnContainTakeBlock(sectionModel, wordCnvrt);
            }
        }];
        return leftXclusv;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)cmbnAway viewForSupplementaryElementOfKind:(NSString *)ontoNstll atIndexPath:(NSIndexPath *)alsoRbuld{
    if(alsoRbuld.section > 0){
        if ([ontoNstll isEqualToString:UICollectionElementKindSectionHeader]) {
            FryStraightenMangyModel *bootMprtnt = [self.mltiYearModel.simplSnapshotLoss objectAtIndex:alsoRbuld.section-1];
            RadicatDubiousTrollView *cruslCore = [cmbnAway dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([RadicatDubiousTrollView class]) forIndexPath:alsoRbuld];
            [cruslCore peppyDoorConnection:bootMprtnt andFigrMistakeTest:^(FryStraightenMangyModel * _Nonnull model, glncThereforeBeep buttonType) {

            }];
            if(bootMprtnt.displayType == twrdComposeWish){
                [cruslCore waftBurgherSinuous];
            }else if(bootMprtnt.displayType == brshReceiveLook){
                [cruslCore waftBurgherSinuous];
            }
            return cruslCore;
        }
    }
    return [UICollectionReusableView new];
}

- (CGSize)collectionView:(UICollectionView *)cmbnAway layout:(UICollectionViewLayout*)vrsnGive sizeForItemAtIndexPath:(NSIndexPath *)alsoRbuld{
    if (alsoRbuld.section == 0) {
        if(self.mltiYearModel.ncdContactBack){
            return CGSizeMake(PLYHUS_REGULARIZE, self.mltiYearModel.dsirConfigureHome);
        }else{
            return CGSizeMake(PLYHUS_REGULARIZE, self.mltiYearModel.tpicContrastDate);
        }
    } else {
        return CGSizeMake(PLYHUS_REGULARIZE, (IRE_COPSE ? INDICATIVE_HY(0.7, (PLYHUS_REGULARIZE - 10 * 4)/3/7*10)+30 : (PLYHUS_REGULARIZE - 10 * 4)/3/7*10+30));
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)cmbnAway layout:(UICollectionViewLayout*)vrsnGive insetForSectionAtIndex:(NSInteger)rflctShut{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)cmbnAway layout:(UICollectionViewLayout*)vrsnGive minimumLineSpacingForSectionAtIndex:(NSInteger)rflctShut{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)cmbnAway layout:(UICollectionViewLayout*)vrsnGive minimumInteritemSpacingForSectionAtIndex:(NSInteger)rflctShut{
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)cmbnAway layout:(BlondCunnilusElan *)vrsnGive referenceSizeForHeaderInSection:(NSInteger)rflctShut {
    if(rflctShut == 0){
        return CGSizeZero;
    }else{
        FryStraightenMangyModel *bootMprtnt = [self.mltiYearModel.simplSnapshotLoss objectAtIndex:rflctShut-1];
        if(bootMprtnt.displayType == twrdComposeWish){
            return CGSizeZero;
        }else if(bootMprtnt.displayType == brshReceiveLook){
            return CGSizeZero;
        }else{
            return CGSizeMake(PLYHUS_REGULARIZE, 42);
        }
    }
}

@end