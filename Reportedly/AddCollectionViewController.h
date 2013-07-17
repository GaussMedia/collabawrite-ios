
#import <UIKit/UIKit.h>

@interface AddCollectionViewController : UIViewController<UINavigationControllerDelegate,UITextFieldDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>
{
    UIImagePickerController *mImagePicker;
    UIImage *finalImage;
}


@property (nonatomic, strong) UIImage *finalImage;
@property (nonatomic, strong) UIImagePickerController *mImagePicker;
@property (nonatomic,strong)IBOutlet UIButton *CancelBtn;
@property (nonatomic,strong)IBOutlet UIButton *SaveBtn;
@property (nonatomic,strong)IBOutlet UITextField *TitleTextfield;
@property (nonatomic,strong)IBOutlet UITextField *EmailTextfield;
@property (nonatomic,strong)IBOutlet UITextView *DescriptionTextView;
@property (nonatomic,strong)IBOutlet UIButton *ImageBtn;
@property (nonatomic,strong)IBOutlet UIButton *CollectionBtn;
@property (nonatomic,strong)IBOutlet UIButton *InviteBtn;
@property (nonatomic,strong)IBOutlet UIButton *AddmoreBtn;
@property (nonatomic,strong)IBOutlet UIView *CreateView;


-(IBAction)ImageButtonClicked;
-(IBAction)CollectionButtonClciked;
-(IBAction)InviteButtonClciked;
-(IBAction)CancelbuttonClicked;
-(IBAction)SavebuttonClicked;

-(IBAction)AddmoreButtonClicked;

@end
