
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ReportedlyAPI.h"
#import "Reachability.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
{
    AppDelegate *ReportedlyappDelegate;
    UIView *loader;
    NSMutableDictionary *userInfoDict;
    UILabel *ActivityLabel;
   // NSMutableDictionary *loginDict;
     NSMutableDictionary *mUserResponseDict;
}

@property (nonatomic, strong) NSMutableDictionary *mUserResponseDict;
//@property (strong, nonatomic) NSMutableDictionary *loginDict;
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
