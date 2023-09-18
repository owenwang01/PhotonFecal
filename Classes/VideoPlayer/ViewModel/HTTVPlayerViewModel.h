//
//  HTTVPlayerViewModel.h
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTVideoPlayerViewModel.h"
#import "HTTVPlayDetailModel.h"
#import "HTTVPlayDetailSSNModel.h"
#import "HTTVPlayDetailEpsListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTTVPlayerViewModel : HTVideoPlayerViewModel

@property (nonatomic, strong) RACCommand *var_requestTvData;//播放详情页面/季数据
@property (nonatomic, strong) RACCommand *var_requestTvSeasons;//季数据下面的剧集数据
@property (nonatomic, strong) RACCommand *var_requestTvPlay;//播放剧集

@property (nonatomic, assign) NSInteger var_currentIndex;
@property (nonatomic, strong) HTTVPlayDetailSSNModel *var_TVdata;
@property (nonatomic, strong) HTTVPlayDetailModel *var_playTvData;//当前正在播放的电视剧剧集
@property (nonatomic, strong) NSMutableArray *var_epsList;//集数
@property (nonatomic, strong) HTTVPlayDetailSSNListModel *var_currentSeason;///正在播放的季
@property (nonatomic, strong) HTTVPlayDetailEpsListModel *var_currentEpsModel;//正在播放的集

@end

NS_ASSUME_NONNULL_END
