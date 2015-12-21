#import <UIKit/UIKit.h>
#import "ModelDetail.h"

@protocol MainTableDelegate<NSObject>

- (void)didSelectCell:(ModelDetail *)model_detail;
- (void)deleteSelectCell:(int)i;

@end


@interface MainTableViewController : UITableViewController
{
    NSArray *cellList;
}


@property (nonatomic) NSArray *cellList;

@property (weak, readwrite) id<MainTableDelegate> MainTableDelegate;


@end
