//
//  HTMoviePlayMaskView.m
// 
//
//  Created by Apple on 2023/3/4.
//  Copyright © 2023 Apple. All rights reserved.
//

#import "HTMoviePlayMaskView.h"
#import "HTAdViewManager.h"
#import "ZKBaseEdgeInsetButton.h"

@interface HTMoviePlayMaskView ()

//广告
@property (nonatomic, strong) HTAdView *adView;
@property (nonatomic, strong) UIView *adbgView;
@property (nonatomic, strong) UIView *buttonView;

@end

@implementation HTMoviePlayMaskView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self ht_addSubviews];
    }
    return self;
}

- (void)ht_addSubviews{
    self.userInteractionEnabled = YES;
    //self.backgroundColor = [UIColor greenColor];
    NSArray *titleArray = @[AsciiString(@"Remove all ads"), AsciiString(@"Unlock all movies"), AsciiString(@"Unlimited Screen Casting"), LocalString(@"Get Premium", nil)];
    NSArray *imageArray = @[kImageNumber(260).absoluteString, kImageNumber(261).absoluteString, kImageNumber(262).absoluteString, @""];
    NSMutableArray *buttonArray = @[].mutableCopy;
    UIImageView *buttonView = [[UIImageView alloc] initWithFrame:CGRectZero];
    buttonView.userInteractionEnabled = YES;
    [buttonView sd_setImageWithURL:kImageNumber(252)];
    [self addSubview:buttonView];
    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 60));
        make.top.left.right.mas_equalTo(0);
    }];
    self.buttonView = buttonView;
    for (int i = 0; i < titleArray.count; i++) {
        ZKBaseEdgeInsetButton *button = [[ZKBaseEdgeInsetButton alloc] initWithFrame:CGRectMake(0, 5, (SCREEN_WIDTH)*0.25, 55)];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        button.titleLabel.numberOfLines = 0;
        button.titleLabel.autoresizesSubviews = YES;
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitleColor:[UIColor ht_colorWithHexString:@"#685034"] forState:UIControlStateNormal];
        if(i== 0) {
            button.left = 0;
            button.width = (SCREEN_WIDTH)*0.20;
        } else if (i == 1) {
            button.left = (SCREEN_WIDTH)*0.20;
            button.width = (SCREEN_WIDTH)*0.20;
        } else if (i == 2) {
            button.left = (SCREEN_WIDTH)*0.40;
            button.width = (SCREEN_WIDTH)*0.26;
        } else if (i == 3) {
            button.left = (SCREEN_WIDTH)*0.66;
            button.width = (SCREEN_WIDTH)*0.38;
        }
        if(i == titleArray.count-1){
            button.titleLabel.font = [UIFont boldSystemFontOfSize:14.0f];
            button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
            button.edgeInsetsStyle = ENUM_ZKButtonEdgeInsetsStyleImageLeft;
        } else {
            button.titleLabel.numberOfLines = 2;
            button.titleLabel.adjustsFontSizeToFitWidth = YES;
            button.titleLabel.font = [UIFont systemFontOfSize:10.0f];
            button.edgeInsetsStyle = ENUM_ZKButtonEdgeInsetsStyleImageTop;
        }
        if(![NSString ht_isEmpty:imageArray[i]]){
            [button sd_setImageWithURL:[NSURL URLWithString:imageArray[i]] forState:UIControlStateNormal completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                button.imageTitleSpace = 3.0f;
            }];
        } else {
            button.imageTitleSpace = 3.0f;
        }
        
        [buttonView addSubview:button];
        [buttonArray addObject:button];
        button.tag = i;
        [button addTarget:self action:@selector(ht_buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self addSubview:self.adbgView];
    [self.adbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(kDevice_Is_iPad?728:320);
        make.height.mas_equalTo(kDevice_Is_iPad?90:50);
    }];
    HTAdView *bottomAdView = [HTAdViewManager lgjeropj_bannerAdView];
    [self.adbgView addSubview:bottomAdView];
    [bottomAdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    self.adView = bottomAdView;
    [self sendSubviewToBack:self.adbgView];
    buttonView.hidden = self.adbgView.hidden = YES;
}

- (void)ht_updateAdView{
    self.buttonView.hidden = self.adbgView.hidden = NO;
    if(!HTCommonConfiguration.lgjeropj_shared.BLOCK_vipBlock()){
        self.adbgView.hidden = NO;
        @weakify(self);
        [self.adView ht_loadAdWithIndex:0 andView:self andCloseButton:NO andCloseBlock:^(HTAdView * _Nonnull view, HTAdBaseModel * _Nonnull var_adViewModel, UIView * _Nonnull var_ownerView, NSInteger index) {
            
        } andLoadBlock:^(BOOL success) {
            @strongify(self);
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(kDevice_Is_iPad?150:110);
            }];
        }];
        
        [self.adbgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(kDevice_Is_iPad?90:50);
        }];
    }else{
        self.adbgView.hidden = YES;
        if(self.adView){
            [self.adView ht_hideBannerAdView];
        }
        [self.adbgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(0);
        }];
    }
}

- (void)ht_buttonAction:(ZKBaseEdgeInsetButton *)sender{
    if(self.BLOCK_buttonActionBlock){
        self.BLOCK_buttonActionBlock(sender);
    }
}

- (UIView *)adbgView {
    if (!_adbgView) {
        _adbgView = [[UIView alloc] init];
        //_adbgView.backgroundColor = [UIColor ht_colorWithHexString:@"#C0C0C0"];
    }
    
    return _adbgView;
}

@end
