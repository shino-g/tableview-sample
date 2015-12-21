#import "MainViewController.h"
#import "DetailViewController.h"

@implementation MainViewController
{
    MainTableViewController *mainTableViewController;
    ModelList *modelList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mainTableViewController = [[MainTableViewController alloc] init];
    mainTableViewController.MainTableDelegate = self;
    [self addChildViewController:mainTableViewController];
    
    UIToolbar * toolbar         = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 15, self.view.bounds.size.width, 50)];

    UIBarButtonItem * labelBtn  = [[UIBarButtonItem alloc] initWithTitle:@"Sample Test" style:UIBarButtonItemStylePlain target:self action:nil];
    [labelBtn setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:14.0f]} forState:UIControlStateNormal];
    
    UIBarButtonItem * speceBtn  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem * addBtn   = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector( addTap: )];
    
    toolbar.items               = @[ mainTableViewController.editButtonItem, speceBtn, labelBtn, speceBtn, addBtn ];
    mainTableViewController.view.frame = CGRectMake(0, toolbar.frame.size.height + toolbar.frame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height - (toolbar.frame.size.height + toolbar.frame.origin.y) );
    
    
    modelList             = [[ModelList alloc] init];
    mainTableViewController.cellList = [modelList getList];
    
    [self.view addSubview:mainTableViewController.view];
    [self.view addSubview:toolbar];
    
}

- (void)didSelectCell:(ModelDetail *)model_detail
{
    DetailViewController *detaiView = [[DetailViewController alloc] init:model_detail];
    [self presentViewController:detaiView animated:YES completion:nil];

}


- (void)delTap:(id)inSender
{
    return;
}

- (void)addTap:(id)inSender
{
    mainTableViewController.cellList = [modelList addItem];
    [mainTableViewController.tableView reloadData];
    return;
}

- (void)deleteSelectCell:(int)i
{
    mainTableViewController.cellList = [modelList delItem:i];
    [mainTableViewController.tableView reloadData];
    return;
}


@end
