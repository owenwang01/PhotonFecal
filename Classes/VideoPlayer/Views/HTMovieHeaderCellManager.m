//
//  HTMovieHeaderCellManager.m
//  GuessNums
//
//  Created by 李雪健 on 2023/6/16.
//

#import "HTMovieHeaderCellManager.h"

@implementation HTMovieHeaderCellManager

+ (UILabel *)lgjeropj_titleLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.text = @"";
    view.textColor = [UIColor whiteColor];
    view.font = [UIFont boldSystemFontOfSize:18];
    return view;
}

+ (UIView *)lgjeropj_starContentView {
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    view.hidden = YES;
    return view;
}

+ (UILabel *)lgjeropj_scoreLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.text = @"0.0";
    view.textColor = [UIColor ht_colorWithHexString:@"#FFCC48"];
    view.font = [UIFont boldSystemFontOfSize:14];
    return view;
}

+ (UILabel *)lgjeropj_locationLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.text = @"";
    view.textColor = [UIColor whiteColor];
    view.font = [UIFont systemFontOfSize:14];
    return view;
}

+ (UILabel *)lgjeropj_filmTypeLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.text = @"";
    view.textColor = [UIColor ht_colorWithHexString:@"#999999"];
    view.font = [UIFont systemFontOfSize:14];
    view.numberOfLines = 0;
    return view;
}

+ (UILabel *)lgjeropj_filmStarsLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.text = @"";
    view.textColor = [UIColor ht_colorWithHexString:@"#999999"];
    view.font = [UIFont systemFontOfSize:14];
    view.numberOfLines = 0;
    return view;
}

+ (UILabel *)lgjeropj_infoLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.text = @"";
    view.textColor = [UIColor whiteColor];
    view.font = [UIFont boldSystemFontOfSize:16];
    view.hidden = YES;
    return view;
}

+ (UILabel *)lgjeropj_infoContentLabel {
    
    UILabel *view = [[UILabel alloc] init];
    view.text = @"";
    view.numberOfLines = 0;
    view.textColor = [UIColor ht_colorWithHexString:@"#999999"];
    view.font = [UIFont systemFontOfSize:14];
    view.numberOfLines = 0;
    return view;
}

+ (UIButton *)lgjeropj_downArrowButton {
    
    UIButton *view = [UIButton buttonWithType:UIButtonTypeCustom];
    [view sd_setImageWithURL:kImageNumber(11) forState:UIControlStateNormal];
    return view;
}

+ (UIView *)lgjeropj_bottomView {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

+ (HCSStarRatingView *)lgjeropj_starView {
    
    HCSStarRatingView *view = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(0, 0, 110, 20)];
    view.backgroundColor = [UIColor clearColor];
    view.maximumValue = 5;
    view.minimumValue = 0;
    view.value = 0;
    view.tintColor = [UIColor ht_colorWithHexString:@"#FFCC48"];
    view.allowsHalfStars = YES;
    view.userInteractionEnabled = NO;
    return view;
}


@end
