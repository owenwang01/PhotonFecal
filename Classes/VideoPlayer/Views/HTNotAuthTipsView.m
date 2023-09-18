//
//  HTNotAuthTipsView.m
// 
//
//  Created by Apple on 2023/3/3.
//  Copyright © 2023 Apple. All rights reserved.
//

#import "HTNotAuthTipsView.h"

@interface HTNotAuthTipsView ()

@end

@implementation HTNotAuthTipsView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self lgjeropj_setupSubviews];
    }
    return self;
}

- (void)lgjeropj_setupSubviews {
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor ht_colorWithHexString:@"#232331"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton sd_setImageWithURL:kImageNumber(120) forState:UIControlStateNormal];
    [backButton setTitle:@"" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    //backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0,0);
    [backButton addTarget:self action:@selector(lk_backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    backButton.frame = CGRectMake(0, 0, kBarHeight*0.8, kBarHeight*0.8);
    [self addSubview:backButton];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    contentLabel.backgroundColor = [UIColor clearColor];
    contentLabel.textColor = [UIColor ht_colorWithHexString:@"#ECECEC"];
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.numberOfLines = 0;
    contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(kBarHeight*0.8, 45, 20, 45));
    }];
    contentLabel.text = LocalString(@"Due to the request of the copyright owner, the video is not available for playback", nil);
}

- (void)lk_backBtnClick{
    [[UIViewController lgjeropj_currentViewController].navigationController popViewControllerAnimated:YES];
}

@end
