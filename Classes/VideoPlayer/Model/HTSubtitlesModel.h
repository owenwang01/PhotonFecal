//
//  HTSubtitlesModel.h
// 
//
//  Created by Apple on 2022/11/29.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "FLBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTSubtitlesModel : FLBaseModel

@property (nonatomic, assign) NSTimeInterval startTime;
@property (nonatomic, assign) NSTimeInterval endTime;
@property (nonatomic, strong) NSMutableArray *subtitles;
@property (nonatomic, copy) NSMutableAttributedString *var_attributedStr;

@end


NS_ASSUME_NONNULL_END
