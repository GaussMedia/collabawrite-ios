
#import "ReportedlyViewController.h"
#import "ContributeViewController.h"

@interface ReportedlyViewController ()

@end

@implementation ReportedlyViewController
@synthesize mContinueBtn;


#pragma mark-
#pragma View Cycle.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
            [[NSBundle mainBundle] loadNibNamed:@"ReportedlyViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"ReportedlyViewController-568h" owner:self options:nil];
        }
    }
    // Do any additional setup after loading the view from its nib.
}

#pragma mark-
#pragma mark UIButton Click Methods.


-(IBAction)ContinueButtonClicked
{
    ContributeViewController *ContributeVC=[[ContributeViewController alloc]initWithNibName:@"ContributeViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:ContributeVC animated:YES];
}
#pragma mark-
#pragma mark Memory Management Methods.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
