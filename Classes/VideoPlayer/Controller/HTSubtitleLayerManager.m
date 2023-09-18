//
//  HTSubtitleLayerManager.m
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import "HTSubtitleLayerManager.h"

@implementation HTSubtitleLayerManager

+ (UIView *)lgjeropj_rightContainerView {

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [[UIColor ht_colorWithHexString:@"#000000"] colorWithAlphaComponent:0.5];
    view.sjv_disappearDirection = MSViewDisappearAnimation_Right;
    return view;
}

+ (UIView *)lgjeropj_gradientContainerView {

    return [[UIView alloc] init];
}

+ (UILabel *)lgjeropj_subtitlesL {
    
    UILabel *view = [[UILabel alloc] init];
    view.text = LocalString(@"Subtitles", nil);
    view.textColor = [UIColor whiteColor];
    view.font = [UIFont boldSystemFontOfSize:16];
    return view;
}

+ (UIButton *)lgjeropj_switchBtn {
    
    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    [view sd_setImageWithURL:kImageNumber(277) forState:UIControlStateNormal];
    [view sd_setImageWithURL:kImageNumber(278) forState:UIControlStateSelected];
    view.selected = YES;
    return view;
}

+ (UIView *)lgjeropj_lineView {

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:0.1f];
    return view;
}

+ (UITableView *)lgjeropj_tableView:(id)target {

    UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    view.backgroundColor = [UIColor clearColor];
    view.separatorStyle = UITableViewCellSeparatorStyleNone;
    view.dataSource = target;
    view.delegate = target;
    [view registerClass:[HTSubtitlesLayerCell class] forCellReuseIdentifier:NSStringFromClass([HTSubtitlesLayerCell class])];
    return view;
}
@end
