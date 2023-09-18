//
//  HTVideoPlayerViewModel.m
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTVideoPlayerViewModel.h"
#import "HTSubTitlesUtils.h"
#import "HTMoviePlayerViewModel.h"
#import "HTTVPlayerViewModel.h"
#import "SSZipArchive.h"
#import "HTDetailSubtitleModel.h"
#import "HTSubtitlesModel.h"

@interface HTVideoPlayerViewModel ()

@end

@implementation HTVideoPlayerViewModel

- (instancetype)init{
    self = [super init];
    if(self){
        [self ht_createRequestForSubtitles];
        [self ht_createRequestForLoadSubtitles];
    }
    return self;
}

//字幕获取
- (void)ht_createRequestForSubtitles{
    @weakify(self);
    self.var_requestSubtitles = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSString* sourceId) {
        @strongify(self);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSInteger parmaType = self.type == ENUM_HTVideoTypeMovie ? 1 : 2;
            NSDictionary *var_params7 = @{
                AsciiString(@"type"): @(parmaType), // 1电影ID，2电视剧剧集ID
                AsciiString(@"id"): kFormat(sourceId).ht_isEmptyStr, // 播放源Id
            };
            [[HTNetworkManager shareInstance] post:kNetworkFormat(STATIC_kAppTvCaptions) param:var_params7 result:^(id result) {
                if(TransSuccess(result)){
                    HTDetailSubtitleModel *var_subtitleModel = [HTDetailSubtitleModel mj_objectWithKeyValues:result[@"data"]];
                    self.subtitles = var_subtitleModel.subtitle;
                    if(self.subtitles.count > 0){
                        HTSubtitleModel *defaultModel = self.subtitles.firstObject;
                        for (HTSubtitleModel *model in self.subtitles) {
                            NSString *lang = kFormat(model.lang).ht_isEmptyStr;
                            //默认英语字幕
                            if ([lang.lowercaseString containsString:AsciiString(@"english")]) {
                                model.isSelected = YES;
                                defaultModel = model;
                                break;
                            }
                        }
                        // set default language
                        [subscriber sendNext:defaultModel];
                        [subscriber sendCompleted];
                    }else{
                        [subscriber sendNext:nil];
                        [subscriber sendCompleted];
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
    
    [self.var_requestSubtitles.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        if(x){
            [self.var_loadSubtitles execute:x];
        }
    }];
}

- (void)ht_createRequestForLoadSubtitles{
    @weakify(self);
    self.var_loadSubtitles = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(HTSubtitleModel *var_tempModel) {
        @strongify(self);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSString *var_fileName = [kFormat(var_tempModel.t_name).ht_isEmptyStr stringByDeletingPathExtension];
            var_fileName = [NSString stringWithFormat:AsciiString(@"%@.zip"), var_fileName];
            var_fileName = [HTCommonUtils ht_subtitlesCachePathWithSubtitleId:var_fileName];
            NSString *targetPath = [var_fileName.stringByDeletingPathExtension stringByAppendingString:AsciiString(@".srt")];
            [[HTNetworkManager shareInstance] ht_downLoadFileWithURL:var_tempModel.sub andCachePath:var_fileName params:@{} headers:nil progress:nil result:^(id result) {
                if(TransSuccess(result)){
                    [SSZipArchive unzipFileAtPath:var_fileName toDestination:targetPath];
                    NSString *readPath = [[targetPath stringByAppendingString:@"/"] stringByAppendingString:var_tempModel.t_name];
                    NSString *data = [NSString stringWithContentsOfFile:readPath encoding:NSUTF8StringEncoding error:nil];
                    self.var_subTitleUtils = [[HTSubTitlesUtils alloc] init];
                    self.var_subtitleData = [self.var_subTitleUtils ht_getSubtitles:data];
                    
                    NSMutableArray *subtitles = NSMutableArray.array;
                    for (HTSubtitlesModel *var_tempModel in self.var_subtitleData) {
                        MSSubtitleItem *item = [[MSSubtitleItem alloc] initWithContent:var_tempModel.var_attributedStr start:var_tempModel.startTime end:var_tempModel.endTime];
                        [subtitles addObject:item];
                    }
                    [subscriber sendNext:subtitles];
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

- (HTSubTitlesUtils *)var_subTitleUtils{
    if(!_var_subTitleUtils){
        _var_subTitleUtils = [[HTSubTitlesUtils alloc] init];
    }
    return _var_subTitleUtils;
}


- (ZKAlertView *)ht_showLockAlertWithView:(UIView *)view andMovieData:(HTMoviePlayerViewModel *)var_dataModel andDoneBlock:(void(^)(BOOL success))var_doneBlock andCloseBlock:(void(^)(void))var_closeBlock{
    ZKAlertView *alert = [[ZKAlertView alloc] initWithView:view];
    alert.titleColor = [UIColor whiteColor];
    alert.messageColor = [UIColor ht_colorWithHexString:@"#B7ABED"];
    alert.tapblankToClose = NO;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:LocalString(@"Unlock all videos", nil) attributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:14],
        NSForegroundColorAttributeName:[UIColor ht_colorWithHexString:@"#ECECEC"],
        NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
        NSUnderlineColorAttributeName:[UIColor ht_colorWithHexString:@"#ECECEC"]
    }];
    [alert ht_showImage:kImageNumber(8) andTitle:LocalString(@"Share this app to unlock", nil) andMessage:(var_dataModel.mData.title?var_dataModel.mData.title:@"") andCenterButtonTitle:LocalString(@"Go to Share", nil) andCenterButtonBgImage:kImageNumber(206) andBottomText:attrString andBottomTap:^(ZKAlertView *alert) {
        if(var_closeBlock){
            var_closeBlock();
        }
        [alert dismiss];
        HTCommonConfiguration.lgjeropj_shared.BLOCK_checkAndPushSubscribeVipBlock(6);
    } andClose:^(ZKAlertView *alert) {
        if(var_closeBlock){
            var_closeBlock();
        }
        [alert dismiss];
    } andConfirm:^(ZKAlertView *alert) {
        NSString *var_mlocklink = [[NSUserDefaults standardUserDefaults] objectForKey:@"udf_mlocklink"];
        NSString *var_title = [[NSUserDefaults standardUserDefaults] objectForKey:@"udf_shareText1"];
        var_mlocklink = [var_mlocklink stringByAppendingFormat:@"%@%@%@", AsciiString(@"para1="), var_dataModel.videoId, AsciiString(@"&para2=2")];
        NSString *var_name = kFormat(var_dataModel.mData.title).ht_isEmptyStr;
        var_name = [var_name stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        var_mlocklink = [var_mlocklink stringByAppendingFormat:@"%@%@", AsciiString(@"&para3="), var_name];
        var_title = [var_title stringByReplacingOccurrencesOfString:AsciiString(@"xxx") withString:var_name];
        
        [HTCommonUtils ht_shareWithElseAppWithTitle:var_title andUrl:var_mlocklink andSourceRect:CGRectMake(-200, -200, 400, 300) andDoneBlock:^(UIActivityType activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
            [alert dismiss];
            if(var_doneBlock){
                var_doneBlock(completed);
            }
        }];
    }];
    return alert;
}

- (ZKAlertView *)ht_showLockAlertWithView:(UIView *)view andTvData:(HTTVPlayerViewModel *)var_dataModel andDoneBlock:(void(^)(BOOL success))var_doneBlock andCloseBlock:(void(^)(void))var_closeBlock {
    
    ZKAlertView *alert = [[ZKAlertView alloc] initWithView:view];
    alert.titleColor = [UIColor whiteColor];
    alert.messageColor = [UIColor ht_colorWithHexString:@"#B7ABED"];
    alert.tapblankToClose = NO;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:LocalString(@"Unlock all videos", nil) attributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:14],
        NSForegroundColorAttributeName:[UIColor ht_colorWithHexString:@"#ECECEC"],
        NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
        NSUnderlineColorAttributeName:[UIColor ht_colorWithHexString:@"#ECECEC"]
    }];
    [alert ht_showImage:kImageNumber(8) andTitle:LocalString(@"Share this app to unlock", nil) andMessage:(var_dataModel.var_TVdata.title ? var_dataModel.var_TVdata.title:@"") andCenterButtonTitle:LocalString(@"Go to Share", nil) andCenterButtonBgImage:kImageNumber(206) andBottomText:attrString andBottomTap:^(ZKAlertView *alert) {
        if(var_closeBlock){
            var_closeBlock();
        }
        [alert dismiss];
        HTCommonConfiguration.lgjeropj_shared.BLOCK_checkAndPushSubscribeVipBlock(6);
    } andClose:^(ZKAlertView *alert) {
        if(var_closeBlock){
            var_closeBlock();
        }
        [alert dismiss];
    } andConfirm:^(ZKAlertView *alert) {
        NSString *var_ttlink = [[NSUserDefaults standardUserDefaults] objectForKey:@"udf_ttlink"];
        NSString *var_title = [[NSUserDefaults standardUserDefaults] objectForKey:@"udf_shareText2"];
        var_ttlink = [var_ttlink stringByAppendingFormat:@"%@%@%@", AsciiString(@"para1="), var_dataModel.videoId, AsciiString(@"&para2=3")];
        NSString *var_name = kFormat(var_dataModel.var_TVdata.title).ht_isEmptyStr;
        var_name = [var_name stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        var_ttlink = [var_ttlink stringByAppendingFormat:@"%@%@", AsciiString(@"&para3="), var_name];
        var_title = [var_title stringByReplacingOccurrencesOfString:AsciiString(@"xxx") withString:var_name];
        
        [HTCommonUtils ht_shareWithElseAppWithTitle:var_title andUrl:var_ttlink andSourceRect:CGRectMake(-200, -200, 400, 300) andDoneBlock:^(UIActivityType activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
            [alert dismiss];
            if(var_doneBlock){
                var_doneBlock(completed);
            }
        }];
    }];
    return alert;
}

- (BOOL)var_playLock {
    return YES; //测试
}

@end
