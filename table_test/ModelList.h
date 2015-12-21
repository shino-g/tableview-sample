#import <Foundation/Foundation.h>
#import "ModelDetail.h"


@interface ModelList : NSObject

- (NSArray *)getList;
- (NSArray *)addItem;
- (NSArray *)delItem:(int)delNo;

@end