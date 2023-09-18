//
//  HTEpisodesControllLayerController.h
// 
//
//  Created by Apple on 2022/11/22.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTBaseViewController.h"
#import "HTTVPlayDetailEpsListModel.h"

@protocol HTEpisodesControllLayerControllervDelegate;

NS_ASSUME_NONNULL_BEGIN

@protocol HTEpisodesControllLayerControllervDelegate <NSObject>
// 点击空白区域的回调
- (void)ht_tappedBlankAreaOnTheControlLayer:(id<MSControlLayer>)controlLayer;
// 切换季度
- (void)ht_switchSeason:(NSInteger)selectedIndex;
// 切换剧集集数
- (void)ht_didSelectedEpsWithData:(HTTVPlayDetailEpsListModel *)model indexPath:(NSIndexPath *)indexPath;

@end

@interface HTEpisodesControllLayerController : HTBaseViewController<MSControlLayer>

@property (nonatomic, weak, nullable) id<HTEpisodesControllLayerControllervDelegate> delegate;
//集数
@property (nonatomic, strong) NSMutableArray *var_epsArray;
// 更新集数
- (void)ht_updateViewEpsListData:(NSMutableArray *)dataArray andCurrentModel:(HTTVPlayDetailEpsListModel *)var_currentEpsModel;

@end

NS_ASSUME_NONNULL_END
