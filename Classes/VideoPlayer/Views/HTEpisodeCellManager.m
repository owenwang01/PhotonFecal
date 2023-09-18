//
//  HTEpisodeCellManager.m
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import "HTEpisodeCellManager.h"

@implementation HTEpisodeCellManager

+ (UIView *)lgjeropj_backView {

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor ht_colorWithHexString:@"#2C2C3F"];
    return view;
}

+ (UILabel *)lgjeropj_titleLabel {

    UILabel *view = [[UILabel alloc] init];
    view.text = [NSString stringWithFormat:@"%@ %@", LocalString(@"EPS", nil), @"1"];
    view.textColor = [UIColor whiteColor];
    view.font = [UIFont boldSystemFontOfSize:16];
    return view;
}

+ (UILabel *)lgjeropj_descriptionLabel {

    UILabel *view = [[UILabel alloc] init];
    view.text = AsciiString(@"When van helsing’s mysterious invention myster ious when van helsing’s mysterious invention myster ious...");
    view.textColor = [UIColor whiteColor];
    view.font = [UIFont systemFontOfSize:14];
    return view;
}
@end
