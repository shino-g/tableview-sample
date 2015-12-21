#import "DetailViewController.h"

@implementation DetailViewController
{
    ModelDetail *modelDetail;
}

- (instancetype)init:(ModelDetail *)model_detail
{
    if ( self )
    {
        modelDetail = model_detail;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIToolbar * toolbar       = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 15, self.view.bounds.size.width, 50)];
    UIBarButtonItem *backBtn  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:nil action:@selector( backView )];
    
    UILabel *titleLabel       = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    titleLabel.text           = modelDetail.detailTtitle;
    UIBarButtonItem *titleBtn = [[UIBarButtonItem alloc] initWithCustomView:titleLabel];

    UIBarButtonItem * speceBtn  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

    
    toolbar.items               = @[ backBtn, speceBtn, titleBtn ];
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 200)];
    descriptionLabel.text     = modelDetail.detailDescription;

    
    UIImageView *imageView    = [[UIImageView alloc] initWithImage:[UIImage imageNamed:modelDetail.detailImage]];
    imageView.center          = CGPointMake( self.view.bounds.size.width / 2 , self.view.bounds.size.height / 2);
    
    [self.view addSubview:toolbar];
    [self.view addSubview:descriptionLabel];
    [self.view addSubview:imageView];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)backView
{
    NSLog(@"tag");
//    [self removeFromParentViewController];
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
