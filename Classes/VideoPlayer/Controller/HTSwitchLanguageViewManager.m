//
//  HTSwitchLanguageViewManager.m
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import "HTSwitchLanguageViewManager.h"

@implementation HTSwitchLanguageViewManager

+ (UIView *)lgjeropj_rightContainerView {
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [[UIColor ht_colorWithHexString:@"#000000"] colorWithAlphaComponent:0.5];
    view.sjv_disappearDirection = MSViewDisappearAnimation_Right;
    return view;
}

+ (UIView *)lgjeropj_gradientContainerView {
    
    return [[UIView alloc] init];
}

+ (UIImageView *)lgjeropj_backArrowImg {
    
    UIImageView *view = [[UIImageView alloc] init];
    [view sd_setImageWithURL:kImageNumber(120)];
    return view;
}

+ (UILabel *)lgjeropj_subtitlesL {
   
    UILabel *view = [[UILabel alloc] init];
    view.text = LocalString(@"Switch language", nil);
    view.textColor = [UIColor whiteColor];
    view.font = [UIFont boldSystemFontOfSize:16];
    return view;
}

+ (UIButton *)lgjeropj_coverBtn {
    
    return [UIButton buttonWithType:UIButtonTypeCustom];
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
    [view registerClass:[HTSwitchLanguageCell class] forCellReuseIdentifier:NSStringFromClass([HTSwitchLanguageCell class])];
    return view;
}

+ (UIButton *)lgjeropj_cancelButton {

    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    [view setTitle:LocalString(@"CANCEL", nil) forState:UIControlStateNormal];
    return view;
}

+ (UIView *)lgjeropj_vertical_lineView {

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:.5];
    return view;
}

+ (UIBarButtonItem *)lgjeropj_backButton:(UIViewController *)target andIsWhite:(BOOL)isWhite {
    
    ZKBaseEdgeInsetButton *backButton = [ZKBaseEdgeInsetButton buttonWithType:UIButtonTypeCustom];
    [backButton sd_setImageWithURL:kImageNumber(120) forState:UIControlStateNormal];
    [backButton sd_setImageWithURL:kImageNumber(120) forState:UIControlStateHighlighted];
    [backButton setTitle:LocalString(@"Switch language", nil) forState:(UIControlStateNormal)];
    [backButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [backButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateHighlighted)];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0,0);
    backButton.imageTitleSpace = 10.0f;
    [backButton sizeToFit];
    SEL backAction = @selector(lgjeropj_backBtnClick);
    if ([target respondsToSelector:backAction]) {
        [backButton addTarget:target action:backAction forControlEvents:UIControlEventTouchUpInside];
    }
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

@end
