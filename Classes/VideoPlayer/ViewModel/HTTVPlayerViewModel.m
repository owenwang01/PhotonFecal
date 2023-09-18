//
//  HTTVPlayerViewModel.m
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTTVPlayerViewModel.h"
#import "HTHistoryData.h"
#import "HTTVPlayDetailEpsListModel.h"

@implementation HTTVPlayerViewModel

- (instancetype)init{
    self = [super init];
    if(self){
        [self ht_createRequestForTvData];
        [self ht_createRequestForSeasons];
        [self ht_createRequestForTvPlay];
        [self ht_createHistory];
    }
    return self;
}

- (void)ht_createRequestForSeasons{
    @weakify(self);
    self.var_requestTvSeasons = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSString *seasonId) {
        @strongify(self);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            //电视剧播放页-获取季度（第几季）的集数
            NSDictionary *var_params5 = @{
                AsciiString(@"id"): kFormat(seasonId).ht_isEmptyStr //季ID
            };
            [[HTNetworkManager shareInstance] post:kNetworkFormat(STATIC_kAppTvSectionList) param:var_params5 result:^(id result) {
                if(TransSuccess(result)){
                    NSMutableArray *var_epsArray = [HTTVPlayDetailEpsListModel mj_objectArrayWithKeyValuesArray:result[@"data"][@"eps_list"]];
                    self.var_epsList = var_epsArray;
                    HTHistoryData *localModel = HTCommonConfiguration.lgjeropj_shared.BLOCK_historySearchVideoByVideoIdBlock(self.videoId);
                    if(localModel){
                        //找到上次播放的季度的剧集
                        HTTVPlayDetailEpsListModel *epsModel = nil;
                        int index = 0;
                        for (; index < var_epsArray.count; index++) {
                            HTTVPlayDetailEpsListModel *var_tempModel = var_epsArray[index];
                            if([var_tempModel.var_idNum isEqualToString:localModel.var_tvSectionsNumId]){
                                epsModel = var_tempModel;
                                break;
                            }
                        }
                        if(epsModel){
                            epsModel.isSelected = YES;
                            [subscriber sendNext:epsModel];
                            [subscriber sendCompleted];
                        }else{
                            //未匹配到对应的剧集，播放最后一集
                            if(var_epsArray.count > 0){
                                HTTVPlayDetailEpsListModel *model = var_epsArray.firstObject;
                                [subscriber sendNext:model];
                                [subscriber sendCompleted];
                            }
                        }
                    }else{
                        //没有本地播放记录，播放最后一集
                        if(var_epsArray.count > 0){
                            HTTVPlayDetailEpsListModel *model = var_epsArray.firstObject;
                            [subscriber sendNext:model];
                            [subscriber sendCompleted];
                        }
                    }
                }else{
                    [subscriber sendNext:nil];
                    [subscriber sendCompleted];
                }
            }];
            return [RACDisposable disposableWithBlock:^{
            }];
        }];
    }];
}

- (void)ht_createRequestForTvPlay{
    @weakify(self);
    self.var_requestTvPlay = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id input) {
        @strongify(self);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            //电视剧集link
            [[HTNetworkManager shareInstance] post:kNetworkFormat(STATIC_kAppTvPlay) param:input result:^(id result) {
                if(TransSuccess(result)){
                    HTTVPlayDetailModel *model = [HTTVPlayDetailModel mj_objectWithKeyValues:result[@"data"]];
                    self.var_playTvData = model;
                    NSDictionary *dict = input;
                    [self.var_requestSubtitles execute:dict[@"id"]];
                    [subscriber sendNext:model];
                    [subscriber sendCompleted];
                }else{
                    [subscriber sendNext:nil];
                    [subscriber sendCompleted];
                }
            }];
            return [RACDisposable disposableWithBlock:^{
            }];
        }];
    }];
}

- (void)ht_createRequestForTvData{
    @weakify(self);
    self.var_requestTvData = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id input) {
        @strongify(self);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            //电视剧播放页-详情
            NSDictionary *var_params4 = @{
                AsciiString(@"page"): @"1",
                AsciiString(@"page_size"): @"20",
                AsciiString(@"tt_id"): kFormat(self.videoId).ht_isEmptyStr //电视剧ID
            };
            [[HTNetworkManager shareInstance] post:kNetworkFormat(STATIC_kAppTvList) param:var_params4 result:^(id result) {
                if(TransSuccess(result)){
                    HTTVPlayDetailSSNModel *var_sectionModel = [HTTVPlayDetailSSNModel mj_objectWithKeyValues:result[@"data"]];
                    self.var_TVdata = var_sectionModel;
                    HTHistoryData *localModel = HTCommonConfiguration.lgjeropj_shared.BLOCK_historySearchVideoByVideoIdBlock(self.videoId);
                    int index = 0;
                    NSInteger season = var_sectionModel.ssn_list.count - 1;
                    self.var_currentIndex = season;
                    if(localModel){
                        //找到上次播放的季度
                        HTTVPlayDetailSSNListModel *ssModel = nil;
                        for (int index = 0; index < var_sectionModel.ssn_list.count; index ++) {
                            HTTVPlayDetailSSNListModel *var_tempModel = var_sectionModel.ssn_list[index];
                            if([var_tempModel.var_idNum isEqualToString:localModel.var_tvSectionsID]){
                                ssModel = var_tempModel;
                                break;
                            }
                        }
                        if(ssModel){
                            //播放对应的季度
                            ssModel.isSelected = YES;
                            self.var_currentSeason = ssModel;
                            season = index;
                            self.var_currentIndex = season;
                            [subscriber sendNext:ssModel];
                            [subscriber sendCompleted];
                        }else{
                            //未匹配找到，播放last season
                            HTTVPlayDetailSSNListModel *ssModel = var_sectionModel.ssn_list.lastObject;
                            if(ssModel){
                                self.var_currentSeason = ssModel;
                                [subscriber sendNext:ssModel];
                                [subscriber sendCompleted];
                            }else{
                                [subscriber sendNext:nil];
                                [subscriber sendCompleted];
                            }
                        }
                    }else{
                        //没有本地播放记录，播放last season
                        HTTVPlayDetailSSNListModel *ssModel = var_sectionModel.ssn_list.lastObject;
                        if(ssModel){
                            ssModel.isSelected = YES;
                            self.var_currentSeason = ssModel;
                            [subscriber sendNext:ssModel];
                            [subscriber sendCompleted];
                        }
                    }
                }else{
                    [subscriber sendNext:nil];
                    [subscriber sendCompleted];
                }
            }];
            return [RACDisposable disposableWithBlock:^{
            }];
        }];
    }];
}

- (void)ht_createHistory {
    
    @weakify(self);
    self.var_saveHistory = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSString *var_isWatchLater) {
        @strongify(self);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            HTHistoryData *data = [[HTHistoryData alloc] init];
            data.var_recordTime = [HTCommonUtils ht_getNowTimeTen];
            data.videoId = self.videoId;
            data.var_videoType = self.type;
            data.playTime = self.currentTime;
            data.var_duration = self.duration;
            
            HTTVPlayDetailSSNModel *var_tvModel = self.var_TVdata;
            data.var_videoRate = [kFormat(var_tvModel.rate).ht_isEmptyStr floatValue];
            data.var_videoTitle = var_tvModel.title;
            data.var_videoDesc = var_tvModel.var_descript;
            data.var_videoCover = var_tvModel.cover;
            HTTVPlayDetailModel *model = self.var_playTvData;
            data.var_videoSize = model.var_videoSize;
            data.var_tvSectionsID = self.var_currentSeason.var_idNum;
            data.var_tvSectionsNumId = self.var_playTvData.tt_id;
            
            if ([var_isWatchLater boolValue]) {
                // 收藏
                HTCommonConfiguration.lgjeropj_shared.BLOCK_insertWatchLaterBlock(data);
            } else {
                HTCommonConfiguration.lgjeropj_shared.BLOCK_insertHistoryBlock(data);
                for (HTHistoryData *var_dataModel in HTCommonConfiguration.lgjeropj_shared.BLOCK_watchLaterDataBlock()) {
                    if([var_dataModel.videoId isEqualToString:data.videoId]) {
                        HTCommonConfiguration.lgjeropj_shared.BLOCK_insertWatchLaterBlock(data);
                        break;
                    }
                }
                
            }
            [subscriber sendNext:@(YES)];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{}];
        }];
    }];
}

@end
