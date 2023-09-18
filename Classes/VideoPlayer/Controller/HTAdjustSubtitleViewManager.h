//
//  HTAdjustSubtitleViewManager.h
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import <Foundation/Foundation.h>
#import "HTAdjustCell.h"
#import "ZKBaseEdgeInsetButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTAdjustSubtitleViewManager : NSObject

+ (UIView *)lgjeropj_rightContainerView;

+ (UIView *)lgjeropj_gradientContainerView;

+ (UIImageView *)lgjeropj_backArrowImg;

+ (UILabel *)lgjeropj_subtitlesL;

+ (UIButton *)lgjeropj_coverBtn;

+ (UIView *)lgjeropj_lineView;

+ (UITableView *)lgjeropj_tableView:(id)target;

+ (UIButton *)lgjeropj_upArrowBtn;

+ (UIButton *)lgjeropj_m05SecBtn;

+ (UIButton *)lgjeropj_reSetBtn;

+ (UIButton *)lgjeropj_p05SecBtn;

+ (UIButton *)lgjeropj_downArrorBtn;

+ (UIButton *)lgjeropj_cancelButton;

+ (UIView *)lgjeropj_vertical_lineView;

+ (UITableView *)lgjeropj_vertical_tableView:(id)target;

+ (UIBarButtonItem *)lgjeropj_backButton:(UIViewController *)target andIsWhite:(BOOL)isWhite;

@end

NS_ASSUME_NONNULL_END
