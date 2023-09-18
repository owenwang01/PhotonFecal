//
//  HTSubTitlesUtils.m
// 
//
//  Created by Apple on 2022/11/25.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HTSubTitlesUtils.h"

@interface HTSubTitlesUtils ()
@property (nonatomic, copy) NSString *subStr;
@property (nonatomic, strong) NSMutableArray *subTitleModels;
@property (nonatomic, strong) NSMutableArray *subTitleModelsCopy;
@property (nonatomic, assign) NSInteger minusCount;
@property (nonatomic, assign) NSInteger plusCount;
@end

@implementation HTSubTitlesUtils

- (instancetype)init{
    self = [super init];
    if(self){
        self.total = 0.0;
    }
    return self;
}

- (NSMutableArray *)ht_getSubtitles:(NSString *)orininStr {
    NSArray *singleArray = [orininStr componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSMutableArray *secondArray = [NSMutableArray array];
    NSMutableArray *newArray = [NSMutableArray new];
    for (int i = 0; i < singleArray.count; i++) {
        NSString *tStr = singleArray[i];
        if (![tStr isEqualToString:@""]) {
            [newArray addObject:singleArray[i]];
        } else {
            [secondArray addObject:newArray];
            newArray = [NSMutableArray array];
        }
    }
    
    for (NSMutableArray *newArray in secondArray) {
        HTSubtitlesModel *var_tempModel = [[HTSubtitlesModel alloc] init];
        for (NSString *tStr in newArray) {
            if (tStr.length <= 1) continue;
            if ([NSString ht_isNumber:tStr]) continue;
            [self lgjeropj_getBeginTimeAndEndTime:tStr andSubtitleModel:var_tempModel];
        }
        NSString *string = [var_tempModel.subtitles componentsJoinedByString:@" "];
        var_tempModel.var_attributedStr = [self ht_setSubtitleAttributed:string];
        [self.subTitleModels addObject:var_tempModel];
    }
    self.subTitleModelsCopy = [self deepCopyWithModels:self.subTitleModels];
    return self.subTitleModels;
}

- (NSMutableArray *)deepCopyWithModels:(NSMutableArray *)modelArray{
    NSMutableArray *result = @[].mutableCopy;
    for (HTSubtitlesModel *var_tempModel in modelArray) {
        HTSubtitlesModel *model = [[HTSubtitlesModel alloc] init];
        model.startTime = var_tempModel.startTime;
        model.endTime = var_tempModel.endTime;
        model.subtitles = var_tempModel.subtitles;
        model.var_attributedStr = var_tempModel.var_attributedStr;
        [result addObject:model];
    }
    return result;
}

- (NSArray *)adjustSubtitleTimeWithType:(ENUM_AdjustType)type {
    
    switch (type) {
        case ENUM_AdjustTypeLastRow:

            break;
        case ENUM_AdjustTypeMinus: {
            return [self minusSubtitles];
        }
            break;
        case ENUM_AdjustTypeReset: {
            return [self resetSubtitles];
        }
            break;
        case ENUM_AdjustTypePlus: {
            return [self plusSubtitles];
        }
            break;
        case ENUM_AdjustTypeNextRow:

            break;
    }
    return [NSArray array];
}

// 注意，如果字幕过早显示（比实际快），说明字幕的时间小于实际，所以要加
- (NSMutableArray *)minusSubtitles {
    self.total -= 0.5;//记录页面操作总数
    NSMutableArray *var_tempArr = [NSMutableArray array];
    for (HTSubtitlesModel *var_tempModel in self.subTitleModelsCopy) {
        NSTimeInterval startTime = var_tempModel.startTime + 0.5;
        NSTimeInterval endTime = var_tempModel.endTime + 0.5;
        MSSubtitleItem *item = [[MSSubtitleItem alloc] initWithContent:var_tempModel.var_attributedStr start:startTime end:endTime];
        [var_tempArr addObject:item];
        
        //自己也要改变，否则下次还是从原始基础加或者减
        var_tempModel.startTime = startTime;
        var_tempModel.endTime = endTime;
    }
    return var_tempArr;
}

// 注意，如果字幕跟不上（比实际慢），说明字幕的时间大于实际，所以要减
- (NSMutableArray *)plusSubtitles {
    self.total += 0.5;//记录页面操作总数
    NSMutableArray *var_tempArr = [NSMutableArray array];
    for (HTSubtitlesModel *var_tempModel in self.subTitleModelsCopy) {
        NSTimeInterval startTime = var_tempModel.startTime - 0.5;
        NSTimeInterval endTime = var_tempModel.endTime - 0.5;
        MSSubtitleItem *item = [[MSSubtitleItem alloc] initWithContent:var_tempModel.var_attributedStr start:startTime end:endTime];
        [var_tempArr addObject:item];
        
        //自己也要改变，否则下次还是从原始基础加或者减
        var_tempModel.startTime = startTime;
        var_tempModel.endTime = endTime;
    }
    return var_tempArr;
}

- (NSMutableArray *)resetSubtitles {
    self.total = 0.0;
    NSMutableArray *var_tempArr = [NSMutableArray array];
    for (HTSubtitlesModel *var_tempModel in self.subTitleModels) {
        NSTimeInterval startTime = var_tempModel.startTime;
        NSTimeInterval endTime = var_tempModel.endTime;
        MSSubtitleItem *item = [[MSSubtitleItem alloc] initWithContent:var_tempModel.var_attributedStr start:startTime end:endTime];
        [var_tempArr addObject:item];
    }
    //重置已经操作过的字幕数据，做还原操作
    self.subTitleModelsCopy = [self deepCopyWithModels:self.subTitleModels];
    return var_tempArr;
}


- (NSMutableAttributedString *)ht_setSubtitleAttributed:(NSString *)string {
    NSMutableAttributedString *var_attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    [var_attributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, string.length)];
    [var_attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, string.length)];
    
    return var_attributeString;
}

//修复格式错误的字幕时间
- (NSString *)fixTime:(NSString *)time{
    NSString *result = time;
    if([time rangeOfString:@"."].location != NSNotFound){
        time = [time stringByReplacingOccurrencesOfString:@"." withString:@","];
        result = time;
    }
    NSArray *times = [time componentsSeparatedByString:@":"];
    if(times.count < 3){
        NSMutableArray *timesArray = [times mutableCopy];
        [timesArray insertObject:@"00" atIndex:0];
        NSString *fixTime = [timesArray componentsJoinedByString:@":"];
        return [self fixTime:fixTime];
    }
    return result;
}

// 获取开始结束时间
- (void)lgjeropj_getBeginTimeAndEndTime:(NSString *)timeStr andSubtitleModel:(HTSubtitlesModel *)model {
    
    NSRange range2 = [timeStr rangeOfString:@" --> "];
    if (range2.location != NSNotFound) {
        
        NSString *beginstr = [timeStr substringToIndex:range2.location];
        NSString *endstr = [timeStr substringFromIndex:range2.location+range2.length];
        beginstr = [self fixTime:beginstr];
        endstr = [self fixTime:endstr];
        
        NSArray * arr = [beginstr componentsSeparatedByString:@":"];
        NSArray * arr1 = [arr[2] componentsSeparatedByString:@","];
        if ([arr1 count] > 1) {
            //将开始时间数组中的时间换化成秒为单位的
            float teim=[arr[0] floatValue] * 60*60 + [arr[1] floatValue]*60 + [arr1[0] floatValue] + [arr1[1] floatValue]/1000;
            //NSNumber *beginnum = [NSNumber numberWithFloat:teim];
            model.startTime = teim;
        }
        NSArray * array = [endstr componentsSeparatedByString:@":"];
        NSArray * arr2 = [array[2] componentsSeparatedByString:@","];
        if ([arr2 count] > 1) {
            //将结束时间数组中的时间换化成秒为单位的
            float fl=[array[0] floatValue] * 60*60 + [array[1] floatValue]*60 + [arr2[0] floatValue] + [arr2[1] floatValue]/1000;
            model.endTime = fl;
        }
    }else{
        [self ht_getSubtitlesWith:timeStr andSubtitleModel:model];
    }
}

// 获取字幕
- (BOOL)ht_getSubtitlesWith:(NSString *)origin andSubtitleModel:(HTSubtitlesModel *)model {
    NSPredicate *pred = [NSPredicate predicateWithFormat:AsciiString(@"SELF MATCHES %@"), AsciiString(@"(/^[0-9]*$/)")];
    BOOL var_isMatch = [pred evaluateWithObject:origin];
    
    if (!var_isMatch) {
        [model.subtitles addObject:origin];
    }
    
    return var_isMatch;
}

- (NSMutableArray *)subTitleModels {
    if (!_subTitleModels) {
        _subTitleModels = [NSMutableArray array];
    }
    
    return _subTitleModels;
}

@end
