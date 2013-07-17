

#import "SigninViewController.h"
#import "LoginViewController.h"
#import "HomeViewController.h"

#define kAlertViewOne 1
#define kAlertViewTwo 2

@interface SigninViewController ()

@end

@implementation SigninViewController
@synthesize mContinueBtn;
@synthesize mBrowseBtn;


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
            [[NSBundle mainBundle] loadNibNamed:@"SigninViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"SigninViewController-568h" owner:self options:nil];
        }
    }
    // Do any additional setup after loading the view from its nib.
}

#pragma mark-
#pragma mark UIButton Click Methods.

-(IBAction)ContinueButtonClicked
{
    
    
    UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Are you sure want to Signin or Signup!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    [alert1 show];
    alert1.tag=kAlertViewOne;
//    LoginViewController *LoginVC=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
//    [self.navigationController pushViewController:LoginVC animated:YES];

}
-(IBAction)BrowseButtonClicked
{
    HomeViewController *HomeVC=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:[NSBundle mainBundle]];
        [self.navigationController pushViewController:HomeVC animated:YES];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0&&alertView.tag==kAlertViewOne)
    {// cancel button{
        LoginViewController *LoginVC=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:LoginVC animated:YES];
    }
    else
    {
        //Do nothing..
    }
}

#pragma mark-
#pragma mark Memory Management Methods.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
