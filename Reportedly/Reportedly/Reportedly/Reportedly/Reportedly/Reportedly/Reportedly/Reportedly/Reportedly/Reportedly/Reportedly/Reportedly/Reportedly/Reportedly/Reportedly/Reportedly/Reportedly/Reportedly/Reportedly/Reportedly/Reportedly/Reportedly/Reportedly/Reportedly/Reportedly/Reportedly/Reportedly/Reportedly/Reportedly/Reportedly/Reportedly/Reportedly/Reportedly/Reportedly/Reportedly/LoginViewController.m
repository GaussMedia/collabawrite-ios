
#import "LoginViewController.h"
#import "SignupViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@end



@implementation LoginViewController
@synthesize mCancelBtn;
@synthesize mSignupBtn;
@synthesize mSigninBtn;
@synthesize mFacebookBtn;
@synthesize mTwitterBtn;
@synthesize mUsername;
@synthesize mPassword;
@synthesize mForgotPasswordBtn;
@synthesize alert;

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
            [[NSBundle mainBundle] loadNibNamed:@"LoginViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"LoginViewController-568h" owner:self options:nil];
        }
    }
    self.mUsername.delegate=self;
    self.mPassword.delegate=self;
    mUsername.clearButtonMode = UITextFieldViewModeWhileEditing;
    mPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    // Do any additional setup after loading the view from its nib.
}

#pragma mark-
#pragma mark UITextField Delegates.

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

#pragma mark-
#pragma mark UIButton Click Methods.

-(IBAction)CancelButtonClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)SigninButtonClicked
{
    [self.mUsername resignFirstResponder];
    [self.mPassword resignFirstResponder];
    
    HomeViewController *HomeVC=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:HomeVC animated:YES];
}
-(IBAction)ForgotButtonClicked
{
//    UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Login Sucessfull!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//    [alert2 show];
    self.alert = [[UIAlertView alloc] initWithTitle:@"Enter Email" message:@"Please enter the email address for your account. " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    self.alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [self.alert show];
}
-(IBAction)SignupButtonClicked
{
    SignupViewController *SignupVC=[[SignupViewController alloc]initWithNibName:@"SignupViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:SignupVC animated:YES];
}
-(IBAction)FacebookButtonClicked
{
    UIAlertView *alert4 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Facebook!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert4 show];
}
-(IBAction)TwitterButtonClicked
{
    UIAlertView *alert5 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Twitter!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert5 show];
}

#pragma mark-
#pragma mark Memory Management Methods.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
