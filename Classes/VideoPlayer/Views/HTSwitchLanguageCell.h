//
//  HTSwitchLanguageCell.h
// 
//
//  Created by dn on 2023/1/28.
//  Copyright © 2023 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTSwitchLanguageCell : UITableViewCell

@property (nonatomic, copy) NSString *cellText;
- (void)switchLanguageCellSelected:(BOOL)isSelected;

@end

NS_ASSUME_NONNULL_END
