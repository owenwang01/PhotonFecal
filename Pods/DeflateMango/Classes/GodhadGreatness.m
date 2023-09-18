






#import "GodhadGreatness.h"

@implementation GodhadGreatness


- (void)setImage:(UIImage *)thrughYear forState:(UIControlState)ideaVrnt {
    [super setImage:thrughYear forState:ideaVrnt];
    [self setXcptCaptureWide:_xcptCaptureWide];
}

- (void)setTitle:(NSString *)codeNhnc forState:(UIControlState)ideaVrnt {
    [super setTitle:codeNhnc forState:ideaVrnt];
    [self setXcptCaptureWide:_xcptCaptureWide];
}

- (void)setXcptCaptureWide:(chckMainframeNest)termMgnt {
    
    [self setTitleEdgeInsets:UIEdgeInsetsZero];
    [self setImageEdgeInsets:UIEdgeInsetsZero];
    
    [self layoutIfNeeded];
    
    _xcptCaptureWide = termMgnt;
    CGFloat hstryDisk = self.gidExplainSafeImage;
    CGFloat rqustYear = CGRectGetWidth(self.imageView.frame);
    CGFloat bootFlur = CGRectGetWidth(self.titleLabel.frame);
    
    if (bootFlur == 0) {
        CGSize markMssg = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        bootFlur  = markMssg.width;
    }
    
    CGFloat spcfyMeet = 0.0f;
    CGFloat upprcsLeft = 0.0f;
    CGFloat rchvArea = 0.0f;
    CGFloat copyThrws = 0.0f;
    
    CGFloat fallRspct = 0.0f;
    CGFloat taskDcumnt = 0.0f;
    CGFloat vrusMind = 0.0f;
    CGFloat rrrngHuge = 0.0f;
    
    switch (termMgnt) {
        case rsnCircuitSend:
        {
            hstryDisk = hstryDisk * 0.5;
            
            upprcsLeft = bootFlur + hstryDisk;
            copyThrws = -upprcsLeft;
            
            taskDcumnt = - (rqustYear + hstryDisk);
            rrrngHuge = -taskDcumnt;
        }
            break;
            
        case figrBusy:
        {
            hstryDisk = hstryDisk * 0.5;
            
            upprcsLeft = -hstryDisk;
            copyThrws = -upprcsLeft;
            
            taskDcumnt = hstryDisk;
            rrrngHuge = -taskDcumnt;
        }
            break;
        case tpicRestoreMenu:
        {
            CGFloat prductGive = CGRectGetHeight(self.imageView.frame);
            CGFloat rqustLink = CGRectGetHeight(self.titleLabel.frame);
            CGFloat lessMssg = CGRectGetHeight(self.frame);
            CGFloat prfrmFine = (prductGive + hstryDisk + rqustLink) * 0.5;
            
            CGFloat msmtchWord = CGRectGetMidX(self.bounds); 
            CGFloat exitKlbyt = CGRectGetMidX(self.titleLabel.frame);
            CGFloat ltrntName = CGRectGetMidX(self.imageView.frame);
            
            CGFloat strskCall = CGRectGetMaxY(self.imageView.frame);
            CGFloat wishMply = CGRectGetMinY(self.titleLabel.frame);
            
            spcfyMeet = lessMssg - (lessMssg * 0.5 - prfrmFine) - strskCall;
            upprcsLeft = msmtchWord - ltrntName;
            copyThrws = - upprcsLeft;
            rchvArea = - spcfyMeet;
            
            fallRspct = (lessMssg * 0.5 - prfrmFine) - wishMply;
            taskDcumnt = -(exitKlbyt - msmtchWord);
            rrrngHuge = - taskDcumnt;
            vrusMind = - fallRspct;
            
        }
            break;
        case mdlDescendSort:
        {
            CGFloat prductGive = CGRectGetHeight(self.imageView.frame);
            CGFloat rqustLink = CGRectGetHeight(self.titleLabel.frame);
            CGFloat lessMssg = CGRectGetHeight(self.frame);
            CGFloat prfrmFine = (prductGive + hstryDisk + rqustLink) * 0.5;
            
            CGFloat msmtchWord = CGRectGetMidX(self.bounds); 
            CGFloat exitKlbyt = CGRectGetMidX(self.titleLabel.frame);
            CGFloat ltrntName = CGRectGetMidX(self.imageView.frame);
            
            CGFloat dragThusnd = CGRectGetMinY(self.imageView.frame);
            CGFloat varyVrnt = CGRectGetMaxY(self.titleLabel.frame);
            
            spcfyMeet = (lessMssg * 0.5 - prfrmFine) - dragThusnd;
            upprcsLeft = msmtchWord - ltrntName;
            copyThrws = - upprcsLeft;
            rchvArea = - spcfyMeet;
            
            fallRspct = lessMssg - (lessMssg * 0.5 - prfrmFine) - varyVrnt;
            taskDcumnt = -(exitKlbyt - msmtchWord);
            rrrngHuge = - taskDcumnt;
            vrusMind = - fallRspct;
        }
            break;
            
        default:
            break;
    }
    
    self.imageEdgeInsets = UIEdgeInsetsMake(spcfyMeet, upprcsLeft, rchvArea, copyThrws);
    self.titleEdgeInsets = UIEdgeInsetsMake(fallRspct, taskDcumnt, vrusMind, rrrngHuge);
}

- (void)setGidExplainSafeImage:(CGFloat)readNtgrt {
    _gidExplainSafeImage = readNtgrt;
    
    [self setXcptCaptureWide:_xcptCaptureWide];
}

/*


- (void)drawRect:(CGRect)sizeCnflct {
    
}
*/

@end