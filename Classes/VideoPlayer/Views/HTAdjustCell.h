//
//  HTAdjustCell.h
// 
//
//  Created by dn on 2023/1/28.
//  Copyright © 2023 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTAdjustCell : UITableViewCell

@property (nonatomic, strong) UIColor *cellTextColor;
@property (nonatomic, copy) NSAttributedString *subtitleText;

@end

NS_ASSUME_NONNULL_END
