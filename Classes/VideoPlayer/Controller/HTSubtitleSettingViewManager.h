//
//  HTSubtitleSettingViewManager.h
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import <Foundation/Foundation.h>
#import "HTSubtitlesLayerCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTSubtitleSettingViewManager : NSObject

+ (UILabel *)lgjeropj_subtitlesL;

+ (UIButton *)lgjeropj_switchBtn;

+ (UIButton *)lgjeropj_cancelButton;

+ (UIView *)lgjeropj_lineView;

+ (UITableView *)lgjeropj_tableView:(id)target;

+ (UIBarButtonItem *)lgjeropj_backButton:(UIViewController *)target andIsWhite:(BOOL)isWhite;

@end

NS_ASSUME_NONNULL_END
