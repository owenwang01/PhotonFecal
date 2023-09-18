//
//  HTEpisodeHeaderManager.h
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import <Foundation/Foundation.h>
#import "HCSStarRatingView.h"
#import "HTDropdownListView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTEpisodeHeaderManager : NSObject

+ (UILabel *)lgjeropj_titleLabel;

+ (UIView *)lgjeropj_starContentView;

+ (UILabel *)lgjeropj_scoreLabel;

+ (UILabel *)lgjeropj_locationLabel;

+ (UILabel *)lgjeropj_filmTypeLabel;

+ (UILabel *)lgjeropj_filmStarsLabel;

+ (UILabel *)lgjeropj_episodeLabel;

+ (UIView *)lgjeropj_lineView;

+ (HCSStarRatingView *)lgjeropj_starView;

+ (HTDropdownListView *)lgjeropj_listView;

@end

NS_ASSUME_NONNULL_END
