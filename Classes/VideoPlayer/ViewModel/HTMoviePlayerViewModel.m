//
//  HTMoviePlayerViewModel.m
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTMoviePlayerViewModel.h"
#import "HTMoviePlayDetailModel.h"
#import "HTHistoryData.h"

@implementation HTMoviePlayerViewModel

- (instancetype)init{
    self = [super init];
    if(self){
        [self ht_createRequestForMovie];
        [self ht_createHistory];
    }
    return self;
}

- (void)ht_createRequestForMovie{
    @weakify(self);
    self.var_requestMovieData = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id input) {
        @strongify(self);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            //电影播放页
            [[HTNetworkManager shareInstance] post:kNetworkFormat(STATIC_kAppMovieDetailPage) param:input result:^(id result) {
                if(TransSuccess(result)){
                    HTMoviePlayDetailModel *model = [HTMoviePlayDetailModel mj_objectWithKeyValues:result[@"data"]];
                    [model ht_handleData2WithResult:result];

                    self.mData = model;
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
            
            HTMoviePlayDetailModel *model = self.mData;
            data.var_videoRate = [kFormat(model.rate).ht_isEmptyStr floatValue];
            data.var_videoSize = model.var_videoSize;
            data.var_videoTitle = model.title;
            data.var_videoDesc = model.var_descript;
            data.var_videoCover = model.cover;
            data.var_videoPubDate = model.pub_date;
            data.var_videoQuality = model.quality;
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
