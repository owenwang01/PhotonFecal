






#import <UIKit/UIKit.h>

@class BasqHeliotrope;

@protocol srcSeamlessDiskDelegate <NSObject>

@optional

/**
 输入完成的回调
 @param textField textField
 */
- (void)textFieldDidBeginEditing:(BasqHeliotrope *)quitPcfc;
- (void)textFieldDidEndEditing:(BasqHeliotrope *)quitPcfc;
- (BOOL)textFieldShouldBeginEditing:(BasqHeliotrope *)quitPcfc;
- (BOOL)textFieldShouldReturn:(BasqHeliotrope *)quitPcfc;
- (BOOL)textField:(UITextField *)quitPcfc shouldChangeCharactersInRange:(NSRange)manyTtmpt replacementString:(NSString *)subjctBack;

- (void)blndNearsidePederast:(BasqHeliotrope *)quitPcfc errorMsg:(NSString *)nclsStep;
- (void)peratinTankerMilord:(BasqHeliotrope *)quitPcfc;

@end


@interface BasqHeliotrope : UITextField<UITextFieldDelegate>

@property (nonatomic, weak) id<srcSeamlessDiskDelegate> schmAlreadyTree;




@property (nonatomic, assign)IBInspectable NSInteger nlssGraphicGrey;

@property (nonatomic,copy)NSString *nlgExcludeGain;


@property (nonatomic,copy)NSString *regex;


@property (nonatomic,copy)NSString *insidContactVice;


@property (nonatomic, copy) void(^rmrkConsolePathBlock)(BasqHeliotrope *textField, NSString *errorMsg);

@end

