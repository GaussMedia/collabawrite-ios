//
//  LoginViewController.h
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 03/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>

@property (nonatomic,strong)IBOutlet UIButton *mCancelBtn;
@property (nonatomic,strong)IBOutlet UIButton *mSigninBtn;
@property (nonatomic,strong)IBOutlet UIButton *mSignupBtn;
@property (nonatomic,strong)IBOutlet UIButton *mFacebookBtn;
@property (nonatomic,strong)IBOutlet UIButton *mTwitterBtn;
@property (nonatomic,strong)IBOutlet UIButton *mForgotPasswordBtn;
@property (nonatomic,strong)IBOutlet UITextField *mUsername;
@property (nonatomic,strong)IBOutlet UITextField *mPassword;
@property (nonatomic, retain) UIAlertView *alert;

-(IBAction)CancelButtonClicked;
-(IBAction)SigninButtonClicked;
-(IBAction)ForgotButtonClicked;
-(IBAction)SignupButtonClicked;
-(IBAction)FacebookButtonClicked;
-(IBAction)TwitterButtonClicked;

@end
