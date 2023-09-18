//
//  HTFullScreenPlayButtons.m
// 
//
//  Created by Apple on 2022/11/23.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTFullScreenPlayButtons.h"

@interface HTFullScreenPlayButtons ()
@property (nonatomic, strong) UIButton *backSeekBtn;
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, strong) UIButton *forwardBtn;
@end

@implementation HTFullScreenPlayButtons

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self ht_addSubviews];
    }
    return self;
}

- (void)ht_addSubviews {
    self.isPlaying = YES;
    [self addSubview:self.backSeekBtn];
    [self addSubview:self.playBtn];
    [self addSubview:self.forwardBtn];
    
    [self.backSeekBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.leading.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    
    [self.forwardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.trailing.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
}

- (void)show {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
    }];
    self.isShow = YES;
}

- (void)dismissAnimate:(BOOL)animate {
    if(animate){
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            self.isShow = NO;
        }];
    }else{
        [self removeFromSuperview];
        self.isShow = NO;
    }
}

- (void)switchPlayButtonStatus:(BOOL)isPlay {
    self.isPlaying = !isPlay;
    if (isPlay) {
        [_playBtn sd_setImageWithURL:kImageNumber(163) forState:UIControlStateNormal];
    } else {
        [_playBtn sd_setImageWithURL:kImageNumber(162) forState:UIControlStateNormal];
    }
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    CGPoint point = [touch locationInView:self];
    BOOL inside = [self pointInside:point withEvent:UIEventTypeTouches];
    if(inside && _isShow){
        return NO;
    }
    return YES;
}

#pragma mark -- lazy load
- (UIButton *)backSeekBtn {
    if (!_backSeekBtn) {
        _backSeekBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backSeekBtn sd_setImageWithURL:kImageNumber(161) forState:UIControlStateNormal];
        @weakify(self);
        [[_backSeekBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            if(self.playBtnBlock){
                self.playBtnBlock(ENUM_HTFullScreenButtonTypeBack);
            }
        }];
    }
    
    return _backSeekBtn;
}

- (UIButton *)playBtn {
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn sd_setImageWithURL:kImageNumber(162) forState:UIControlStateNormal];
        @weakify(self);
        [[_playBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            if(self.playBtnBlock){
                self.playBtnBlock(ENUM_HTFullScreenButtonTypePlayPause);
            }
        }];
    }
    
    return _playBtn;
}

- (UIButton *)forwardBtn {
    if (!_forwardBtn) {
        _forwardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forwardBtn sd_setImageWithURL:kImageNumber(164) forState:UIControlStateNormal];
        @weakify(self);
        [[_forwardBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            if(self.playBtnBlock){
                self.playBtnBlock(ENUM_HTFullScreenButtonTypeForward);
            }
        }];
    }
    return _forwardBtn;
}

@end
