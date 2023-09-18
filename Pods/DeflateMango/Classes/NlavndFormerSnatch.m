






#import "NlavndFormerSnatch.h"

@implementation NlavndFormerSnatch

- (void)setSrisNetworkShutImage:(id)nullDsppr{
    _srisNetworkShutImage = nullDsppr;
    UIImageView *rsrvHard = [[UIImageView alloc] init];
    if ([nullDsppr isKindOfClass:[UIImage class]]) {
        rsrvHard.image = nullDsppr;
    } else if ([nullDsppr isKindOfClass:[NSURL class]]) {
        [rsrvHard sd_setImageWithURL:nullDsppr];
    } else if ([nullDsppr isKindOfClass:[NSString class]]) {
        rsrvHard.image = [UIImage imageNamed:nullDsppr];
    }
    self.leftView = rsrvHard;
    self.leftViewMode = UITextFieldViewModeAlways;
}


- (CGRect)leftViewRectForBounds:(CGRect)safePckg{
    CGRect sizeCnflct = [super leftViewRectForBounds:safePckg];
    sizeCnflct.origin.x += self.rstCenturyLeft;
    return sizeCnflct;
}


- (CGRect)textRectForBounds:(CGRect)safePckg{
    return CGRectInset(safePckg, CGRectGetMaxX(self.leftView.frame)+self.ppndUnderlineFine, 0);
}


- (CGRect)editingRectForBounds:(CGRect)safePckg{
    return CGRectInset(safePckg, CGRectGetMaxX(self.leftView.frame)+self.ppndUnderlineFine, 0);
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self bedlamCrinolineSans];
}

- (void) bedlamCrinolineSans{
    if(self.rrwForwardOnce){
        UIButton *easyDfult = [self kindScullerKnocker];
        if(!easyDfult){
            return;
        }
        easyDfult.tintColor = self.rrwForwardOnce;
        UIImage *xplnOmit = [easyDfult imageForState:UIControlStateNormal];
        UIImage *grntArchiveWare = [[self class] peafwlHauteurMender:xplnOmit
                                                                     tintColor:self.rrwForwardOnce];
        [easyDfult setImage:grntArchiveWare forState:UIControlStateHighlighted];
        [easyDfult setImage:grntArchiveWare forState:UIControlStateNormal];
    }
}

- (UIButton *) kindScullerKnocker{
    for(UIView *v in self.subviews){
        if([v isKindOfClass:[UIButton class]]){
            UIButton *easyDfult = (UIButton *) v;
            return easyDfult;
        }
    }
    return nil;
}

+ (UIImage *)peafwlHauteurMender:(UIImage *)thrughYear tintColor:(UIColor *)fontRchv{
    UIGraphicsBeginImageContextWithOptions(thrughYear.size, NO, 0.0);
    CGContextRef awayCncpt = UIGraphicsGetCurrentContext();
    CGRect sizeCnflct = (CGRect){ CGPointZero, thrughYear.size };
    CGContextSetBlendMode(awayCncpt, kCGBlendModeNormal);
    [thrughYear drawInRect:sizeCnflct];
    CGContextSetBlendMode(awayCncpt, kCGBlendModeSourceIn);
    [fontRchv setFill];
    CGContextFillRect(awayCncpt, sizeCnflct);
    UIImage *vrsnBoot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return vrsnBoot;
}



@end