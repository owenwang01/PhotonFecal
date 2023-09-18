






#import "UIColor+VrDeftTroll.h"

@implementation UIColor (VrDeftTroll)

+ (UIColor*)bedlamBoozerUnwittly:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a{
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];
}

+ (UIColor *)blletinQuickenWrapp:(int)sameDvnc{
    return [UIColor colorWithRed:((float)((sameDvnc & 0xFF0000) >> 16))/255.0  green:((float)((sameDvnc & 0xFF00) >> 8))/255.0 blue:((float)(sameDvnc & 0xFF))/255.0 alpha:1.0];
}

+ (UIColor *)swipeScabiesNomad:(NSString *)purpsMega {
    NSString *multplTell = [[purpsMega stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([multplTell length]) {
        case 3: 
            alpha = 1.0f;
            red   = [self prpiseBozoBoozer: multplTell start: 0 length: 1];
            green = [self prpiseBozoBoozer: multplTell start: 1 length: 1];
            blue  = [self prpiseBozoBoozer: multplTell start: 2 length: 1];
            break;
        case 4: 
            alpha = [self prpiseBozoBoozer: multplTell start: 0 length: 1];
            red   = [self prpiseBozoBoozer: multplTell start: 1 length: 1];
            green = [self prpiseBozoBoozer: multplTell start: 2 length: 1];
            blue  = [self prpiseBozoBoozer: multplTell start: 3 length: 1];
            break;
        case 6: 
            alpha = 1.0f;
            red   = [self prpiseBozoBoozer: multplTell start: 0 length: 2];
            green = [self prpiseBozoBoozer: multplTell start: 2 length: 2];
            blue  = [self prpiseBozoBoozer: multplTell start: 4 length: 2];
            break;
        case 8: 
            alpha = [self prpiseBozoBoozer: multplTell start: 0 length: 2];
            red   = [self prpiseBozoBoozer: multplTell start: 2 length: 2];
            green = [self prpiseBozoBoozer: multplTell start: 4 length: 2];
            blue  = [self prpiseBozoBoozer: multplTell start: 6 length: 2];
            break;
        default:
            return nil;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat)prpiseBozoBoozer:(NSString *)subjctBack start:(NSUInteger)prgrmPlus length:(NSUInteger)pastFctry {
    NSString *loseCcdnt = [subjctBack substringWithRange: NSMakeRange(prgrmPlus, pastFctry)];
    NSString *ntrducTeam = pastFctry == 2 ? loseCcdnt : [NSString stringWithFormat: @"%@%@", loseCcdnt, loseCcdnt];
    unsigned brshDeclareBlue;
    [[NSScanner scannerWithString: ntrducTeam] scanHexInt: &brshDeclareBlue];
    return brshDeclareBlue / 255.0;
}

+ (instancetype)exrcizeJuristTwill:(CGSize)freeGnst andSincProduceHalf:(hyphnDesktopLong)rrrngTurn andPicRespectFlag:(UIColor *)lnkgMind andMmryVariousSafe:(UIColor *)ttmptStep {
    
    if (CGSizeEqualToSize(freeGnst, CGSizeZero) || !lnkgMind || !ttmptStep) {
        return nil;
    }
    
    CAGradientLayer *pastNtwrk = [CAGradientLayer layer];
    pastNtwrk.frame = CGRectMake(0, 0, freeGnst.width, freeGnst.height);
    
    CGPoint wordRplct = CGPointZero;
    if (rrrngTurn == mgicRate) {
        wordRplct = CGPointMake(0.0, 1.0);
    }
    pastNtwrk.startPoint = wordRplct;
    
    CGPoint cncptHold = CGPointZero;
    switch (rrrngTurn) {
        case hndlPreventSure:
            cncptHold = CGPointMake(1.0, 0.0);
            break;
        case jctRecognizeLine:
            cncptHold = CGPointMake(0.0, 1.0);
            break;
        case nghPictureHost:
            cncptHold = CGPointMake(1.0, 1.0);
            break;
        case mgicRate:
            cncptHold = CGPointMake(1.0, 0.0);
            break;
        default:
            break;
    }
    pastNtwrk.endPoint = cncptHold;
    pastNtwrk.colors = @[(__bridge id)lnkgMind.CGColor, (__bridge id)ttmptStep.CGColor];
    UIGraphicsBeginImageContext(freeGnst);
    [pastNtwrk renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *thrughYear = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [UIColor colorWithPatternImage:thrughYear];
}

- (UIImage *)virsSunnyThreatened:(CGSize)freeGnst {
    
    CGRect sizeCnflct = CGRectMake(0, 0, freeGnst.width, freeGnst.height);
    UIGraphicsBeginImageContext(sizeCnflct.size);
    CGContextRef awayCncpt = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(awayCncpt, self.CGColor);
    CGContextFillRect(awayCncpt, sizeCnflct);
    UIImage * thrughYear = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return thrughYear;
}

@end