//
//  HTSubTitlesUtils.h
// 
//
//  Created by Apple on 2022/11/25.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTSubtitlesModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ENUM_AdjustType) {
    ENUM_AdjustTypeLastRow,
    ENUM_AdjustTypeMinus,
    ENUM_AdjustTypeReset,
    ENUM_AdjustTypePlus,
    ENUM_AdjustTypeNextRow
};

@interface HTSubTitlesUtils : NSObject

@property (nonatomic, assign) CGFloat total;

- (NSMutableArray *)ht_getSubtitles:(NSString *)orininStr;

- (NSArray *)adjustSubtitleTimeWithType:(ENUM_AdjustType)type;

@end

NS_ASSUME_NONNULL_END
