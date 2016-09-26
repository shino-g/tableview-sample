#import "MainTableViewController.h"
#import "MainTableViewCell.h"


static NSString* cellName = @"cell";


@implementation MainTableViewController

@synthesize cellList;


-(instancetype)init
{
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[MainTableViewCell class]  forCellReuseIdentifier:cellName];
}

#pragma mark - Table view data source

//table section count
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//table cell count
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return cellList.count;
}

//table cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    
    ModelDetail *model_detail  = cellList[ indexPath.row ];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *dateText = [formatter stringFromDate:model_detail.detailCreateDatetime];
    
    cell.textLabel.text        = model_detail.detailTtitle;
    cell.detailTextLabel.text  = dateText;
    cell.imageView.image       = model_detail.detailImage;
    return cell;
}

//table cell height
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


//select cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModelDetail *model_detail   = cellList[ indexPath.row ];
    if ([self.MainTableDelegate respondsToSelector:@selector(didSelectCell:)] )
    {
        [self.MainTableDelegate didSelectCell:model_detail];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        if ([self.MainTableDelegate respondsToSelector:@selector(didSelectCell:)] )
        {
            [self.MainTableDelegate deleteSelectCell:(int)indexPath.row ];
        }
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}


@end
