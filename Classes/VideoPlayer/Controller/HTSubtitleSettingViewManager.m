//
//  HTSubtitleSettingViewManager.m
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import "HTSubtitleSettingViewManager.h"

@implementation HTSubtitleSettingViewManager

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

+ (UIButton *)lgjeropj_cancelButton {

    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    [view setTitle:LocalString(@"CANCEL", nil) forState:UIControlStateNormal];
    return view;
}

+ (UIView *)lgjeropj_lineView {

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:.5];
    return view;
}

+ (UITableView *)lgjeropj_tableView:(id)target {
    
    UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    view.backgroundColor = [UIColor clearColor];
    view.separatorStyle = UITableViewCellSeparatorStyleNone;
    view.dataSource = target;
    view.delegate = target;
    view.scrollEnabled = NO;
    [view registerClass:[HTSubtitlesLayerCell class] forCellReuseIdentifier:NSStringFromClass([HTSubtitlesLayerCell class])];
    return view;
}

+ (UIBarButtonItem *)lgjeropj_backButton:(UIViewController *)target andIsWhite:(BOOL)isWhite {
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton sd_setImageWithURL:kImageNumber(115) forState:UIControlStateNormal];
    [backButton sd_setImageWithURL:kImageNumber(115) forState:UIControlStateHighlighted];
    [backButton setTitle:@"" forState:(UIControlStateNormal)];
    [backButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [backButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateHighlighted)];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0,0);
    [backButton sizeToFit];
    SEL backAction = @selector(lgjeropj_backBtnClick);
    if([target respondsToSelector:backAction]){
        [backButton addTarget:target action:backAction forControlEvents:UIControlEventTouchUpInside];
    }
    backButton.bounds = CGRectMake(0, 0, kBarHeight, kBarHeight);
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

@end
