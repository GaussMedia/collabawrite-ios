

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController
@synthesize CancelBtn;
@synthesize SaveBtn;
@synthesize NameTextfield;
@synthesize WebsiteTextfield;
@synthesize AboutTextView;
@synthesize UsernameTextfield;
@synthesize EmailTextfield;
@synthesize mEditView;


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
            [[NSBundle mainBundle] loadNibNamed:@"EditProfileViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"EditProfileViewController-568h" owner:self options:nil];
        }
    }
   
     //[self.mEditView addSubview:self.view];
    self.NameTextfield.delegate=self;
    self.WebsiteTextfield.delegate=self;
    self.AboutTextView.delegate=self;
     self.UsernameTextfield.delegate=self;
    self.EmailTextfield.delegate=self;
    
     self.mEditView.frame=CGRectMake(0,0, 320,460);
     [self.view addSubview:self.mEditView];
   
    
    
    // Do any additional setup after loading the view from its nib.
}



// Close keyboard if the Background is touched
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self.mEditView endEditing:YES];
	[super touchesBegan:touches withEvent:event];
}

#pragma mark-
#pragma mark UITextField Delegates.

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.mEditView cache:YES];
    self.mEditView.frame = CGRectMake(0, 0, 320, 460);
    [UIView commitAnimations];
    // [self.mSearchTable removeFromSuperview];
    
    
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.mEditView cache:YES];
    self.mEditView.frame = CGRectMake(0, -140, 320, 460);
    [UIView commitAnimations];
    
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.mEditView cache:YES];
    self.mEditView.frame = CGRectMake(0, 0, 320, 460);
    [UIView commitAnimations];
    //
}

#pragma mark-
#pragma mark UIButton Click Methods.


-(IBAction)SaveButtonClicked
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.mEditView cache:YES];
    self.mEditView.frame = CGRectMake(0, 0, 320, 460);
    [UIView commitAnimations];
    [self.NameTextfield resignFirstResponder];
    [self.WebsiteTextfield resignFirstResponder];
    [self.AboutTextView resignFirstResponder];
    [self.UsernameTextfield resignFirstResponder];
    [self.EmailTextfield resignFirstResponder];
    UIAlertView *alert5 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Profile Saved Sucessfully!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert5 show];
}
-(IBAction)CancelButtonClicked
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark-
#pragma mark UIAlertViewDelegates.

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) // cancel button{
        [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark-
#pragma mark Memory Management Methods.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
