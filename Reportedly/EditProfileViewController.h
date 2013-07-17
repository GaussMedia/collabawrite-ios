

#import <UIKit/UIKit.h>

@interface EditProfileViewController : UIViewController<UINavigationControllerDelegate,UITextFieldDelegate,UITextViewDelegate>


@property (nonatomic,strong) IBOutlet UIView *mEditView;
@property (nonatomic,strong) IBOutlet UIButton *CancelBtn;
@property (nonatomic,strong) IBOutlet UIButton *SaveBtn;
@property (nonatomic,strong) IBOutlet UITextField *NameTextfield;
@property (nonatomic,strong) IBOutlet UITextField *WebsiteTextfield;
@property (nonatomic,strong) IBOutlet UITextView *AboutTextView;
@property (nonatomic,strong) IBOutlet UITextField *UsernameTextfield;
@property (nonatomic,strong) IBOutlet UITextField *EmailTextfield;


-(IBAction)CancelButtonClicked;
-(IBAction)SaveButtonClicked;
@end
