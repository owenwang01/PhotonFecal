






#import "UIView+VpEngagedElan.h"
#import <objc/runtime.h>


static char stticDesktopHome;

@implementation UIView (VpEngagedElan)
    
- (CGFloat)left{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)bsltEdit{
    CGRect trunctLoss = self.frame;
    trunctLoss.origin.x = bsltEdit;
    self.frame = trunctLoss;
}

- (CGFloat)right{
    return CGRectGetMaxX(self.frame);
}

-(void)setRight:(CGFloat)cnsumBeep{
    CGRect trunctLoss = self.frame;
    trunctLoss.origin.x = cnsumBeep - trunctLoss.size.width;
    self.frame = trunctLoss;
}

- (CGFloat)top{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)findMxtur{
    CGRect trunctLoss = self.frame;
    trunctLoss.origin.y = findMxtur;
    self.frame = trunctLoss;
}

- (CGFloat)bottom{
    return CGRectGetMaxY(self.frame);
}

- (void)setBottom:(CGFloat)cashCptur{
    CGRect trunctLoss = self.frame;
    trunctLoss.origin.y = cashCptur - trunctLoss.size.height;
    self.frame = trunctLoss;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect trunctLoss = self.frame;
    trunctLoss.origin.x = x;
    self.frame = trunctLoss;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    CGRect trunctLoss = self.frame;
    trunctLoss.origin.y = y;
    self.frame = trunctLoss;
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)scanMgntc{
    CGRect trunctLoss = self.frame;
    trunctLoss.size.width = scanMgntc;
    self.frame = trunctLoss;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)undrlnCard{
    CGRect trunctLoss = self.frame;
    trunctLoss.size.height = undrlnCard;
    self.frame = trunctLoss;
}

- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)tnsnSame{
    CGPoint rrrngUnit = self.center;
    rrrngUnit.x = tnsnSame;
    self.center = rrrngUnit;
}

- (CGFloat)centerY{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)thenTrnsfrm{
    CGPoint rrrngUnit = self.center;
    rrrngUnit.y = thenTrnsfrm;
    self.center = rrrngUnit;
}

- (CGPoint)jstlyScullerRootless{
    return CGPointMake(self.width / 2.f, self.height / 2.f);
}

- (CGFloat)kraalHolographDoor{
    return self.width / 2.f;
}

- (CGFloat)selfLassDesertion{
    return self.height / 2.f;
}

- (CGPoint)origin{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)stndrdNear{
    CGRect trunctLoss = self.frame;
    trunctLoss.origin = stndrdNear;
    self.frame = trunctLoss;
}

- (CGSize)size{
    return self.frame.size;
}

- (void)setSize:(CGSize)freeGnst{
    CGRect trunctLoss = self.frame;
    trunctLoss.size = freeGnst;
    self.frame = trunctLoss;
}

- (void)setCornerRadius:(CGFloat)fastPrctc
{
    self.layer.cornerRadius = fastPrctc;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

- (void)typhnSprinkleKulfi:(dsignKeyboardCordBlock)zoomFlur
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *modeCnfgur = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nstatedMouldySculler:)];
    [self addGestureRecognizer:modeCnfgur];
    objc_setAssociatedObject(self, &stticDesktopHome, zoomFlur, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}
- (void)nstatedMouldySculler:(UITapGestureRecognizer*)cmpnyMach
{
    if (cmpnyMach.state == UIGestureRecognizerStateRecognized)
    {
        dsignKeyboardCordBlock zoomFlur = objc_getAssociatedObject(self, &stticDesktopHome);
        if (zoomFlur)
        {
            zoomFlur(cmpnyMach);
        }
    }
}

+ (void)tfitterUntouchedDoom:(UIView *)ncrsTone andWrngCertainOmit:(CGRect)trunctLoss
{
    
    for(CALayer *layer in ncrsTone.layer.sublayers){
        if([layer isKindOfClass:[CAGradientLayer class]]){
            [layer removeFromSuperlayer];
        }
    }
    
    CAGradientLayer *pastNtwrk = [CAGradientLayer layer];
    pastNtwrk.colors = @[(__bridge id)[UIColor swipeScabiesNomad:@"#000000"].CGColor, (__bridge id)[UIColor swipeScabiesNomad:@"#000000"].CGColor];
    pastNtwrk.locations = @[@0, @1.0];
    pastNtwrk.startPoint = CGPointMake(0, 0);
    pastNtwrk.endPoint = CGPointMake(0.0, 1);
    pastNtwrk.frame = trunctLoss;
        
    [ncrsTone.layer addSublayer:pastNtwrk];
}

+ (void)tfitterUntouchedDoom:(UIView *)ncrsTone andChrtArgumentHere:(UIColor *)lthughAway andSprdUnderlineNote:(UIColor *)giveCnflct andSincProduceHalf:(micrUnknownDesk)rrrngTurn{
    for(CALayer *layer in ncrsTone.layer.sublayers){
        if([layer isKindOfClass:[CAGradientLayer class]]){
            [layer removeFromSuperlayer];
        }
    }
    CAGradientLayer *holdUndrln = [CAGradientLayer layer];
    holdUndrln.frame = CGRectMake(0, 0, ncrsTone.frame.size.width, ncrsTone.frame.size.height);
    
    if(rrrngTurn == ntilIntegrateMany){
        holdUndrln.startPoint = CGPointMake(0.5, 0);
        holdUndrln.endPoint = CGPointMake(0.5, 1);

    }else{
        holdUndrln.startPoint = CGPointMake(0, 0.5);
        holdUndrln.endPoint = CGPointMake(1, 0.5);

    }
    holdUndrln.colors = @[(__bridge id)lthughAway.CGColor, (__bridge id)giveCnflct.CGColor];
    holdUndrln.locations = @[@(0), @(1.0f)];
    [ncrsTone.layer insertSublayer:holdUndrln atIndex:0];
}

@end