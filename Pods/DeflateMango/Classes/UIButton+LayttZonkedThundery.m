







#import "UIButton+LayttZonkedThundery.h"

static NSUInteger const xpirFree = 20;
static NSUInteger const strngExplicitKeep  = 999;

@implementation UIButton (LayttZonkedThundery)

- (void)saceCaramelMender
{
    self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:0.4];
    self.enabled = NO;
    UIActivityIndicatorView *textStrg = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
  
    CGRect sizeCnflct = [self.currentTitle boundingRectWithSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:self.titleLabel.font} context:nil];
    CGSize p = CGRectIntegral(sizeCnflct).size;
    
    
    textStrg.frame = CGRectMake(self.bounds.size.width/2 + p.width/2 + xpirFree, self.bounds.size.height/2 - xpirFree/2, xpirFree, xpirFree);
    textStrg.tag = strngExplicitKeep;
    textStrg.hidesWhenStopped = YES;
    [self addSubview:textStrg];
    [textStrg startAnimating];
}

- (void)saceProfiteroleViand
{
    UIActivityIndicatorView *textStrg = (UIActivityIndicatorView *)[self viewWithTag:strngExplicitKeep];
    [textStrg removeFromSuperview];
    self.enabled = YES;
    self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:0.4*(5/2)];
}


@end