







#import "DstrctiblEnrollModel.h"
#import "VrPersistentlyModel.h"

@implementation DstrctiblEnrollModel

+ (NSDictionary *)mj_objectClassInArray{
    
    NSDictionary *pairMnmum = [self mj_replacedKeyFromPropertyName];
    __block NSString *srchEmphasizeQuit = @"174";
    [pairMnmum enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:srchEmphasizeQuit]) {
            srchEmphasizeQuit = key;
        }
    }];
    return @{srchEmphasizeQuit : [VrPersistentlyModel class]};
}

@end