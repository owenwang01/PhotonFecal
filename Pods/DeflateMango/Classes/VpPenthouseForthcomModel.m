







#import "VpPenthouseForthcomModel.h"
#import "SondalikBalletModel.h"

@implementation VpPenthouseForthcomModel

+ (NSDictionary *)mj_objectClassInArray{
    NSDictionary *pairMnmum = [self mj_replacedKeyFromPropertyName];
    __block NSString *rdySentenceMuch = @"277";
    __block NSString *chckRequestSlow =  @"273";
    __block NSString *ppndSupposeLess =  @"249";
    __block NSString *chnkAccidentWell =  @"list";
    [pairMnmum enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:rdySentenceMuch]) {
            rdySentenceMuch = key;
        }
        if ([obj isEqualToString:chckRequestSlow]) {
            chckRequestSlow = key;
        }
        if ([obj isEqualToString:ppndSupposeLess]) {
            ppndSupposeLess = key;
        }
        if ([obj isEqualToString:chnkAccidentWell]) {
            chnkAccidentWell = key;
        }
    }];
    return @{rdySentenceMuch : [SondalikBalletModel class] , chckRequestSlow:[SondalikBalletModel class], ppndSupposeLess:[SondalikBalletModel class], chnkAccidentWell:[SondalikBalletModel class]};
}

- (NSMutableArray *)simplSnapshotLoss{
    if(self.thirdPlatformFree && self.thirdPlatformFree.count > 0){
        return self.thirdPlatformFree;
    }
    if(self.windwAnywhereHuge && self.windwAnywhereHuge.count > 0){
        return self.windwAnywhereHuge;
    }
    if(self.list && self.list.count > 0){
        return self.list;
    }
    return self.bjctDocumentHome;
}

@end