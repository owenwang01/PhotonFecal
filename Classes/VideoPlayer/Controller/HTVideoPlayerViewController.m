//
//  HTVideoPlayerViewController.m
// 
//
//  Created by Apple on 2022/11/18.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTVideoPlayerViewController.h"
#import <AVKit/AVPictureInPictureController.h>
#import "WWGCDTimer.h"
#import "HTEpisodesControllLayerController.h"
#import "HTSubtitlesLayerController.h"
#import "HTSwitchLanguageViewController.h"
#import "HTAdjustSubtitleTimeViewController.h"

#import "HTFullScreenPlayButtons.h"
#import "HTMoviePlayDetailModel.h"
#import "HTSubTitlesUtils.h"
#import "HTHistoryData.h"
#import "HTVerticalSubtitleSettingViewController.h"
#import "HTRemoveAdPopView.h"
#import "HTAdViewManager.h"
#import "HTEpisodeTableView.h"
#import "HTTVPlayerViewModel.h"
#import "HTMoviePlayerViewModel.h"

#import "HTNotAuthTipsView.h"
#import "HTMoviePlayMaskView.h"
#import "HTMovieCollectionView.h"
#import "HTVideoPlayerControllerModel.h"
#import "HTCastInstallView.h"

static MSEdgeControlButtonItemTag STATIC_EpisodesControllButtonItemTag = 101;
static MSControlLayerIdentifier STATIC_EpisodesControllLayerIdentifier = 101;

static MSEdgeControlButtonItemTag STATIC_SubTitlesControllButtonItemTag = 102;
static MSControlLayerIdentifier STATIC_SubTitlesControllLayerIdentifier = 102;

//static MSEdgeControlButtonItemTag SwitchLanguageControllButtonItemTag = 103;
static MSControlLayerIdentifier STATIC_SwitchLanguageControllLayerIdentifier = 103;

static MSEdgeControlButtonItemTag STATIC_AdjustControllAdViewButtonItemTag = 12;
static MSControlLayerIdentifier STATIC_AdjustControllLayerIdentifier = 104;

static NSString * const STATIC_rewardAdTimer = @"var_rewardAdTimer";

@interface HTVideoPlayerViewController ()<MSControlLayerSwitcherDelegate, HTEpisodesControllLayerControllervDelegate, HTSubtitlesLayerControllerDelegate, HTSwitchLanguageViewControllerDelegate, HTAdjustSubtitleTimeViewControllerDelegate, MSPlumePlaybackControllerDelegate, MSDeviceVolumeAndBrightnessObserver>


@property (nonatomic, strong) UIView *videoBgV;
@property (nonatomic, strong) MSPlume *player;
@property (nonatomic, strong) MSPlumeResource *asset;
@property (nonatomic, strong) HTVideoPlayerControllerModel *viewModel;

@property (nonatomic, strong) HTMoviePlayMaskView *movieTopMaskView;
@property (nonatomic, strong) HTMovieCollectionView *movieGuessView;//电影详情页

@property (nonatomic, strong) HTEpisodeTableView *tvInfoTable;
@property (nonatomic, strong) HTFullScreenPlayButtons *fullScreenbuttonV;

//广告
@property (nonatomic, strong) HTAdView *rewarAdView;
@property (nonatomic, strong) HTAdView *bannerAdView;
@property (nonatomic, strong) HTAdView *pauseAdView;
@property (nonatomic, strong) NSTimer *bannerAdTimer;

//字幕
@property (nonatomic, strong) HTAdjustSubtitleTimeViewController *adjustSubtitleVC;
@property (nonatomic, strong) HTVerticalSubtitleSettingViewController *subVC;

// 无版权
@property (nonatomic, strong) HTNotAuthTipsView *var_notAuthView;
// 锁电影的定时器
@property (nonatomic, strong) NSTimer *var_lockTimer;
@property (nonatomic, strong) ZKAlertView *var_lockView;

@end

@implementation HTVideoPlayerViewController

- (HTVideoPlayerControllerModel *)viewModel {
    
    if (!_viewModel) {
        _viewModel = [[HTVideoPlayerControllerModel alloc] init];
    }
    _viewModel.var_source = self.var_source;
    _viewModel.movieId = self.movieId;
    _viewModel.type = self.type;
    return _viewModel;
}

#pragma mark -- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ht_bindViewModel];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(ht_finishedSubscribeNotification) name:NTFCTString_FinishSubscribeNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(updatePlayerSetting) name:MSPlumeConfigurationsDidUpdateNotification object:nil];
    __weak typeof(self) weakSelf = self;
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"NTFCTString_interAdShow" object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        [weakSelf lgjeropj_pause];
    }];
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"NTFCTString_interAdHidden" object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        [weakSelf lgjeropj_start];
    }];
}

- (void)ht_finishedSubscribeNotification {
    
    if ([[HTAccountModel sharedInstance] ht_isVip]) {
        // 引导订阅
        self.movieTopMaskView.hidden = YES;
        [self.movieTopMaskView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.mas_equalTo(self.view);
            make.top.mas_equalTo(self.videoBgV.mas_bottom);
            make.height.mas_equalTo(0);
        }];
        [self ht_cleanPageAdState];
        if(self.type == ENUM_HTVideoTypeTv){
            [self.tvInfoTable ht_updateViewWithData:self.viewModel.tvViewModel.var_TVdata];
        }else{
            [self.movieGuessView ht_updateViewWithData:self.viewModel.movieViewModel.mData];
        }
        [self.movieTopMaskView ht_updateAdView];
        //移除广告按钮
        [_player.defaultAdapter.leftAdapter removeItemForTag:STATIC_AdjustControllAdViewButtonItemTag];
    }
}

- (void)lgjeropj_addSubviews {
    [self.view addSubview:self.videoBgV];
    [self.videoBgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.height.mas_equalTo(self.videoBgV.mas_width).multipliedBy(0.56);
    }];
    
    self.movieTopMaskView = [[HTMoviePlayMaskView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.movieTopMaskView];
    self.movieTopMaskView.hidden = NO;
    CGFloat maskHeight = 60;
    if([HTAccountModel sharedInstance].ht_isVip){
        maskHeight = 0;
        self.movieTopMaskView.hidden = YES;
    }
    [self.view layoutIfNeeded];
    [self.movieTopMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view);
        make.top.mas_equalTo(self.videoBgV.mas_bottom);
        //需要判断是否需要显示广告
        make.height.mas_equalTo(maskHeight);//kDevice_Is_iPad?90:50
    }];
    __weak typeof(self) weakSelf = self;
    self.movieTopMaskView.BLOCK_buttonActionBlock = ^(UIButton * _Nonnull sender) {
        weakSelf.viewModel.var_continue = YES;
        HTCommonConfiguration.lgjeropj_shared.BLOCK_toPremiumBlock(weakSelf.type == ENUM_HTVideoTypeTv ? 13 : 12);
    };
    
    if (self.type == ENUM_HTVideoTypeTv) {
        [self.view addSubview:self.tvInfoTable];
        [self.tvInfoTable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.movieTopMaskView.mas_bottom);
            make.leading.trailing.mas_equalTo(self.view);
            make.bottom.mas_equalTo(0);
        }];
    }else{
        [self.view addSubview:self.movieGuessView];
        [self.movieGuessView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.mas_equalTo(self.view);
            make.bottom.mas_equalTo(0);
            make.top.mas_equalTo(self.movieTopMaskView.mas_bottom);
        }];
    }
    [self.view layoutIfNeeded];
    [self ht_createPlayer];
    [self ht_playerSetExpendBottons];
}

- (void)lgjeropj_layoutNavigation{
    [self lgjeropj_setTintColor:[UIColor whiteColor]];
}

- (UIView *)ht_createPlayer {
    _player = [MSPlume shared];
    kself
    _player.playbackObserver.assetStatusDidChangeExeBlock = ^(__kindof MSBornPlume * _Nonnull player) {
        if (player.aspect == MSAssetStatusUnknown || player.aspect == MSAssetStatusFailed) {
            weakSelf.viewModel.var_isPlaySuccess = 2;
        }
        [weakSelf ht_readLocalStatusWithPlayer:player.aspect];
    };
    _player.resumePlaybackWhenAppDidEnterForeground = YES;
    _player.defaultAdapter.shouldShowsCustomStatusBar = ^(MSEdgeControlLayer *controlLayer){
        return NO;//隐藏自定义状态栏
    };
    _player.defaultAdapter.draggingObserver.willBeginDraggingExeBlock = ^(NSTimeInterval time) {
        [weakSelf.fullScreenbuttonV dismissAnimate:NO];
    };
    _player.defaultAdapter.draggingObserver.didEndDraggingExeBlock = ^(NSTimeInterval time) {
        if (weakSelf.player.controlLayerAppeared) {
            [weakSelf ht_addFullScreenButtons];
        }
    };
    _player.deviceVolumeAndBrightnessObserver.volumeDidChangeExeBlock = ^(id<MSDeviceVolumeAndBrightnessController>  _Nonnull mgr, float volume) {
        [weakSelf.fullScreenbuttonV dismissAnimate:NO];
    };
    _player.deviceVolumeAndBrightnessObserver.brightnessDidChangeExeBlock = ^(id<MSDeviceVolumeAndBrightnessController>  _Nonnull mgr, float brightness) {
        [weakSelf.fullScreenbuttonV dismissAnimate:NO];
    };
    _player.playbackObserver.playbackDidFinishExeBlock = ^(__kindof MSBornPlume * _Nonnull player) {
        // 电视剧自动下一集
        if(weakSelf.type == ENUM_HTVideoTypeTv) {
            [weakSelf.tvInfoTable ht_autoPlayNextEP];
        }
        [weakSelf.viewModel lgjeropj_clickMTWithKid:@"15"];
    };
    //_player.accurateSeeking = YES;//是否精确跳转
    _player.controlLayerAppearManager.interval = 5; // 设置控制层隐藏间隔
    _player.view.frame = self.videoBgV.bounds;
    [self.videoBgV addSubview:_player.view];
    [self ht_playerRotationObserver];
    [self ht_setupApplicationObservers];
    return _player.view;
}

- (void)ht_setupApplicationObservers {
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(applicationWillResignActive) name:UIApplicationWillResignActiveNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(applicationWillTerminate) name:UIApplicationWillTerminateNotification object:nil];
}

- (void)ht_playerSetExpendBottons {
    //exchangeItem
    [_player.defaultAdapter.bottomAdapter exchangeItemForTag:MSEdgeControlLayerBottomItem_DurationTime withItemForTag:MSEdgeControlLayerBottomItem_Progress];
    [_player.defaultAdapter.bottomAdapter reload];
    
    //remove /
    [_player.defaultAdapter.bottomAdapter removeItemForTag:MSEdgeControlLayerBottomItem_Separator];
    [_player.defaultAdapter.bottomAdapter reload];
    
    // 移除重播按钮
    [_player.defaultAdapter.centerAdapter removeItemForTag:MSEdgeControlLayerCenterItem_Replay];
    [_player.defaultAdapter.centerAdapter reload];
    
    _player.defaultAdapter.showsMoreItem = NO;
    
    if ([HTCommonConfiguration.lgjeropj_shared.BLOCK_airDictBlock() count] > 0) {
        //投屏按钮
        MSEdgeControlButtonItemTag castItemTag = 1001;
        MSEdgeControlButtonItem *castItem = [MSEdgeControlButtonItem.alloc initWithImage:kImageNumber(159) target:self action:@selector(lgjeropj_castItemAction) tag:castItemTag];
        [_player.defaultAdapter.topAdapter addItem:castItem];
        [_player.defaultAdapter.topAdapter reload];
    }

    MSEdgeControlButtonItemTag shareItemTag = 10;
    MSEdgeControlButtonItem *shareItem = [MSEdgeControlButtonItem.alloc initWithImage:kImageNumber(274) target:self action:@selector(ht_shareItemWasTapped) tag:shareItemTag];
    [_player.defaultAdapter.topAdapter addItem:shareItem];
    [_player.defaultAdapter.topAdapter reload];
    
    MSEdgeControlButtonItem *cItem = [MSEdgeControlButtonItem.alloc initWithImage:kImageNumber(171) target:self action:@selector(ht_switchSubTitlesControlLayer) tag:STATIC_SubTitlesControllButtonItemTag];
    [_player.defaultAdapter.topAdapter addItem:cItem];
    [_player.defaultAdapter.topAdapter reload];
    
    //给返回按钮增加事件-开始
    NSInteger count = _player.defaultAdapter.topAdapter.itemCount;
    NSArray *array = [_player.defaultAdapter.topAdapter itemsWithRange:NSMakeRange(0, count)];
    MSEdgeControlButtonItem *item = array.firstObject;
    MSEdgeControlButtonItemAction *action = [[MSEdgeControlButtonItemAction alloc] initWithTarget:self action:@selector(ht_backAction)];
    [item addAction:action];
    if(!HTCommonConfiguration.lgjeropj_shared.BLOCK_vipBlock()){//去广告按钮
        MSEdgeControlButtonItemTag adItemTag = STATIC_AdjustControllAdViewButtonItemTag;
        MSEdgeControlButtonItem *adItem = [MSEdgeControlButtonItem.alloc initWithImage:kImageNumber(119) target:self action:@selector(ht_adItemWasTapped) tag:adItemTag];
        [_player.defaultAdapter.leftAdapter addItem:adItem];
        [_player.defaultAdapter.leftAdapter reload];
    }
    [self ht_playerControlLayerApperarObserver];
    [self ht_addCustomControlLayerToSwitcher];
    [self ht_addSubTitlesControlLayerToSwitcher];
    [self ht_addSwitchLanguageControlLayerToSwitcher];
    [self ht_addAdjustControlLayerToSwitcher];
    [self ht_registItemObserver];
    [self ht_playerPlaybackObserver];
}

//点击投屏
- (void)lgjeropj_castItemAction
{
    if (HTCommonConfiguration.lgjeropj_shared.BLOCK_toolKitInstalledBlock()) {
        // 直接跳转
        [self lgjeropj_toolKitAction];
    } else {
        BOOL var_playing = self.player.plumeState != MSPlumeStatePeached;
        if (var_playing) {
            [self.player peach];
        }
        HTCastInstallView *view = [[HTCastInstallView alloc] init];
        @weakify(self);
        view.block = ^(NSInteger type) {
            @strongify(self);
            if (type == 0 && var_playing) {
                [self.player start];
            } else if (type == 1) {
                [self lgjeropj_toolKitAction];
            }
        };
        if (self.type == ENUM_HTVideoTypeMovie) {
            [view lgjeropj_show:self.viewModel.movieViewModel.mData.title];
        } else if (self.type == ENUM_HTVideoTypeTv) {
            [view lgjeropj_show:self.viewModel.tvViewModel.var_currentEpsModel.title];
        }
    }
    //埋点
    [HTPointEventManager ht_eventWithCode:AsciiString(@"movie_play_cast") andParams:@{@"kid":@(1)}];
}

- (void)lgjeropj_toolKitAction {
    
    NSDictionary *var_itemDict = HTCommonConfiguration.lgjeropj_shared.BLOCK_airDictBlock();
    if ([var_itemDict count] > 0) {
        if (HTCommonConfiguration.lgjeropj_shared.BLOCK_toolKitInstalledBlock()) {
            // 深链离开
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_dynamicLeave"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            NSString *var_scheme = [var_itemDict objectForKey:@"scheme"];
            NSString *var_host = [NSString stringWithFormat:AsciiString(@"%@://"), var_scheme];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic addEntriesFromDictionary:[self lgjeropj_castParams]];
            [dic addEntriesFromDictionary:HTCommonConfiguration.lgjeropj_shared.BLOCK_deepLinkParamsBlock()];
            NSString *params = [dic mj_JSONString];
            NSString *string = [NSString stringWithFormat:@"%@%@%@%@", var_host, [var_itemDict objectForKey:@"bundleid"], AsciiString(@"?params="), params];
            string = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string] options:@{} completionHandler:nil];
        } else {
            // 深链
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic addEntriesFromDictionary:[self lgjeropj_castParams]];
            [dic addEntriesFromDictionary:[self lgjeropj_deepLinkParams]];
            [[UIApplication sharedApplication] openURL:[HTCommonConfiguration lgjeropj_shared].BLOCK_deepLinkBlock(dic) options:@{} completionHandler:nil];
        }
    }
}

- (NSDictionary *)lgjeropj_deepLinkParams {
    // 深链参数
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSDictionary *data = HTCommonConfiguration.lgjeropj_shared.BLOCK_airDictBlock();
    NSString *var_appleId = data[@"appleid"];
    NSString *var_shopLink = [NSString stringWithFormat:@"%@%@", AsciiString(@"https://apps.apple.com/app/id"), var_appleId];
    [dict setValue:var_shopLink forKey:@"var_shopLink"];
    [dict setValue:[data objectForKey:AsciiString(@"l1")] forKey:@"var_targetLink"];
    [dict setValue:[data objectForKey:@"bundleid"] forKey:@"var_targetBundle"];
    [dict setValue:[data objectForKey:AsciiString(@"k2")] forKey:@"var_dynamicK2"];
    [dict setValue:[data objectForKey:AsciiString(@"c1")] forKey:@"var_dynamicC1"];
    [dict setValue:[data objectForKey:AsciiString(@"c2")] forKey:@"var_dynamicC2"];
    [dict setValue:[data objectForKey:AsciiString(@"logo")] forKey:@"var_dynamicLogo"];
    return dict;
}

- (NSDictionary *)lgjeropj_castParams {
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"3" forKey:AsciiString(@"type")];
    [dict setValue:@"2" forKey:AsciiString(@"product")];
    [dict setValue:@"" forKey:AsciiString(@"activity")];
    [dict setValue:self.player.auspicious.absoluteString forKey:AsciiString(@"url")];
    if (self.type == ENUM_HTVideoTypeTv) {
        [dict setValue:@"0" forKey:AsciiString(@"mid")];
        [dict setValue:self.viewModel.tvViewModel.var_TVdata.title forKey:@"title"];
        [dict setValue:self.viewModel.tvViewModel.var_TVdata.cover forKey:AsciiString(@"cover")];
        [dict setValue:[NSString stringWithFormat:@"%@-%@-%@", self.viewModel.tvViewModel.var_TVdata.title,self.viewModel.tvViewModel.var_currentSeason.title,self.viewModel.tvViewModel.var_currentEpsModel.title] forKey:AsciiString(@"tvname")];
        [dict setValue:self.movieId forKey:AsciiString(@"epsid")];
    } else {
        [dict setValue:self.viewModel.movieViewModel.mData.cover forKey:AsciiString(@"cover")];
        [dict setValue:self.viewModel.movieViewModel.mData.title forKey:@"title"];
        [dict setValue:self.movieId forKey:AsciiString(@"mid")];
        [dict setValue:@"" forKey:AsciiString(@"tvname")];
        [dict setValue:@"0" forKey:AsciiString(@"epsid")];
    }
    return dict;
}

- (void)ht_backAction{
    //    [self ht_savePlayHistory];
    [self ht_savePlayHistoryWithWatchLater:NO];
    
    //埋点
    [self.viewModel lgjeropj_clickMTWithKid:@"1"];
}

- (void)lgjeropj_requestData {
    if (self.type == ENUM_HTVideoTypeMovie) {
        [self ht_requestMovieData];
    } else if (self.type == ENUM_HTVideoTypeTv) {
        [self ht_requestTVData:YES];
    }
    [self ht_requestAdConfig];
}

- (void)ht_bindViewModel{
    if(self.type == ENUM_HTVideoTypeTv){
        self.viewModel.tvViewModel.videoId = self.movieId;
        self.viewModel.tvViewModel.type = self.type;
    }else{
        self.viewModel.movieViewModel.videoId = self.movieId;
        self.viewModel.movieViewModel.type = self.type;
    }
}

#pragma mark - 播放电影
- (void)ht_requestMovieData {
    if (self.movieId.length <= 0) return;
    self.viewModel.var_linkTime1 = [NSDate date];
    self.viewModel.var_linkTime2 = nil;
    
    NSString *timestamp = [NSString stringWithFormat:@"%.0f",[[NSDate date] timeIntervalSince1970]];
    NSDictionary *params = @{@"id":self.movieId ?: @"",AsciiString(@"unixtime"):timestamp,AsciiString(@"api_ver"):@"1"};
    @weakify(self);
    [[self.viewModel.movieViewModel.var_requestMovieData execute:params] subscribeNext:^(HTMoviePlayDetailModel *model) {
        @strongify(self);
        if(model){
            
            if(model.var_notAuth){
                [self.videoBgV addSubview:self.var_notAuthView];
                [self.var_notAuthView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.mas_equalTo(UIEdgeInsetsZero);
                }];
            } else {
                NSString *urlstr = model.sd.link.length > 0 ? model.sd.link : model.hd.link;
                [self ht_setPlayerPlay:urlstr andEpsTitle:model.title];
                [self lgjeropj_requestSubtitle:model.var_idNum];
            }
            
            [self.movieTopMaskView ht_updateAdView];
            [self.movieGuessView ht_updateViewWithData:model];
            
            //埋点
            [self.viewModel lgjeropj_reportMTPlayShow];
            //加载激励视频广告
            [self ht_creatRewardAD];
            [self ht_lockVideo:model.play_lock andLockTime:model.play_lock_tlimit];
        }else{
            [ZKBaseTipTool showMessage:LocalString(@"The network request failed", nil)];
        }
    }];
    [self.viewModel.movieViewModel.var_loadSubtitles.executionSignals.switchToLatest subscribeNext:^(NSArray *subtitles) {
        @strongify(self);
        if(subtitles && subtitles.count > 0){
            [self addSubtitleLabel];
            [self ht_excuteChangeSubtitles:subtitles];
            self.viewModel.var_showSubtitle = YES;
        } else {
            self.viewModel.var_showSubtitle = NO;
        }
    }];
}

#pragma mark - 播放电视剧
- (void)ht_requestTVData:(BOOL)autoPlay {
    if (self.movieId.length <= 0) return;
    @weakify(self);
    [[self.viewModel.tvViewModel.var_requestTvData execute:nil] subscribeNext:^(HTTVPlayDetailSSNListModel *model) {
        @strongify(self);
        //更新数据
        [self.tvInfoTable ht_updateViewWithData:self.viewModel.tvViewModel.var_TVdata];
        [self.tvInfoTable ht_updateSelectWithIndex:self.viewModel.tvViewModel.var_currentIndex];
        [self.movieTopMaskView ht_updateAdView];
        if(model){
            [self ht_requestTVSeasons:model.var_idNum play:autoPlay];
        }
    }];
}

- (void)ht_requestTVSeasons:(NSString *)seasonId play:(BOOL)isPlay {
    if (self.movieId.length <= 0) return;
    @weakify(self);
    [[self.viewModel.tvViewModel.var_requestTvSeasons execute:seasonId] subscribeNext:^(HTTVPlayDetailEpsListModel *model) {
        @strongify(self);
        //刷新表格显示数据
        if(self.type == ENUM_HTVideoTypeTv){
            if(self.viewModel.tvViewModel.var_playTvData && self.player.isPlumed){
                NSString *currentId = kFormat(self.viewModel.tvViewModel.var_playTvData.tt_id).ht_isEmptyStr;
                for (HTTVPlayDetailEpsListModel *tempModel in self.viewModel.tvViewModel.var_epsList) {
                    if([tempModel.var_idNum isEqualToString:currentId]){
                        tempModel.isSelected = YES;
                        break;
                    }
                }
            }
        }
        self.tvInfoTable.dataArray = self.viewModel.tvViewModel.var_epsList;
        [self.tvInfoTable ht_reloadData];
        if(model){
            if(isPlay){
                [self ht_playTvDataWithModel:model];
            } else {
                HTEpisodesControllLayerController *controller = (HTEpisodesControllLayerController *)[self.player.switcher controlLayerForIdentifier:STATIC_EpisodesControllLayerIdentifier];
                if(controller){
                    [controller ht_updateViewEpsListData:self.viewModel.tvViewModel.var_epsList andCurrentModel:self.viewModel.tvViewModel.var_currentEpsModel];
                }
            }
        }
    }];
}

- (void)ht_requestTVPlay:(NSString *)epsId {
    
    self.viewModel.var_linkTime1 = [NSDate date];
    self.viewModel.var_linkTime2 = nil;

    NSString *timestamp = [NSString stringWithFormat:@"%.0f",[[NSDate date] timeIntervalSince1970]];
    NSDictionary *params = @{@"id":epsId,AsciiString(@"unixtime"):timestamp,AsciiString(@"api_ver"):@"1"};
    @weakify(self);
    [[self.viewModel.tvViewModel.var_requestTvPlay execute:params] subscribeNext:^(HTTVPlayDetailModel *model) {
        @strongify(self);
        if(model){
            if(model.var_notAuth){
                [self.videoBgV addSubview:self.var_notAuthView];
                [self.var_notAuthView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.mas_equalTo(UIEdgeInsetsZero);
                }];
            } else {
                NSString *urlstr = model.sd.link.length > 0 ? model.sd.link : model.hd.link;
                [self ht_setPlayerPlay:urlstr andEpsTitle:self.viewModel.tvViewModel.var_currentEpsModel.title];
                [self ht_lockVideo:model.play_lock andLockTime:model.play_lock_tlimit];
            }
            
            
            //埋点
            [self.viewModel lgjeropj_reportMTPlayShow];
        }else{
            [ZKBaseTipTool showMessage:LocalString(@"The network request failed", nil)];
        }
    }];
    [self.viewModel.tvViewModel.var_loadSubtitles.executionSignals.switchToLatest subscribeNext:^(NSArray *subtitles) {
        @strongify(self);
        if(subtitles && subtitles.count > 0){
            [self addSubtitleLabel];
            [self ht_excuteChangeSubtitles:subtitles];
            self.viewModel.var_showSubtitle = YES;
        } else {
            self.viewModel.var_showSubtitle = NO;
        }
    }];
}

#pragma mark - 播放器相关
// update player default setting
- (void)updatePlayerSetting {
    id<MSPlumeControlLayerResources> resources = MSPlumeConfigurations.shared.resources;
    resources.progressTraceColor = [UIColor ht_colorWithHexString:@"#3CDEF4"];
    resources.progressThumbSize = 8;
    resources.progressThumbColor = [UIColor ht_colorWithHexString:@"#3CDEF4"];
}

- (void)ht_setPlayerPlay:(NSString *)urlStr andEpsTitle:(NSString *)title {
    NSURL *playUrl = [NSURL URLWithString:urlStr];
    if(playUrl && [playUrl.pathExtension containsString:AsciiString(@"m3u8")]){
        self.asset = [[MSPlumeResource alloc] initWithSource:playUrl];
        [self.asset setIsSpecial:YES];
    }else{
        self.asset = [[MSPlumeResource alloc] initWithSource:playUrl];
    }
    _player.resource = self.asset;
    self.asset.attributedTitle = [NSAttributedString ms_UIKitText:^(id<MSUIKitTextMakerProtocol>  _Nonnull make) {
        make.append(title);
        make.textColor(UIColor.whiteColor);
    }];
    if(self.rewarAdView != nil && self.rewarAdView.isPlaying){
        [_player peach];
    }
    
    //埋点
    if (self.viewModel.var_linkTime2 == nil) {
        self.viewModel.var_linkTime2 = [NSDate date];
    }
    self.viewModel.var_cache1 = [NSDate date];
    self.viewModel.var_cache2 = nil;
}

- (void)addSubtitleLabel{
    _player.subtitlePopupController.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    _player.subtitlePopupController.view.layer.cornerRadius = 5;
    _player.subtitlePopupController.contentInsets = UIEdgeInsetsMake(12, 22, 12, 22);
}

#pragma mark - 字幕管理
- (void)lgjeropj_requestSubtitle:(NSString *)epsId {
    if(self.type == ENUM_HTVideoTypeTv){
        [self.viewModel.tvViewModel.var_requestSubtitles execute:epsId];
    }else{
        [self.viewModel.movieViewModel.var_requestSubtitles execute:epsId];
    }
}

- (void)loadSubtitleFrom:(HTSubtitleModel *)var_tempModel {
    if(self.type == ENUM_HTVideoTypeTv){
        [self.viewModel.tvViewModel.var_loadSubtitles execute:var_tempModel];
    }else{
        [self.viewModel.movieViewModel.var_loadSubtitles execute:var_tempModel];
    }
}

- (void)ht_excuteChangeSubtitles:(NSArray *)subtitles{
    //切换字幕
    _player.resource.subtitles = subtitles.copy;
    _player.subtitlePopupController.subtitles = _player.resource.subtitles;
}

#pragma mark - HTAdjustSubtitleTimeViewControllerDelegate
- (void)ht_adjustLayerTimeWithType:(ENUM_AdjustButtonClickType)type{
    NSString *showText = nil;
    switch (type) {
        case ENUM_AdjustButtonClick_Minus:{
            NSArray *subtitles = nil;
            if(self.type == ENUM_HTVideoTypeTv){
                subtitles = [self.viewModel.tvViewModel.var_subTitleUtils adjustSubtitleTimeWithType:ENUM_AdjustTypeMinus];
                showText = [NSString stringWithFormat:AsciiString(@"-0.5s\n%.1fs"), self.viewModel.tvViewModel.var_subTitleUtils.total];
            }else{
                subtitles = [self.viewModel.movieViewModel.var_subTitleUtils adjustSubtitleTimeWithType:ENUM_AdjustTypeMinus];
                showText = [NSString stringWithFormat:AsciiString(@"-0.5s\n%.1fs"), self.viewModel.movieViewModel.var_subTitleUtils.total];
            }
            [self ht_excuteChangeSubtitles:subtitles];
        }break;
        case ENUM_AdjustButtonClick_Reset:{
            NSArray *subtitles = nil;
            if(self.type == ENUM_HTVideoTypeTv){
                subtitles = [self.viewModel.tvViewModel.var_subTitleUtils adjustSubtitleTimeWithType:ENUM_AdjustTypeReset];
            }else{
                subtitles = [self.viewModel.movieViewModel.var_subTitleUtils adjustSubtitleTimeWithType:ENUM_AdjustTypeReset];
            }
            [self ht_excuteChangeSubtitles:subtitles];
            showText = LocalString(@"Finished", nil);
        }break;
        case ENUM_AdjustButtonClick_Plus:{
            NSArray *subtitles = nil;
            if(self.type == ENUM_HTVideoTypeTv){
                subtitles = [self.viewModel.tvViewModel.var_subTitleUtils adjustSubtitleTimeWithType:ENUM_AdjustTypePlus];
                showText = [NSString stringWithFormat:AsciiString(@"+0.5s\n%.1fs"), self.viewModel.tvViewModel.var_subTitleUtils.total];
            }else{
                subtitles = [self.viewModel.movieViewModel.var_subTitleUtils adjustSubtitleTimeWithType:ENUM_AdjustTypePlus];
                showText = [NSString stringWithFormat:AsciiString(@"-0.5s\n%.1fs"), self.viewModel.movieViewModel.var_subTitleUtils.total];
            }
            [self ht_excuteChangeSubtitles:subtitles];
        }break;
        default:
            break;
    }
    if(showText){
        [ZKBaseTipTool ht_showIconMessage:showText andIcon:kImageNumber(93) duration:3.0];
    }
}

#pragma mark - 加载广告
- (void)ht_requestAdConfig {
    if([HTAccountModel sharedInstance].ht_isVip){
        return;
    }
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.viewModel.movieViewModel.var_rewardAdSec = [[userDefaults objectForKey:@"udf_mfull_freezeTime"] intValue];
    self.viewModel.movieViewModel.var_bannerAdSec = [[userDefaults objectForKey:@"udf_mbanner_secs"] intValue];
    self.viewModel.movieViewModel.var_bannerAdAutoHiden = [[userDefaults objectForKey:@"udf_banner_ad_m1"] intValue];
    kself
    [[WWGCDTimer sharedInstance] scheduledWithIdentifier:STATIC_rewardAdTimer timeInterval:1 queue:dispatch_get_main_queue() repeats:YES action:^{
        int tCurrentTime = weakSelf.player.currentTime;
        int trewardAdSec = weakSelf.viewModel.movieViewModel.var_rewardAdSec;
        if (tCurrentTime == 0) return;
        if (tCurrentTime % trewardAdSec == 0 && ![weakSelf.viewModel.rewardAdCheckArray containsObject:@(tCurrentTime)]) {
            [weakSelf.viewModel.rewardAdCheckArray addObject:@(tCurrentTime)];
            [weakSelf ht_savePlayHistoryWithWatchLater:NO];
            [weakSelf ht_creatRewardAD];
        }
    }];
}

//对比当前时间与后台下发时间展示“激励广告”
- (void)ht_creatRewardAD {
    
    if ([HTAccountModel sharedInstance].ht_isVip) {
        return;
    }
    if (HTCommonConfiguration.lgjeropj_shared.BLOCK_interViewBlock() != nil && HTCommonConfiguration.lgjeropj_shared.BLOCK_interViewBlock().isPlaying) {
        return;
    }
    if (self.rewarAdView != nil) {
        [self.rewarAdView hideRewardAdView];
        self.rewarAdView = nil;
    }
    self.rewarAdView = [HTAdViewManager lgjeropj_rewardView];
    kself
    self.rewarAdView.rewardBlock = ^(HTAdView *view, NSInteger type) {
        
        if (type == ENUM_HTAdViewStatusHide) {
            // 销毁
            [weakSelf.player start];
            [view hideRewardAdView];
            weakSelf.rewarAdView = nil;
            [weakSelf ht_resetPlayerOrientationAfterScreenAD];
            if (weakSelf.viewModel.isForceScreen) {
                weakSelf.viewModel.isForceScreen = NO;
                [weakSelf.player rotate:weakSelf.viewModel.curforceOrientation animated:YES];
            }
        } else if (type == ENUM_HTAdViewStatusShow) {
            // 暂停播放
            [weakSelf.player peach];
            weakSelf.viewModel.isForceScreen = weakSelf.viewModel.isFullScreen;
            weakSelf.viewModel.curforceOrientation = weakSelf.player.rotationManager.currentOrientation;
            [weakSelf.player rotate:MSOrientation_Portrait animated:YES completion:^(__kindof MSBornPlume * _Nonnull player) {
                [weakSelf.rewarAdView showRewardAdView];
            }];
        }
    };
    [self.rewarAdView createRewardedAd];
}

- (void)lgjeropj_start
{
    [self.player start];
}

- (void)lgjeropj_pause
{
    [self.player peach];
    [self.bannerAdView ht_hideBannerAdView];
    [self.bannerAdView removeFromSuperview];
    self.bannerAdView = nil;
    [self.pauseAdView removeFromSuperview];
}

- (void)ht_creatBannerAdViewWhenFullScreenStatus {
    if (HTCommonConfiguration.lgjeropj_shared.BLOCK_interViewBlock()) {
        [self.bannerAdView ht_hideBannerAdView];
        [self.bannerAdView removeFromSuperview];
        self.bannerAdView = nil;
        return;
    }
    if ([HTAccountModel sharedInstance].ht_isVip) {
        [self.bannerAdView ht_hideBannerAdView];
        [self.bannerAdView removeFromSuperview];
        self.bannerAdView = nil;
        return;
    }
    if (self.viewModel.isFullScreen && self.bannerAdView == nil) {
        self.bannerAdView = [HTAdViewManager lgjeropj_bannerAdView];
        UIApplication *ap = [UIApplication sharedApplication];
        [ap.keyWindow addSubview:self.bannerAdView];

        [self.bannerAdView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.top.offset(0);
            if (kDevice_Is_iPad) {
                make.size.mas_equalTo(CGSizeMake(728, 90));
            } else {
                make.size.mas_equalTo(CGSizeMake(320, 50));
            }
        }];

        kself
        [self.bannerAdView ht_loadAdWithIndex:-1 andView:ap.keyWindow andCloseButton:NO andCloseBlock:^(HTAdView * _Nonnull view, HTAdBaseModel * _Nonnull var_adViewModel, UIView * _Nonnull var_ownerView, NSInteger index) {

        } andLoadBlock:^(BOOL success) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.viewModel.movieViewModel.var_bannerAdAutoHiden * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.bannerAdView ht_hideBannerAdView];
                [weakSelf.bannerAdView removeFromSuperview];
                weakSelf.bannerAdView = nil;
                if(weakSelf.bannerAdTimer){
                    [weakSelf.bannerAdTimer invalidate];
                    weakSelf.bannerAdTimer = nil;
                }

                // 180s  show again
                [weakSelf ht_bannerTimer];
            });
        }];
    }
}

- (void)ht_bannerTimer{
    kself
    self.bannerAdTimer = [NSTimer timerWithTimeInterval:self.viewModel.movieViewModel.var_bannerAdSec repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf ht_creatBannerAdViewWhenFullScreenStatus];
    }];
    [[NSRunLoop mainRunLoop] addTimer:self.bannerAdTimer forMode:NSRunLoopCommonModes];
}

- (void)ht_createPauseAdView {
    if ([HTAccountModel sharedInstance].ht_isVip) {
        return;
    }
    if (HTCommonConfiguration.lgjeropj_shared.BLOCK_interViewBlock()) {
        [self.pauseAdView removeFromSuperview];
        return;
    }
    if (self.viewModel.tvViewModel.var_playIsLocked || self.viewModel.movieViewModel.var_playIsLocked) {
        [self.pauseAdView removeFromSuperview];
        return;
    }
    if (self.pauseAdView != nil || self.viewModel.isShare || self.viewModel.isRemoveAd || self.rewarAdView.isPlaying || !self.player.isFurry) {
        return;
    }
    self.pauseAdView = [HTAdViewManager lgjeropj_mrecAdView];
    UIApplication *ap = [UIApplication sharedApplication];
    for (UIView *view in ap.keyWindow.subviews) {
        if([view isKindOfClass:(HTAdView.class)]){
            [((HTAdView *)view) ht_hideMRECAdView];
            [view removeFromSuperview];
        }
    }
    CGPoint viewCenter;
    UIView *targetView;
    if (_player.isFurry) {
        [ap.keyWindow addSubview:self.pauseAdView];
        if (self.pauseAdView && [self.pauseAdView superview]) {
            [self.pauseAdView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(0);
                make.size.mas_equalTo(CGSizeMake(300, 250));
            }];
        }
        viewCenter = CGPointMake((CGRectGetWidth(ap.keyWindow.rootViewController.view.frame)-230)*0.5, (CGRectGetHeight(ap.keyWindow.rootViewController.view.frame)-150)*0.5);
        targetView = ap.keyWindow;
        kself
        [self.pauseAdView ht_loadAdWithIndex:-1 andView:targetView andCloseButton:YES andCloseBlock:^(HTAdView *view, HTAdBaseModel *var_adViewModel, UIView *var_ownerView, NSInteger index) {
            //先隐藏广告，再弹出引导
            [view ht_hideMRECAdView];
            [view removeFromSuperview];
            view = nil;
            [HTRemoveAdPopView ht_showInView:targetView andPoint:viewCenter andDoneBlock:^(HTRemoveAdPopView *var_popView, ENUM_HTAdPopViewButtonType type) {
                [var_popView dismiss];
                if(type == ENUM_HTAdPopViewButtonTypeGetPrmium){
                    weakSelf.viewModel.var_continue = YES;
                    HTCommonConfiguration.lgjeropj_shared.BLOCK_checkAndPushSubscribeVipBlock(5);
                }else{
                    if(weakSelf.player.isPeached){
                        [weakSelf.player start];
                    }
                }
            }];
        }];
    } else {
        [self.pauseAdView removeFromSuperview];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_player vc_viewDidAppear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_isQuitMTPlayerPage"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    [self ht_savePlayHistoryWithWatchLater:NO];
    [_player vc_viewWillDisappear];
    //埋点
    [self.viewModel lgjeropj_playtimeReport];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"udf_isQuitMTPlayerPage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if (self.viewModel.startTime == nil) {
        self.viewModel.startTime = [NSDate date];
    }
    self.viewModel.isShare = NO;
    if (self.pauseAdView != nil){
        [self.pauseAdView removeFromSuperview];
        self.pauseAdView = nil;
    }
    if (self.viewModel.var_continue) {
        [_player start];
    }
    if (self.subVC) {
        [self.subVC ht_cancelSetting];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [_player vc_viewDidDisappear];
}

- (void)dealloc {
    
    [self ht_destotyLockTimer];
    [self ht_cleanPageAdState];
    [[MSDeviceVolumeAndBrightness shared] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
//清理页面数据
- (void)ht_cleanPageAdState {
    [self.bannerAdView ht_hideBannerAdView];
    [self.bannerAdView removeFromSuperview];
    [self.pauseAdView ht_hideMRECAdView];
    [self.pauseAdView removeFromSuperview];
    [self.rewarAdView hideRewardAdView];
    self.rewarAdView = nil;
    self.bannerAdView = nil;
    self.pauseAdView = nil;
    [self.bannerAdTimer invalidate];
    self.bannerAdTimer = nil;
    [[WWGCDTimer sharedInstance] cancel:STATIC_rewardAdTimer];
}

- (void)applicationDidEnterBackground {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"udf_isQuitMTPlayerPage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.viewModel.var_isBackground = 1;

    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    //埋点
    [self.viewModel lgjeropj_playtimeReport];
}

- (void)applicationWillResignActive {
//        [self ht_savePlayHistory];
    UIViewController *control = [UIViewController lgjeropj_currentViewController];
    if([control isKindOfClass:[HTVideoPlayerViewController class]] || [control isKindOfClass:[MSRotationFullscreenViewController class]]) {
        [self ht_savePlayHistoryWithWatchLater:NO];
    }

    if([HTAccountModel sharedInstance].ht_isVip){
        return;
    }
    if(self.rewarAdView != nil && self.rewarAdView.isPlaying){
        return;
    }
}

- (void)applicationDidBecomeActive {
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"udf_isQuitMTPlayerPage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.viewModel.startTime = [NSDate date];
    [self ht_resetPlayerOrientationAfterScreenAD];
}

- (void)ht_resetPlayerOrientationAfterScreenAD {
    //处理旋转状态不一致的情况
    NSInteger orientation = UIDevice.currentDevice.orientation;
    if (_player.currentOrientation != orientation) {
        if (self.viewModel.isLock) {
            // 解锁
            MSEdgeControlButtonItem *lockItem = [_player.defaultAdapter.leftAdapter itemForTag:MSEdgeControlLayerLeftItem_Lock];
            [lockItem performActions];
        }
        [_player.rotationManager rotate:MSOrientation_Portrait animated:YES];
    }
}

- (void)applicationWillTerminate{
    [self ht_savePlayHistoryWithWatchLater:NO];
}

#pragma mark - 定位历史播放时间
- (void)ht_readLocalStatusWithPlayer:(MSAssetStatus)playerStatus{
    if(_player.aspect == MSAssetStatusReadyToPlay){
        self.viewModel.var_total = _player.duration;
        if (self.viewModel.var_cache2 == nil) {
            self.viewModel.var_cache2 = [NSDate date];
        }
        if (self.viewModel.var_isPlaySuccess != 1) {
            self.viewModel.var_isPlaySuccess = 1;
        }

        HTHistoryData *localModel = HTCommonConfiguration.lgjeropj_shared.BLOCK_historySearchVideoByVideoIdBlock(self.movieId);
        if(localModel){
            self.viewModel.var_isFirstPlay = 2;
            NSTimeInterval secs = localModel.playTime;
            if ( secs > _player.duration ) {
                secs = _player.duration * 0.98;
            }else if ( secs < 0 ) {
                secs = 0;
            }
            if(self.type == ENUM_HTVideoTypeTv){
                //判断是否和剧集匹配
                if([self.viewModel.tvViewModel.var_playTvData.tt_id isEqualToString:localModel.var_tvSectionsNumId]){
                    [_player seekToTime:localModel.playTime completionHandler:^(BOOL finished) {}];
                }
            }else{
                [_player seekToTime:localModel.playTime completionHandler:^(BOOL finished) {}];
            }
        } else {
            self.viewModel.var_isFirstPlay = 1;
        }
    }
}

- (void)ht_playerRotationObserver {
    kself
    _player.shouldTriggerRotation = ^BOOL(__kindof MSBornPlume * _Nonnull player) {
        if (player.resource == nil) {
            return NO;
        }
        return YES;
    };
    _player.rotationObserver.onRotatingChanged = ^(id<MSRotationManager>  _Nonnull mgr, BOOL isRotating) {
        if (!weakSelf) return;
        if (weakSelf.viewModel.tvViewModel.var_playIsLocked || weakSelf.viewModel.movieViewModel.var_playIsLocked) {
            [weakSelf.var_lockView removeFromSuperview];
            weakSelf.viewModel.tvViewModel.var_playIsLocked = NO;
            weakSelf.viewModel.movieViewModel.var_playIsLocked = NO;
            [weakSelf ht_lockVideoCheck];
        }
        // 可根据 mgr.isFullScreen 来判断是否将要旋转至横屏
        if (mgr.isFullscreen){
            weakSelf.viewModel.isFullScreen = YES;
            weakSelf.player.defaultAdapter.autoAdjustTopSpacing = NO;
            [[UIApplication sharedApplication] setStatusBarHidden:YES];
            if (!isRotating && weakSelf.type == ENUM_HTVideoTypeTv) {
                // 先移除 防止横屏旋转不移除视图
                [weakSelf.player.defaultAdapter.bottomAdapter removeItemForTag:STATIC_EpisodesControllButtonItemTag];
                [weakSelf.player.defaultAdapter.bottomAdapter reload];

                NSString *str = LocalString(@"Episodes", nil);
                NSMutableAttributedString *var_attributStr = [[NSMutableAttributedString alloc] initWithString:str];
                NSRange range = [str rangeOfString:str];
                [var_attributStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} range:range];
                [var_attributStr addAttributes:@{NSForegroundColorAttributeName: UIColor.whiteColor} range:range];
                MSEdgeControlButtonItem *episodesItem = [MSEdgeControlButtonItem.alloc initWithTitle:var_attributStr target:weakSelf action:@selector(ht_switchEpisodesControlLayer) tag:STATIC_EpisodesControllButtonItemTag];
                [weakSelf.player.defaultAdapter.bottomAdapter addItem:episodesItem];
                [weakSelf.player.defaultAdapter.bottomAdapter reload];
            }

            if (!isRotating && (weakSelf.type == ENUM_HTVideoTypeTv || weakSelf.type == ENUM_HTVideoTypeMovie)) {
                [weakSelf ht_creatBannerAdViewWhenFullScreenStatus];
            }

            //移除底部显示的竖屏字幕
            NSArray *childs = weakSelf.childViewControllers;
            for (UIViewController *vc in childs) {
                [vc willMoveToParentViewController:nil];
                [vc.view removeFromSuperview];
                [vc removeFromParentViewController];
            }
        } else {
            weakSelf.player.defaultAdapter.autoAdjustTopSpacing = YES;
            [[UIApplication sharedApplication] setStatusBarHidden:NO];
            if (!isRotating) {
                [weakSelf.player.defaultAdapter.bottomAdapter removeItemForTag:STATIC_EpisodesControllButtonItemTag];
                [weakSelf.player.defaultAdapter.bottomAdapter reload];
                weakSelf.viewModel.isFullScreen = NO;
                [weakSelf.bannerAdView ht_hideBannerAdView];
                [weakSelf.bannerAdView removeFromSuperview];
                weakSelf.bannerAdView = nil;
                if(weakSelf.bannerAdTimer){
                    [weakSelf.bannerAdTimer invalidate];
                    weakSelf.bannerAdTimer = nil;
                }
            }
        }
    };
}

- (void)ht_playerPlaybackObserver {
    kself
    _player.playbackObserver.timeControlStatusDidChangeExeBlock = ^(__kindof MSBornPlume * _Nonnull player) {
        if(player.plumeState == MSPlumeStateWaiting){
            UIViewController *control = [UIViewController lgjeropj_currentViewController];
            if(![control isKindOfClass:[HTVideoPlayerViewController class]] && ![control isKindOfClass:[MSRotationFullscreenViewController class]]) {
                [player peach];
            }
            if(weakSelf.rewarAdView != nil && weakSelf.rewarAdView.isPlaying){
                [player peach];
            }
        }else if (player.plumeState == MSPlumeStatePluming) {
            
            weakSelf.viewModel.var_firstPlay = NO;
            if (weakSelf.pauseAdView != nil) {
                [weakSelf.pauseAdView ht_hideMRECAdView];
                [weakSelf.pauseAdView removeFromSuperview];
                [[HTRemoveAdPopView ht_getBackView] removeFromSuperview];
                weakSelf.pauseAdView = nil;
            }
            BOOL var_showAd = NO;
            if (weakSelf.viewModel.tvViewModel.var_playIsLocked || weakSelf.viewModel.movieViewModel.var_playIsLocked) {
                [weakSelf.player peach];
            }
            if (weakSelf.rewarAdView != nil && weakSelf.rewarAdView.isPlaying) {
                [weakSelf.player peach];
                var_showAd = YES;
            }
            if (HTCommonConfiguration.lgjeropj_shared.BLOCK_interViewBlock() != nil && HTCommonConfiguration.lgjeropj_shared.BLOCK_interViewBlock().isPlaying) {
                [weakSelf.player peach];
                var_showAd = YES;
            }
            if (!var_showAd) {
                [weakSelf ht_startLockTimer];
            }
        } else if (player.plumeState == MSPlumeStatePeached) {
            if (!weakSelf.viewModel.var_firstPlay) {
                [weakSelf ht_createPauseAdView];
            }
        }
        if(player.isFurry){
            [weakSelf.fullScreenbuttonV switchPlayButtonStatus:!player.isPluming];
        }
    };
    //TODO:03-15bug调节音量，控制面板暂停按钮重叠情况
    [[MSDeviceVolumeAndBrightness shared] addObserver:self];
}

- (void)ht_playerControlLayerApperarObserver {
    kself
    _player.controlLayerAppearObserver.onAppearChanged = ^(id<MSControlLayerAppearManager>  _Nonnull mgr) {
        if (weakSelf.player.isControlLayerAppeared && !weakSelf.fullScreenbuttonV.isShow && weakSelf.viewModel.isDefaultEdgeControlLayer && weakSelf.viewModel.isFullScreen && !weakSelf.viewModel.isLock) {
            //&& self.type == ENUM_HTVideoTypeTv
            [weakSelf ht_addFullScreenButtons];
            [weakSelf.fullScreenbuttonV show];
            [weakSelf.fullScreenbuttonV switchPlayButtonStatus:!weakSelf.player.isPluming];
        } else if (!mgr.isAppeared) {
            [weakSelf.fullScreenbuttonV dismissAnimate:YES];
        }
    };
}

//TODO:03-15bug调节音量，控制面板暂停按钮重叠情况
#pragma mark - MSDeviceVolumeAndBrightnessObserver
- (void)device:(MSDeviceVolumeAndBrightness *)device onBrightnessChanged:(float)brightness{
    NSLog(@"__调节亮度");
    [self.fullScreenbuttonV dismissAnimate:YES];
}
//TODO:03-15bug调节音量，控制面板暂停按钮重叠情况
- (void)device:(MSDeviceVolumeAndBrightness *)device onVolumeChanged:(float)volume{
    NSLog(@"__调节声音");
    [self.fullScreenbuttonV dismissAnimate:YES];
}

- (BOOL)prefersStatusBarHidden{
    return NO;
}

- (void)ht_addFullScreenButtons {
    if (!self.fullScreenbuttonV.isShow && self.player.isFurry) {
        UIApplication *ap = [UIApplication sharedApplication];
        [[ap keyWindow] addSubview:self.fullScreenbuttonV];
        [self.fullScreenbuttonV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(162, 35));
            make.center.mas_equalTo(self.player.defaultAdapter.centerAdapter);
        }];
        [self.fullScreenbuttonV show];
    }
}

- (void)ht_fullScreenPlayButtonAction:(ENUM_HTFullScreenButtonType)type{
    if (type == ENUM_HTFullScreenButtonTypePlayPause) {
        if (self.fullScreenbuttonV.isPlaying) {
            [self.player peach];
            self.fullScreenbuttonV.isPlaying = NO;
        } else {
            [self.player start];
            self.fullScreenbuttonV.isPlaying = YES;
        }
    } else if (type == ENUM_HTFullScreenButtonTypeBack) {
        NSTimeInterval tTimeInterval = self.player.currentTime - 10;
        [self.player seekToTime:tTimeInterval >= 0 ? tTimeInterval : 0 completionHandler:nil];
        //埋点
        [self.viewModel lgjeropj_clickMTWithKid:@"70"];
    } else {
        NSTimeInterval tTimeInterval = self.player.currentTime + 10;
        [self.player seekToTime:tTimeInterval completionHandler:nil];
        //埋点
        [self.viewModel lgjeropj_clickMTWithKid:@"71"];
    }
}

- (void)ht_registItemObserver {
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(ht_itemActionDidPerformWithNote:) name:MSEdgeControlButtonItemPerformedActionNotification object:nil];
}

- (void)ht_itemActionDidPerformWithNote:(NSNotification *)note {
    MSEdgeControlButtonItem *tItem = note.object;
    if (tItem.tag == MSEdgeControlLayerLeftItem_Lock) {
        self.viewModel.lockTapCount++;
        self.viewModel.isLock = self.viewModel.lockTapCount % 2 == 0 ? NO : YES;
        if (self.viewModel.isLock) {
            // 锁定移除广告
            [_player.defaultAdapter.leftAdapter removeItemForTag:STATIC_AdjustControllAdViewButtonItemTag];
            [_player.defaultAdapter.leftAdapter reload];
            // 移除自定义buttons
            [self.fullScreenbuttonV dismissAnimate:NO];
        } else {
            if (!HTCommonConfiguration.lgjeropj_shared.BLOCK_vipBlock()) {//去广告按钮
                MSEdgeControlButtonItemTag adItemTag = STATIC_AdjustControllAdViewButtonItemTag;
                MSEdgeControlButtonItem *adItem = [MSEdgeControlButtonItem.alloc initWithImage:kImageNumber(119) target:self action:@selector(ht_adItemWasTapped) tag:adItemTag];
                [_player.defaultAdapter.leftAdapter addItem:adItem];
                [_player.defaultAdapter.leftAdapter reload];
            }
        }
    } else if (tItem.tag == MSEdgeControlLayerBottomItem_Play) {
        // 播放暂停按钮
        if (self.player.isPeached) {
            //埋点
            [self.viewModel lgjeropj_clickMTWithKid:@"2"];
        } else {
            //埋点
            [self.viewModel lgjeropj_clickMTWithKid:@"3"];
        }
    } else if (tItem.tag == MSEdgeControlLayerBottomItem_Full) {
        // 全屏按钮
        [self.viewModel lgjeropj_clickMTWithKid:@"5"];
    }
}

//添加控制层到切换器中，只需添加一次, 之后直接切换即可.
- (void)ht_addCustomControlLayerToSwitcher {
    kself
    [_player.switcher addControlLayerForIdentifier:STATIC_EpisodesControllLayerIdentifier lazyLoading:^id<MSControlLayer> _Nonnull(MSControlLayerIdentifier identifier) {
        if ( !weakSelf ) return nil;
        HTEpisodesControllLayerController *vc = [[HTEpisodesControllLayerController alloc] init];
        vc.dataArray = weakSelf.viewModel.tvViewModel.var_TVdata.ssn_list;
        vc.delegate = weakSelf;
        return vc;
    }];
}

- (void)ht_addSubTitlesControlLayerToSwitcher {
    kself
    [_player.switcher addControlLayerForIdentifier:STATIC_SubTitlesControllLayerIdentifier lazyLoading:^id<MSControlLayer> _Nonnull(MSControlLayerIdentifier identifier) {
        if ( !weakSelf ) return nil;
        HTSubtitlesLayerController *vc = [[HTSubtitlesLayerController alloc] init];
        vc.delegate = weakSelf;
        return vc;
    }];
}

- (void)ht_addSwitchLanguageControlLayerToSwitcher {
    kself
    [_player.switcher addControlLayerForIdentifier:STATIC_SwitchLanguageControllLayerIdentifier lazyLoading:^id<MSControlLayer> _Nonnull(MSControlLayerIdentifier identifier) {
        if ( !weakSelf ) return nil;
        HTSwitchLanguageViewController *vc = [[HTSwitchLanguageViewController alloc] init];
        vc.delegate = weakSelf;
        if(weakSelf.type == ENUM_HTVideoTypeTv){
            vc.subtitles = weakSelf.viewModel.tvViewModel.subtitles;
        }else{
            vc.subtitles = weakSelf.viewModel.movieViewModel.subtitles;
        }
        return vc;
    }];
}

- (void)ht_addAdjustControlLayerToSwitcher {
    kself
    [_player.switcher addControlLayerForIdentifier:STATIC_AdjustControllLayerIdentifier lazyLoading:^id<MSControlLayer> _Nonnull(MSControlLayerIdentifier identifier) {
        if ( !weakSelf ) return nil;
        weakSelf.adjustSubtitleVC = [[HTAdjustSubtitleTimeViewController alloc] init];
        weakSelf.adjustSubtitleVC.delegate = weakSelf;
        return weakSelf.adjustSubtitleVC;
    }];
}

//切换控制层
- (void)ht_switchEpisodesControlLayer {
    [self.fullScreenbuttonV dismissAnimate:YES];
    self.viewModel.isDefaultEdgeControlLayer = NO;
    if ( _player.isFurry == NO ) {
        [_player rotate:MSOrientation_LandscapeLeft animated:YES completion:^(MSPlume * _Nonnull player) {
            [player.switcher switchControlLayerForIdentifier:STATIC_EpisodesControllLayerIdentifier];
        }];
    }
    else {
        [self.player.switcher switchControlLayerForIdentifier:STATIC_EpisodesControllLayerIdentifier];
    }
    //埋点
    [self.viewModel lgjeropj_clickMTWithKid:@"33"];
}

- (void)ht_switchSubTitlesControlLayer {
    if(_player.currentOrientation == MSOrientation_Portrait){
        NSArray *childs = self.childViewControllers;
        if(childs && childs.count > 0){
            return;
        }
        NSArray *subtitles = nil;
        NSMutableArray *var_subtitleData = nil;
        if(self.type == ENUM_HTVideoTypeTv){
            subtitles = self.viewModel.tvViewModel.subtitles;
            var_subtitleData = self.viewModel.tvViewModel.var_subtitleData;
        }else{
            subtitles = self.viewModel.movieViewModel.subtitles;
            var_subtitleData = self.viewModel.movieViewModel.var_subtitleData;
        }
        self.subVC = [[HTVerticalSubtitleSettingViewController alloc] init];
        self.subVC.subtitles = subtitles;
        self.subVC.var_subtitleData = var_subtitleData;
        self.subVC.delegate = self;
        self.subVC.var_timeDelegate = self;
        self.subVC.player = _player;
        kself
        self.subVC.subtitleBlock = ^(BOOL tag) {
            weakSelf.viewModel.var_showSubtitle = tag;
            if (tag == NO) {
                [weakSelf ht_excuteChangeSubtitles:@[]];
            } else {
                NSMutableArray *var_subtitleData = nil;
                if(weakSelf.type == ENUM_HTVideoTypeTv){
                    var_subtitleData = weakSelf.viewModel.tvViewModel.var_subtitleData;
                }else{
                    var_subtitleData = weakSelf.viewModel.movieViewModel.var_subtitleData;
                }
                NSMutableArray *subtitles = NSMutableArray.array;
                for (HTSubtitlesModel *var_tempModel in var_subtitleData) {
                    MSSubtitleItem *item = [[MSSubtitleItem alloc] initWithContent:var_tempModel.var_attributedStr start:var_tempModel.startTime end:var_tempModel.endTime];
                    [subtitles addObject:item];
                }
                [weakSelf ht_excuteChangeSubtitles:subtitles];
            }
        };

        HTBaseNavigationController *navVC = [[HTBaseNavigationController alloc] initWithRootViewController:self.subVC];
        [self addChildViewController:navVC];
        [self.view addSubview:navVC.view];
        [navVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(SCREEN_HEIGHT*0.5);
            make.bottom.mas_equalTo(0);
        }];
        [navVC didMoveToParentViewController:self];
    }else{
        [self.fullScreenbuttonV dismissAnimate:YES];
        self.viewModel.isDefaultEdgeControlLayer = NO;
        if ( _player.isFurry == NO ) {
            [_player rotate:MSOrientation_LandscapeLeft animated:YES completion:^(MSPlume * _Nonnull player) {
                [player.switcher switchControlLayerForIdentifier:STATIC_SubTitlesControllLayerIdentifier];
            }];
        }
        else {
            [self.player.switcher switchControlLayerForIdentifier:STATIC_SubTitlesControllLayerIdentifier];
        }
    }
    //埋点
    [self.viewModel lgjeropj_clickMTWithKid:@"11"];
}

- (void)ht_switchLanguageControlLayer {
    [self.fullScreenbuttonV dismissAnimate:YES];
    self.viewModel.isDefaultEdgeControlLayer = NO;
    [_player.switcher switchControlLayerForIdentifier:STATIC_SwitchLanguageControllLayerIdentifier];
    [_player controlLayerNeedAppear];
}

- (void)ht_adjustControlLayer {
    [self.fullScreenbuttonV dismissAnimate:YES];
    self.viewModel.isDefaultEdgeControlLayer = NO;
    [_player.switcher switchControlLayerForIdentifier:STATIC_AdjustControllLayerIdentifier];
    [_player controlLayerNeedAppear];
}

//点击空白区域, 切换回旧控制层
#pragma mark -- HTEpisodesControllLayerControllervDelegate
- (void)ht_tappedBlankAreaOnTheControlLayer:(id<MSControlLayer>)controlLayer {
    self.viewModel.isDefaultEdgeControlLayer = YES;
    [self.player.switcher switchControlLayerForIdentifier:MSControlLayer_Edge];
    if (_player.isControlLayerAppeared && self.viewModel.isDefaultEdgeControlLayer) {
        [self ht_addFullScreenButtons];
    }
}

- (void)ht_switchSeason:(NSInteger)selectedIndex {
    //埋点
    [self.viewModel lgjeropj_clickMTWithKid:@"37"];
    [self lgjeropj_swithSeasonWithIndex:selectedIndex];
}

- (void)lgjeropj_swithSeasonWithIndex:(NSInteger)selectedIndex {
    
    [self.tvInfoTable ht_updateSelectWithIndex:selectedIndex];
    if(selectedIndex < self.viewModel.tvViewModel.var_TVdata.ssn_list.count){
        HTTVPlayDetailSSNListModel *model = self.viewModel.tvViewModel.var_TVdata.ssn_list[selectedIndex];
        for (HTTVPlayDetailSSNListModel *var_tempModel in self.viewModel.tvViewModel.var_TVdata.ssn_list) {
            var_tempModel.isSelected = NO;
        }
        model.isSelected = YES;
        //self.currentSeaso = model;
        [self ht_requestTVSeasons:kFormat(model.var_idNum).ht_isEmptyStr play:NO];
    }
}

- (void)ht_didSelectedEpsWithData:(HTTVPlayDetailEpsListModel *)model indexPath:(NSIndexPath *)indexPath{
    
    if ([model.var_idNum isEqualToString:self.viewModel.tvViewModel.var_currentEpsModel.var_idNum]) {
        return;
    }
    //切换回旧控制层
    self.viewModel.isDefaultEdgeControlLayer = YES;
    [self.player.switcher switchControlLayerForIdentifier:MSControlLayer_Edge];
    //埋点
    [self.viewModel lgjeropj_playtimeReport];
    [self.viewModel lgjeropj_clickMTWithKid:@"34"];
    //重置时间
    self.viewModel.startTime = [NSDate date];
    //切电视剧
    [self ht_playTvDataWithModel:model];
}

- (void)ht_playTvDataWithModel:(HTTVPlayDetailEpsListModel *)model {
    
    //关闭定时器
    [self ht_destotyLockTimer];

    //加载激励视频广告
    [self ht_creatRewardAD];
    
    self.viewModel.var_firstPlay = YES;
    
    [self ht_savePlayHistoryWithWatchLater:NO];

    self.viewModel.tvViewModel.var_currentEpsModel = model;
    self.tvInfoTable.var_currentEpsModel = model;
    for (HTTVPlayDetailEpsListModel *model in self.viewModel.tvViewModel.var_epsList) {
        model.isSelected = NO;
    }
    model.isSelected = YES;
    NSString *epsId = kFormat(model.var_idNum).ht_isEmptyStr;
    [self ht_requestTVPlay:epsId];
    //在选中了播放的集数时，才更新当前的季数据
    for (HTTVPlayDetailSSNListModel *var_tempModel in self.viewModel.tvViewModel.var_TVdata.ssn_list) {
        if(var_tempModel.isSelected){
            self.viewModel.tvViewModel.var_currentSeason = var_tempModel;
            break;
        }
    }
    [self.tvInfoTable ht_reloadData];
    HTEpisodesControllLayerController *controller = (HTEpisodesControllLayerController *)[_player.switcher controlLayerForIdentifier:STATIC_EpisodesControllLayerIdentifier];
    if(controller){
        [controller ht_updateViewEpsListData:self.viewModel.tvViewModel.var_epsList andCurrentModel:self.viewModel.tvViewModel.var_currentEpsModel];
    }
}

#pragma mark -- HTSubtitlesLayerControllerDelegate
- (void)ht_subtitlesLayerTappedBlankAreaOnTheControlLayer:(id<MSControlLayer>)controlLayer {
    self.viewModel.isDefaultEdgeControlLayer = YES;
    [self.player.switcher switchControlLayerForIdentifier:MSControlLayer_Edge];
    if (_player.isControlLayerAppeared && self.viewModel.isDefaultEdgeControlLayer) {
        [self ht_addFullScreenButtons];
    }
}

//when this delegate response，switch to another controll layer
- (void)ht_subtitlesLayerClickAction:(ENUM_SubtitlesLayerType)type {
    if (type == 0) {
        // show switch language control layer
        [self ht_adjustControlLayer];
    } else {
        [self ht_switchLanguageControlLayer];
    }
}

- (void)ht_subtitlesLayerSwitchBtnAction:(BOOL)isOn {
    
    self.viewModel.var_showSubtitle = isOn;
    if (isOn == NO) {
        [self ht_excuteChangeSubtitles:@[]];
    } else {
        NSMutableArray *var_subtitleData = nil;
        if(self.type == ENUM_HTVideoTypeTv){
            var_subtitleData = self.viewModel.tvViewModel.var_subtitleData;
        }else{
            var_subtitleData = self.viewModel.movieViewModel.var_subtitleData;
        }
        NSMutableArray *subtitles = NSMutableArray.array;
        for (HTSubtitlesModel *var_tempModel in var_subtitleData) {
            MSSubtitleItem *item = [[MSSubtitleItem alloc] initWithContent:var_tempModel.var_attributedStr start:var_tempModel.startTime end:var_tempModel.endTime];
            [subtitles addObject:item];
        }
        [self ht_excuteChangeSubtitles:subtitles];
    }
}

#pragma mark -- HTSwitchLanguageViewControllerDelegate
- (void)ht_switchLanguageLayerTappedBlankAreaOnTheControlLayer:(id<MSControlLayer>)controlLayer {
    self.viewModel.isDefaultEdgeControlLayer = YES;
    [self.player.switcher switchControlLayerForIdentifier:MSControlLayer_Edge];
    if (_player.isControlLayerAppeared && self.viewModel.isDefaultEdgeControlLayer) {
        [self ht_addFullScreenButtons];
    }
}

//when this delegate response，switch Language
- (void)ht_switchLanguageLayerCellClick:(HTSubtitleModel *)langModel {
    [self loadSubtitleFrom:langModel];
}

#pragma mark -- HTAdjustSubtitleTimeViewControllerDelegate
- (void)ht_adjustLayerTappedBlankAreaOnTheControlLayer:(id<MSControlLayer>)controlLayer {
    self.viewModel.isDefaultEdgeControlLayer = YES;
    [self.player.switcher switchControlLayerForIdentifier:MSControlLayer_Edge];
    if (_player.isControlLayerAppeared && self.viewModel.isDefaultEdgeControlLayer) {
        [self ht_addFullScreenButtons];
    }
}

#pragma mark - 分享
- (void)ht_shareItemWasTapped {
    self.viewModel.isShare = YES;
    [self.player peach];
    CGRect rectV = CGRectMake(SCREEN_WIDTH-100, -210, 400, 300);
    CGRect rectH = CGRectMake(SCREEN_WIDTH-300, -250, 400, 300);
    CGRect realRect = self.player.isFurry ? rectH : rectV;
    __weak typeof(self) weakSelf = self;
    UIActivityViewControllerCompletionWithItemsHandler doneBlock = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
        if (weakSelf.player.isPeached) {
            [weakSelf.player start];
        }
    };
    NSString *name = self.type == ENUM_HTVideoTypeTv?self.viewModel.tvViewModel.var_TVdata.title:self.viewModel.movieViewModel.mData.title;

    [HTCommonUtils ht_shareWithDataId:self.movieId andName:name andType:self.type andSourceRect:realRect andDoneBlock:doneBlock];

    //埋点
    [self.viewModel lgjeropj_clickMTWithKid:@"8"];
}

- (void)ht_adItemWasTapped {
    [_player peach];
    self.viewModel.isRemoveAd = YES;
    [self ht_removeAd];
}

- (void)ht_removeAd {
    if (self.viewModel.isLock) return;
    kself
    [_player rotate:MSOrientation_Portrait animated:YES completion:^(__kindof MSBornPlume * _Nonnull player) {
        weakSelf.viewModel.var_continue = YES;
        [weakSelf.viewModel lgjeropj_clickMTWithKid:@"32"];
        HTCommonConfiguration.lgjeropj_shared.BLOCK_checkAndPushSubscribeVipBlock(3);
    }];
}

- (void)ht_removeAdCancel {
    [_player start];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}

#pragma mark -- lazy load
- (UIView *)videoBgV {
    if (!_videoBgV) {
        _videoBgV = [[UIView alloc] init];
        _videoBgV.backgroundColor = [UIColor ht_colorWithHexString:@"#C0C0C0"];
    }
    return _videoBgV;
}

- (HTEpisodeTableView *)tvInfoTable{
    if(!_tvInfoTable){
        HTEpisodeTableView *tvInfoTable = [[HTEpisodeTableView alloc] initWithFrame:CGRectZero];
        kself
        tvInfoTable.epsSelectedBlock = ^(HTTVPlayDetailEpsListModel * _Nonnull model) {
            if ([model.var_idNum isEqualToString:weakSelf.viewModel.tvViewModel.var_currentEpsModel.var_idNum]) {
                return;
            }
            //埋点
            [weakSelf.viewModel lgjeropj_playtimeReport];
            //埋点
            [weakSelf.viewModel lgjeropj_clickMTWithKid:@"10"];
            //重置时间
            weakSelf.viewModel.startTime = [NSDate date];
            //切电视剧
            [weakSelf ht_playTvDataWithModel:model];
        };
        tvInfoTable.switchEpsSeason = ^(NSString * _Nonnull seasonId, NSInteger selectedIndex) {
            [weakSelf lgjeropj_swithSeasonWithIndex:selectedIndex];
            //埋点
            [weakSelf.viewModel lgjeropj_clickMTWithKid:@"12"];
        };
        
        tvInfoTable.BLOCK_operationButtonBlock = ^(UIButton * _Nonnull sender) {
            [weakSelf ht_handleOperationWithButton:sender];
        };
        
        _tvInfoTable = tvInfoTable;
    }
    return _tvInfoTable;
}

- (HTNotAuthTipsView *)var_notAuthView{
    if(!_var_notAuthView){
        _var_notAuthView = [[HTNotAuthTipsView alloc] initWithFrame:CGRectZero];
    }
    return _var_notAuthView;
}

//全屏下中间的快进快退播放按钮
- (HTFullScreenPlayButtons *)fullScreenbuttonV {
    if (!_fullScreenbuttonV) {
        _fullScreenbuttonV = [[HTFullScreenPlayButtons alloc] initWithFrame:CGRectMake(0, 0, 162, 35)];
        _fullScreenbuttonV.center = self.view.center;
        kself
        _fullScreenbuttonV.playBtnBlock = ^(ENUM_HTFullScreenButtonType type) {
            [weakSelf ht_fullScreenPlayButtonAction:type];
        };
        [self.view bringSubviewToFront:_fullScreenbuttonV];
    }
    
    if([self.pauseAdView isDescendantOfView:[UIApplication sharedApplication].keyWindow]){
        [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self.pauseAdView];
    }
    
    if([[HTRemoveAdPopView ht_getBackView] isDescendantOfView:[UIApplication sharedApplication].keyWindow]){
        [[UIApplication sharedApplication].keyWindow bringSubviewToFront:[HTRemoveAdPopView ht_getBackView]];
    }
    
    return _fullScreenbuttonV;
}

//电影详情
- (HTMovieCollectionView *)movieGuessView {
    if (!_movieGuessView) {
        _movieGuessView = [[HTMovieCollectionView alloc] initWithFrame:CGRectZero];
        kself
        _movieGuessView.BLOCK_operationButtonBlock = ^(UIButton * _Nonnull sender) {
            [weakSelf ht_handleOperationWithButton:sender];
        };
        _movieGuessView.BLOCK_HTMovieCollectionViewSelectedBlock = ^(HTMovieHomeDefaultSetSectionModel * _Nonnull sectionModel, HTMovieHomeDefaultSetDataListSubListMovieModel * _Nonnull var_dataModel) {
            [weakSelf ht_savePlayHistoryWithWatchLater:NO];
            [HTCommonUtils ht_playVieoWithId:kFormat([var_dataModel var_idNum]).ht_isEmptyStr andType:var_dataModel.var_videoType andSource:17];
            
            NSMutableDictionary *params = [NSMutableDictionary dictionary];
            [params setValue:@"38" forKey:@"kid"];
            [params setValue:@(11) forKey:@"source"];
            [params setValue:kFormat([var_dataModel var_idNum]).ht_isEmptyStr forKey:@"movie_id"];
            [params setValue:kFormat([var_dataModel title]).ht_isEmptyStr forKey:@"movie_name"];
            [params setValue:@"1" forKey:@"movie_type"];
            [params setValue:kFormat([var_dataModel stars]).ht_isEmptyStr forKey:@"artist"];
            [params setValue:@"2" forKey:@"subtitle"];
            [params setValue:@"1" forKey:@"ori_type"];
            [HTPointEventManager ht_eventWithCode:@"movie_play_cl" andParams:params];
        };
    }
    return _movieGuessView;
}

//电影-分享,收藏,反馈
- (void)ht_handleOperationWithButton:(UIButton *)sender{
    if(sender.tag == 0){
        //收藏
        //        [self ht_savePlayHistoryWithWatchLater:YES];
        //TODO:03-13bug，增加取消收藏功能
        HTHistoryData *historyData = HTCommonConfiguration.lgjeropj_shared.BLOCK_watchLaterSearchVideoByVideoIdBlock(self.movieId);
        if(historyData){
            HTCommonConfiguration.lgjeropj_shared.BLOCK_deleteWatchLaterBlock(historyData);
            [ZKBaseTipTool showMessage:AsciiString(@"Canceled")];
            if(self.type == ENUM_HTVideoTypeTv){
                [self.tvInfoTable ht_updateViewWithData:self.viewModel.tvViewModel.var_TVdata];
            }else{
                [self.movieGuessView ht_updateViewWithData:self.viewModel.movieViewModel.mData];
            }
        }else{
            [self ht_savePlayHistoryWithWatchLater:YES];
        }
    }else if (sender.tag == 1){
        //分享
        [self ht_shareItemWasTapped];
    }else if (sender.tag == 2){
        //反馈
        self.viewModel.var_continue = YES;
        NSString *var_mid = @"0";
        NSString *var_sid = @"0";
        NSString *var_eid = @"0";
        if (self.type == ENUM_HTVideoTypeMovie) {
            var_mid = self.movieId;
        } else {
            var_mid = self.movieId;
            var_sid = self.viewModel.tvViewModel.var_currentSeason.var_idNum;
            var_eid = self.viewModel.tvViewModel.var_currentEpsModel.var_idNum;
        }
        HTCommonConfiguration.lgjeropj_shared.BLOCK_toFeedbackBlock(var_mid, var_sid, var_eid);
    }
}

//保存播放记录,var_isWatchLater:是否是点击收藏的保存
- (void)ht_savePlayHistoryWithWatchLater:(BOOL)var_isWatchLater{
    if(!_player.isPlumed && !var_isWatchLater){
        return;
    }
    @weakify(self);
    if(self.type == ENUM_HTVideoTypeTv){
        self.viewModel.tvViewModel.currentTime = _player.currentTime;
        self.viewModel.tvViewModel.duration = _player.duration;
        [[self.viewModel.tvViewModel.var_saveHistory execute:@(var_isWatchLater)] subscribeNext:^(NSNumber *x) {
            NSLog([x boolValue]?@"播放记录保存成功":@"播放记录保存失败");
            @strongify(self);
            if(var_isWatchLater){
                [ZKBaseTipTool showMessage:LocalString(@"Success", nil)];
                [self.tvInfoTable ht_reloadData];
            }
        }];
    }else{
        self.viewModel.movieViewModel.currentTime = _player.currentTime;
        self.viewModel.movieViewModel.duration = _player.duration;
        [[self.viewModel.movieViewModel.var_saveHistory execute:@(var_isWatchLater)] subscribeNext:^(NSNumber *x) {
            NSLog([x boolValue]?@"播放记录保存成功":@"播放记录保存失败");
            @strongify(self);
            if(var_isWatchLater){
                [ZKBaseTipTool showMessage:LocalString(@"Success", nil)];
                [self.movieGuessView ht_updateViewWithData:self.viewModel.movieViewModel.mData];
            }
        }];
    }
}

#pragma mark - 锁电影/锁电视剧
- (void)ht_lockVideo:(NSString *)lock andLockTime:(NSString *)var_lockTime{
    BOOL flag = [kFormat(lock).ht_isEmptyStr boolValue];
    NSTimeInterval lockBeforeTime = [kFormat(var_lockTime).ht_isEmptyStr floatValue];
    if(lockBeforeTime == 0){
        lockBeforeTime = 360;
    }
    if(self.type == ENUM_HTVideoTypeTv){
        self.viewModel.tvViewModel.var_playLock = flag;
        self.viewModel.tvViewModel.var_lockTime = lockBeforeTime;
        self.viewModel.tvViewModel.var_playIsLocked = NO;
    }else{
        self.viewModel.movieViewModel.var_playLock = flag;
        self.viewModel.movieViewModel.var_lockTime = lockBeforeTime;
        self.viewModel.movieViewModel.var_playIsLocked = NO;
    }
}

- (NSString *)ht_recordId
{
    NSString *var_recordId = @"";
    if (self.type == ENUM_HTVideoTypeTv) {
        var_recordId = [NSString stringWithFormat:@"%@_%@_%@", self.viewModel.tvViewModel.videoId, self.viewModel.tvViewModel.var_currentSeason.var_idNum, self.viewModel.tvViewModel.var_currentEpsModel.var_idNum];
    } else {
        var_recordId = [NSString stringWithFormat:@"%@", self.viewModel.movieViewModel.videoId];
    }
    return var_recordId;
}

- (void)ht_lockVideoCheck {
    
    if ([[HTAccountModel sharedInstance] ht_isVip]) {
        return;
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:[self ht_recordId]]) {
        return;
    }
    UIViewController *control = [UIViewController lgjeropj_currentViewController];
    if(![control isKindOfClass:[HTVideoPlayerViewController class]] &&
       ![control isKindOfClass:[MSRotationFullscreenViewController class]]) {
        return;
    }

    if (self.type == ENUM_HTVideoTypeTv) {
        if(self.viewModel.tvViewModel.var_playIsLocked || !self.viewModel.tvViewModel.var_playLock){
            return;
        }
    } else {
        if(self.viewModel.movieViewModel.var_playIsLocked || !self.viewModel.movieViewModel.var_playLock){
            return;
        }
    }
    NSTimeInterval time = (self.type == ENUM_HTVideoTypeTv ? self.viewModel.tvViewModel.var_lockTime : self.viewModel.movieViewModel.var_lockTime);
    if (_player.currentTime >= time) {
        if (self.type == ENUM_HTVideoTypeTv) {
            self.viewModel.tvViewModel.var_playIsLocked = YES;
        } else {
            self.viewModel.movieViewModel.var_playIsLocked = YES;
        }
        [self ht_destotyLockTimer];
        [_player peach];
        if(self.type == ENUM_HTVideoTypeTv){
            kself
            self.var_lockView = [self.viewModel.tvViewModel ht_showLockAlertWithView:self.view andTvData:self.viewModel.tvViewModel andDoneBlock:^(BOOL success){
                weakSelf.viewModel.tvViewModel.var_playIsLocked = NO;
                if(success){
                    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[weakSelf ht_recordId]];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    [weakSelf.player start];
                }
            } andCloseBlock:^{
                weakSelf.viewModel.tvViewModel.var_playIsLocked = NO;
             }];
        }else{
            kself
            self.var_lockView = [self.viewModel.movieViewModel ht_showLockAlertWithView:self.view andMovieData:self.viewModel.movieViewModel andDoneBlock:^(BOOL success){
                weakSelf.viewModel.movieViewModel.var_playIsLocked = NO;
                if(success){
                    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:[weakSelf ht_recordId]];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    [weakSelf.player start];
                }
            } andCloseBlock:^{
                weakSelf.viewModel.movieViewModel.var_playIsLocked = NO;
            }];
        }
    }
}

- (void)ht_startLockTimer {
    [self ht_destotyLockTimer];
    __weak typeof(self) weakSelf = self;
    self.var_lockTimer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf ht_lockVideoCheck];
    }];
}

- (void)ht_destotyLockTimer{
    if(self.var_lockTimer){
        [self.var_lockTimer invalidate];
        self.var_lockTimer = nil;
    }
}

@end



