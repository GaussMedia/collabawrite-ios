

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize mCreateBtn;
@synthesize mMenuBtn;
@synthesize mRecentBtn;
@synthesize mMostBtn;
@synthesize mCollectionBtn;



#pragma mark-
#pragma View Cycle.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            // iPhone Classic
            [[NSBundle mainBundle] loadNibNamed:@"HomeViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"HomeViewController-568h" owner:self options:nil];
        }
    }
    UIAlertView *alert4 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"In Progress!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert4 show];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark-
#pragma mark UIButton Click Methods.

-(IBAction)MenuButtonClicked
{
    
    
}

-(IBAction)CreateButtonClicked
{
    
    
}
-(IBAction)RecentButtonClicked
{
    
    
}
-(IBAction)CollectionButtonClicked
{
    
}
-(IBAction)MostButtonClicked
{
    
}

#pragma mark-
#pragma mark Memory Management Methods.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
