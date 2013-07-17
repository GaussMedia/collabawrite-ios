
#import "PreviewViewController.h"
#import "HomeViewController.h"

@interface PreviewViewController ()

@end

@implementation PreviewViewController
@synthesize mCancelBtn;
@synthesize mPostBtn;

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
            [[NSBundle mainBundle] loadNibNamed:@"PreviewViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"PreviewViewController-568h" owner:self options:nil];
        }
    }
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)CancelButtonClicked
{
     [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)PostButtonClicked
{
    UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Sucessfully Posted!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert2 show];

}

#pragma mark-
#pragma mark UIAlertViewDelegates.

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0)
    {// cancel button{
        HomeViewController *HomeVC=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:HomeVC animated:YES];
    }
    else
    {
        //Dp Nothing..
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
