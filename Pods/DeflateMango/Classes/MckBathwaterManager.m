






#import "MckBathwaterManager.h"

@implementation MckBathwaterManager

+ (UICollectionView *)prpiseBurgherScabies:(id)cnstntWrap {
    
    UICollectionViewFlowLayout *menuSubjct = [[UICollectionViewFlowLayout alloc] init];
    menuSubjct.minimumLineSpacing = 6.0f;
    menuSubjct.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *cmbnAway = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:menuSubjct];
    cmbnAway.backgroundColor = [UIColor clearColor];
    [cmbnAway registerClass:[VpGlutinousSubtendCell class] forCellWithReuseIdentifier:NSStringFromClass([VpGlutinousSubtendCell class])];
    cmbnAway.delegate = cnstntWrap;
    cmbnAway.dataSource = cnstntWrap;
    cmbnAway.showsHorizontalScrollIndicator = NO;
    return cmbnAway;
}

@end