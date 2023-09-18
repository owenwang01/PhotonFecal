//
//  HTEpisodesControllerManager.m
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import "HTEpisodesControllerManager.h"

@implementation HTEpisodesControllerManager

+ (UIView *)lgjeropj_rightContainerView {

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [[UIColor ht_colorWithHexString:@"#000000"] colorWithAlphaComponent:0.5];
    view.sjv_disappearDirection = MSViewDisappearAnimation_Right;
    return view;
}

+ (UIView *)lgjeropj_gradientContainerView {
    return [[UIView alloc] init];
}

+ (UILabel *)lgjeropj_episodesL {

    UILabel *view = [[UILabel alloc] init];
    view.text = LocalString(@"Episodes", nil);
    view.textColor = [UIColor whiteColor];
    view.font = [UIFont boldSystemFontOfSize:16];
    return view;
}

+ (UIView *)lgjeropj_lineView {

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.1f];
    return view;
}

+ (UICollectionView *)lgjeropj_collectionView:(id)target {

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(46, 46);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    UICollectionView *view = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    view.backgroundColor = [UIColor clearColor];
    view.dataSource = target;
    view.delegate = target;
    [view registerClass:[HTEpisodesCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([HTEpisodesCollectionCell class])];
    return view;
}

@end
