
#import "LoginViewController.h"
#import "SignupViewController.h"
#import "HomeViewController.h"
#import "ReportedlyAPI.h"
#import "AppDelegate.h"
#import "Reachability.h"

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
@synthesize mUserResponseDict;

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
    self.navigationController.navigationBarHidden=TRUE;
     ReportedlyappDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
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
    
    if ([[self.mUsername.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || self.mUsername.text == NULL || [self.mUsername.text isEqual: @""] || [self.mUsername.text isEqualToString:@""] || [[self.mPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""] || self.mPassword.text == NULL || [self.mPassword.text isEqual: @""] || [self.mPassword.text isEqualToString:@""])
    {
        
        UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"You have to fill all the fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert2 show];
    }
    else {
        if(![ReportedlyappDelegate checkForInternetConnection]) {
            UIAlertView *alert5 = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"There is some problem in internet connection" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert5 show];
        }
    
    else
    {
        
        loader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
        ActivityLabel=[[UILabel alloc]initWithFrame:CGRectMake(180,213,100,50)];
        ActivityLabel.text=@"Loading...";
        loader.backgroundColor = [UIColor blackColor];
        ActivityLabel.backgroundColor=[UIColor blackColor];
        ActivityLabel.textColor=[UIColor whiteColor];
        loader.alpha = 0.5;
        ActivityLabel.alpha=0.5;
        //[self.view addSubview:ActivityLabel];
        [self.view addSubview:loader];
        
        UIActivityIndicatorView  *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        spinner.center = CGPointMake(160, 240);
        [loader addSubview:spinner];
        [spinner startAnimating];
        
        ///Call the Sign up API and it return dictionary
        userInfoDict=[[NSMutableDictionary alloc]init];
        [userInfoDict setObject:[NSString stringWithFormat:@"%@",self.mUsername.text] forKey:@"Username"];
        [userInfoDict setObject:[NSString stringWithFormat:@"%@",self.mPassword.text] forKey:@"password"];
        [self performSelector:@selector(callTheServer)withObject:userInfoDict afterDelay:.01];
    }
    }


//    HomeViewController *HomeVC=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:[NSBundle mainBundle]];
//    [self.navigationController pushViewController:HomeVC animated:YES];
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
#pragma mark Server Call.

- (void)callTheServer
{
    self.mUserResponseDict = [ReportedlyAPI UserLogin:userInfoDict];
        NSLog(@"%@",self.mUserResponseDict);
    if ([[self.mUserResponseDict valueForKey:@"message"] isEqual:@"true"])
    {
        
        [[NSUserDefaults standardUserDefaults] setObject:[self.mUserResponseDict valueForKey:@"Userid"] forKey:@"Userid"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [loader removeFromSuperview];
        HomeViewController *HomeVC=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:[NSBundle mainBundle]];
           [self.navigationController pushViewController:HomeVC animated:YES];
    }
    else {
        [loader removeFromSuperview];
        UIAlertView *alert3 = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Login unsuccessfull!" delegate:self cancelButtonTitle:@"OK"  otherButtonTitles: nil, nil];
        [alert3 show];
        self.mUsername.text = @"";
        self.mPassword.text = @"";
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
