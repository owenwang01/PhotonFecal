//
//  HTEpisodeTableCell.h
// 
//
//  Created by Apple on 2022/11/18.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTVPlayDetailEpsListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTEpisodeTableCell : UITableViewCell

- (void)ht_updateCellWithData:(HTTVPlayDetailEpsListModel *)data;

- (void)lgjeropj_setCellTextColor:(BOOL)isSelected;

@end

NS_ASSUME_NONNULL_END
