//
//  HTVideoPlayerViewModel.m
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import "HTVideoPlayerControllerModel.h"

@implementation HTVideoPlayerControllerModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isFullScreen = NO;
        self.var_continue = NO;
        self.isLock = NO;
        self.isShare = NO;
        self.isRemoveAd = NO;
        self.isDefaultEdgeControlLayer = YES;
        self.lockTapCount = 0;
        self.var_isPlaySuccess = 3;
        self.var_total = 0.0;
        self.var_linkTime1 = nil;
        self.var_linkTime2 = nil;
        self.var_cache1 = nil;
        self.var_cache2 = nil;
        self.var_isBackground = 2;
    }
    return self;
}

- (void)lgjeropj_reportMTPlayShow {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@(self.var_source) forKey:@"source"];
    [params setValue:self.movieId forKey:@"movie_id"];
    if (self.type == ENUM_HTVideoTypeTv) {
        [params setValue:self.tvViewModel.var_TVdata.title forKey:@"movie_name"];
        [params setValue:@"3" forKey:@"movie_type"];
        [params setValue:self.tvViewModel.var_currentEpsModel.var_idNum forKey:@"eps_id"];
        [params setValue:self.tvViewModel.var_currentEpsModel.title forKey:@"eps_name"];
        [params setValue:@(self.tvViewModel.var_epsList.count) forKey:@"eps_cnt"];
        [params setValue:@(self.tvViewModel.var_TVdata.ssn_list.count) forKey:@"season_cnt"];
        [params setValue:(self.tvViewModel.var_TVdata.casts.count > 0) ? self.tvViewModel.var_TVdata.casts : @"" forKey:@"artist"];
    } else {
        [params setValue:self.movieViewModel.mData.title forKey:@"movie_name"];
        [params setValue:@"1" forKey:@"movie_type"];
        [params setValue:@"0" forKey:@"eps_id"];
        [params setValue:@"0" forKey:@"eps_name"];
        [params setValue:@(0) forKey:@"eps_cnt"];
        [params setValue:@(0) forKey:@"season_cnt"];
        [params setValue:self.movieViewModel.mData.stars ?: @"" forKey:@"artist"];
    }
    [HTPointEventManager ht_eventWithCode:@"movie_play_sh" andParams:params];
}

- (void)lgjeropj_clickMTWithKid:(NSString *)kidStr {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:kidStr forKey:@"kid"];
    [params setValue:@(self.var_source) forKey:@"source"];
    [params setValue:self.movieId forKey:@"movie_id"];
    if (self.type == ENUM_HTVideoTypeTv) {
        [params setValue:self.tvViewModel.var_TVdata.title forKey:@"movie_name"];
        [params setValue:@"3" forKey:@"movie_type"];
        [params setValue:self.tvViewModel.var_currentEpsModel.var_idNum forKey:@"eps_id"];
        [params setValue:self.tvViewModel.var_currentEpsModel.title forKey:@"eps_name"];
        [params setValue:@(self.tvViewModel.var_epsList.count) forKey:@"eps_cnt"];
        [params setValue:@(self.tvViewModel.var_TVdata.ssn_list.count) forKey:@"season_cnt"];
        [params setValue:self.tvViewModel.var_currentSeason.title forKey:AsciiString(@"season")];
        [params setValue:(self.tvViewModel.var_TVdata.casts.count > 0) ? self.tvViewModel.var_TVdata.casts : @"" forKey:@"artist"];
    } else {
        [params setValue:self.movieViewModel.mData.title forKey:@"movie_name"];
        [params setValue:@"1" forKey:@"movie_type"];
        [params setValue:@"0" forKey:@"eps_id"];
        [params setValue:@"0" forKey:@"eps_name"];
        [params setValue:@(0) forKey:@"eps_cnt"];
        [params setValue:@(0) forKey:@"season_cnt"];
        [params setValue:@"0" forKey:AsciiString(@"season")];
        [params setValue:self.movieViewModel.mData.stars ?: @"" forKey:@"artist"];
    }
    [params setValue:self.var_showSubtitle ? @"1" : @"2" forKey:@"subtitle"];
    [params setValue:self.isFullScreen ? @"2" : @"1" forKey:@"ori_type"];
    
    [HTPointEventManager ht_eventWithCode:@"movie_play_cl" andParams:params];
}

- (void)lgjeropj_playtimeReport {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@(self.var_source) forKey:@"source"];
    [params setValue:self.movieId forKey:@"movie_id"];
    if (self.type == ENUM_HTVideoTypeTv) {
        [params setValue:self.tvViewModel.var_TVdata.title forKey:@"movie_name"];
        [params setValue:@"3" forKey:@"movie_type"];
        [params setValue:self.tvViewModel.var_currentEpsModel.var_idNum forKey:@"eps_id"];
        [params setValue:self.tvViewModel.var_currentEpsModel.title forKey:@"eps_name"];
    } else {
        [params setValue:self.movieViewModel.mData.title forKey:@"movie_name"];
        [params setValue:@"1" forKey:@"movie_type"];
        [params setValue:@"0" forKey:@"eps_id"];
        [params setValue:@"0" forKey:@"eps_name"];
    }
    [params setObject:@(self.var_isPlaySuccess) forKey:@"if_success"];
    [params setObject:@(self.var_total) forKey:@"total_len"];
    [params setObject:@"6" forKey:@"lname"];
    [params setObject:@(self.var_isFirstPlay) forKey:@"if_first"];
    [params setObject:@(self.var_isBackground) forKey:@"is_back"];
    [params setObject:@(2) forKey:@"is_local"];
    
    long long cacheLen = 0;
    if (self.var_cache2 != nil && self.var_cache1 != nil) {
        cacheLen = [self.var_cache2 timeIntervalSinceDate:self.var_cache1]*1000;
    }
    [params setObject:@(cacheLen) forKey:@"cache_len"];
    [params setObject:@(cacheLen/1000) forKey:@"firsttime"];
    [params setObject:@(cacheLen) forKey:@"firsttime2"];
    
    long long linkLen = 0;
    if (self.var_linkTime2 != nil && self.var_linkTime1 != nil) {
        linkLen = [self.var_linkTime2 timeIntervalSinceDate:self.var_linkTime1]*1000;
    }
    [params setObject:@(linkLen) forKey:@"link_len"];
    
    if (self.startTime) {
        long long time = [[NSDate date] timeIntervalSinceDate:self.startTime];
        [params setObject:@(time) forKey:@"watch_len"];
    } else {
        [params setObject:@(0) forKey:@"watch_len"];
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"udf_isQuitMTPlayerPage"]) {
        self.startTime = nil;
    }
    NSLog(@"-------> watch_len is %@", [params objectForKey:@"watch_len"]);
    [HTPointEventManager ht_eventWithCode:@"movie_play_len" andParams:params];
}

- (HTMoviePlayerViewModel *)movieViewModel {
    
    if (!_movieViewModel) {
        _movieViewModel = [[HTMoviePlayerViewModel alloc] init];
    }
    return _movieViewModel;
}

- (HTTVPlayerViewModel *)tvViewModel {
    
    if (!_tvViewModel) {
        _tvViewModel = [[HTTVPlayerViewModel alloc] init];
    }
    return _tvViewModel;
}

- (NSMutableArray *)rewardAdCheckArray {
    
    if (!_rewardAdCheckArray) {
        _rewardAdCheckArray = [NSMutableArray array];
    }
    return _rewardAdCheckArray;
}

@end
