//
//  HTMoviePlayerViewModel.h
// 
//
//  Created by Apple on 2022/11/26.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTVideoPlayerViewModel.h"
#import "HTMoviePlayDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HTMoviePlayerViewModel : HTVideoPlayerViewModel

@property (nonatomic, strong) RACCommand *var_requestMovieData;
@property (nonatomic, strong) HTMoviePlayDetailModel *mData;

@end

NS_ASSUME_NONNULL_END
