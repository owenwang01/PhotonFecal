//
//  HTEpisodeTableView.h
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTVPlayDetailSSNModel.h"
#import "HTTVPlayDetailEpsListModel.h"

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, ENUM_HTVideoType);

//选集回调
typedef void(^BLOCK_HTEpisodeSelectBlock)(HTTVPlayDetailEpsListModel *model);
//选季回调
typedef void(^BLOCK_HTEpisodeSwitchSectionBlock)(NSString *seasonId, NSInteger selectedIndex);

@interface HTEpisodeTableView : UIView

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) ENUM_HTVideoType type;
@property (nonatomic, strong) HTTVPlayDetailEpsListModel *var_currentEpsModel;//正在播放的集
@property (nonatomic, copy) BLOCK_HTEpisodeSelectBlock epsSelectedBlock;
@property (nonatomic, copy) BLOCK_HTEpisodeSwitchSectionBlock switchEpsSeason;
@property (nonatomic, copy) void(^BLOCK_operationButtonBlock)(UIButton *sender);//简介下操作回调

- (void)ht_updateViewWithData:(HTTVPlayDetailSSNModel *)data;

- (void)ht_updateSelectWithIndex:(NSInteger)selectedIndex;
- (void)ht_autoPlayNextEP;

- (void)ht_reloadData;

@end

NS_ASSUME_NONNULL_END
