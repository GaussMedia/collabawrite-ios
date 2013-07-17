

#import "SettingsViewController.h"
#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "EditProfileViewController.h"
#import "StoriesViewController.h"

@interface SettingsViewController ()
#define kAlertViewOne 1
#define kAlertViewTwo 2


@end

@implementation SettingsViewController
@synthesize CancelBtn;
@synthesize SaveBtn;
@synthesize ProfilePicBtn;
@synthesize EditProfileBtn;
@synthesize StoriesBtn;
@synthesize LogoutBtn;
@synthesize mImagePicker;
@synthesize finalImage;

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
            [[NSBundle mainBundle] loadNibNamed:@"SettingsViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"SettingsViewController-568h" owner:self options:nil];
        }
    }
    
    self.mImagePicker = [[UIImagePickerController alloc] init];
    self.mImagePicker.delegate = self;
    self.navigationController.navigationBarHidden=TRUE;
    // Do any additional setup after loading the view from its nib.
}


-(IBAction)CancelButtonClicked
{
    [self.navigationController popViewControllerAnimated:YES]; 
}

-(IBAction)SaveButtonClicked
{
    UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Settings Saved Sucessfully!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    alert1.tag=kAlertViewOne;
    [alert1 show];

}


-(IBAction)ProfilePicButtonClicked
{
    ///for calling camera and photo gallery.....
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                   initWithTitle:@"Select your Option"
                                   delegate:self
                                   cancelButtonTitle:@"Cancel"
                                   destructiveButtonTitle:nil
                                   otherButtonTitles:@"Camera", @"Photos",nil];
   
   // [actionSheet showFromTabBar:self.tabBarController.tabBar];
    [actionSheet showInView:self.view.superview];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    if ([[actionSheet buttonTitleAtIndex:buttonIndex]isEqualToString:@"Camera"])
    {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentModalViewController:picker animated:YES];
    }
    else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Photos"])
    {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentModalViewController:picker animated:YES];
    }
    // [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
    [self dismissModalViewControllerAnimated:YES];
}


-(IBAction)EditProfileButtonClicked
{
    EditProfileViewController *EditVC=[[EditProfileViewController alloc]initWithNibName:@"EditProfileViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:EditVC animated:YES];
}

-(IBAction)StoriesButtonClicked
{
    StoriesViewController *StoriesVC=[[StoriesViewController alloc]initWithNibName:@"StoriesViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:StoriesVC animated:YES];

}

-(IBAction)LogoutButtonClicked
{
    UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Are you sure want to Logout" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
     alert2.tag=kAlertViewTwo;
    [alert2 show];
    
}
#pragma mark-
#pragma mark UIImagePickerDelegates.

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    //[self.ProfilePicBtn setBackgroundImage:image forState:UIControlStateNormal];
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
    
}

#pragma mark-
#pragma mark UIAlertViewDelegates.

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==kAlertViewOne)
    {// cancel button{
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        ///Do nothing...
    }
        }
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        deletevar = 0;
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"Userid"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        LoginViewController *LV=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
        [LV setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        
        LV.hidesBottomBarWhenPushed = TRUE;
        [self dismissViewControllerAnimated:NO completion:nil];
        [self.navigationController pushViewController:LV animated:YES];
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
