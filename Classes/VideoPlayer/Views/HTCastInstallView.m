//
//  HTCastInstallView.m
//  Axcolly
//
//  Created by 李雪健 on 2023/6/30.
//

#import "HTCastInstallView.h"

@interface HTCastInstallView ()

@property (nonatomic, strong) UIControl *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, copy) dispatch_block_t var_after;

@end

@implementation HTCastInstallView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self lgjeropj_addSubViews];
    }
    return self;
}

- (void)lgjeropj_addSubViews {
    
    [self addTarget:self action:@selector(lgjeropj_cancelAction) forControlEvents:UIControlEventTouchUpInside];
 
    self.contentView = [[UIControl alloc] init];
    self.contentView.backgroundColor = [UIColor ht_colorWithHexString:@"#23252A"];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, SCREEN_WIDTH, 300) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(24, 24)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH, 300);
    maskLayer.path = maskPath.CGPath;
    self.contentView.layer.mask = maskLayer;
    [self.contentView addTarget:self action:@selector(lgjeropj_clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.contentView];
    
    NSDictionary *data = HTCommonConfiguration.lgjeropj_shared.BLOCK_airDictBlock();
    NSString *var_name = [data objectForKey:AsciiString(@"name")] ?: @"";
    NSString *var_content = AsciiString(@"Jumping to XXX");
    var_content = [var_content stringByReplacingOccurrencesOfString:AsciiString(@"XXX") withString:var_name];
    
    UIImageView *icon = [[UIImageView alloc] init];
    icon.layer.masksToBounds = YES;
    icon.layer.cornerRadius = 39;
    [icon sd_setImageWithURL:[NSURL URLWithString:data[AsciiString(@"logo")]]];
    [self.contentView addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(26);
        make.size.mas_equalTo(78);
    }];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.numberOfLines = 3;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];
    self.titleLabel.textColor = [UIColor ht_colorWithHexString:@"#FFD770"];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(icon.mas_bottom).offset(28);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH-40);
    }];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.text = var_content;
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
    self.contentLabel.textColor = [UIColor ht_colorWithHexString:@"#999999"];
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH-40);
    }];
}

- (void)lgjeropj_clickAction {
    
    __weak typeof(self) weakSelf = self;
    [self lgjeropj_dismiss:^{
        if (weakSelf.block) {
            weakSelf.block(1);
        }
    }];
}

- (void)lgjeropj_cancelAction {
    
    __weak typeof(self) weakSelf = self;
    [self lgjeropj_dismiss:^{
        [weakSelf lgjeropj_clickEvent:2];
        if (weakSelf.block) {
            weakSelf.block(0);
        }
    }];
}

- (void)lgjeropj_startTimer {
    
    if (!self.var_after) {
        __weak typeof(self) weakSelf = self;
        self.var_after = dispatch_block_create(0, ^{
            [weakSelf lgjeropj_clickAction];
        });
    }
    // 3秒执行自动跳转
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), self.var_after);
}

- (void)lgjeropj_clearTimer {
    
    if (self.var_after) {
        dispatch_block_cancel(self.var_after);
        self.var_after = nil;
    }
}

- (void)lgjeropj_showEvent {
    
    [HTPointEventManager ht_eventWithCode:@"tcpop_sh" andParams:@{}];
}

- (void)lgjeropj_clickEvent:(NSInteger)kid {
    
    [HTPointEventManager ht_eventWithCode:@"tcpop_cl" andParams:@{@"kid": @(kid)}];
}

- (void)lgjeropj_show:(NSString *)title {
    
    NSDictionary *data = HTCommonConfiguration.lgjeropj_shared.BLOCK_airDictBlock();
    NSString *var_name = [data objectForKey:AsciiString(@"name")] ?: @"";
    NSString *var_text = AsciiString(@"Install XXX APP to cast AAA");
    var_text = [var_text stringByReplacingOccurrencesOfString:AsciiString(@"XXX") withString:var_name];
    var_text = [var_text stringByReplacingOccurrencesOfString:AsciiString(@"AAA") withString:title ?: @""];
    self.titleLabel.text = var_text;
    [self layoutIfNeeded];
    // 埋点
    [self lgjeropj_showEvent];
    // 自动跳转
    [self lgjeropj_startTimer];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if ([self isDescendantOfView:window] == NO) {
        [window addSubview:self];
    }
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
    self.contentView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 300);
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.frame = CGRectMake(0, SCREEN_HEIGHT-300, SCREEN_WIDTH, 300);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        [self layoutIfNeeded];
    }];
}

- (void)lgjeropj_dismiss:(void(^)(void))completion {
    
    // 清除after
    [self lgjeropj_clearTimer];
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 300);
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (completion) completion();
        [self removeFromSuperview];
    }];
}

@end
