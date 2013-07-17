//
//  SignupViewController.h
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 04/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>

@property (nonatomic,strong)IBOutlet UITextField *mUsername;
@property (nonatomic,strong)IBOutlet UITextField *mPassword;
@property (nonatomic,strong)IBOutlet UITextField *mEmail;
@property(nonatomic,strong)IBOutlet UIButton *mCancelBtn;
@property(nonatomic,strong)IBOutlet UIButton *mSignupBtn;
-(IBAction)CancelButtonClicked;
-(IBAction)SignupButtonClicked;


@end
