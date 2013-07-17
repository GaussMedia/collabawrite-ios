//
//  SignupViewController.m
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 04/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

@end

@implementation SignupViewController
@synthesize mCancelBtn;
@synthesize mSignupBtn;
@synthesize mUsername;
@synthesize mPassword;
@synthesize mEmail;

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
            [[NSBundle mainBundle] loadNibNamed:@"SignupViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"SignupViewController-568h" owner:self options:nil];
        }
    }
    self.mUsername.delegate=self;
    self.mPassword.delegate=self;
    self.mEmail.delegate=self;
    mUsername.clearButtonMode = UITextFieldViewModeWhileEditing;
    mPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
    mEmail.clearButtonMode = UITextFieldViewModeWhileEditing;

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

-(IBAction)SignupButtonClicked
{
    [self.mUsername resignFirstResponder];
    [self.mPassword resignFirstResponder];
    [self.mEmail resignFirstResponder];
    
    UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Signup Sucessfull!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert1 show];
    
    
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
