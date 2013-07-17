

#import "AddCollectionViewController.h"

@interface AddCollectionViewController ()

@end

@implementation AddCollectionViewController

@synthesize CancelBtn;
@synthesize CreateView;
@synthesize TitleTextfield;
@synthesize DescriptionTextView;
@synthesize ImageBtn;
@synthesize CollectionBtn;
@synthesize InviteBtn;
@synthesize AddmoreBtn;
@synthesize SaveBtn;
@synthesize EmailTextfield;
@synthesize mImagePicker;
@synthesize finalImage;


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
            [[NSBundle mainBundle] loadNibNamed:@"AddCollectionViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"AddCollectionViewController-568h" owner:self options:nil];
        }
    }
    self.mImagePicker = [[UIImagePickerController alloc] init];
    self.mImagePicker.delegate = self;
    self.TitleTextfield.delegate=self;
    self.DescriptionTextView.delegate=self;
    self.EmailTextfield.delegate=self;
    
    self.CreateView.frame=CGRectMake(0,0,320,460);
     [self.view addSubview:self.CreateView];
    // Do any additional setup after loading the view from its nib.
}
// Close keyboard if the Background is touched
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self.CreateView endEditing:YES];
	[super touchesBegan:touches withEvent:event];
}

#pragma mark-
#pragma mark UITextField Delegates.

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.CreateView cache:YES];
    self.CreateView.frame = CGRectMake(0, 0, 320, 460);
    [UIView commitAnimations];
    // [self.mSearchTable removeFromSuperview];
    
    
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.CreateView cache:YES];
    self.CreateView.frame = CGRectMake(0, -110, 320, 460);
    [UIView commitAnimations];
    
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.CreateView cache:YES];
    self.CreateView.frame = CGRectMake(0, 0, 320, 460);
    [UIView commitAnimations];
    //
}

#pragma mark-
#pragma mark UIButton Click Methods.




-(IBAction)ImageButtonClicked
{
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

-(IBAction)AddmoreButtonClicked
{
    
}
-(IBAction)CollectionButtonClciked
{
    
}
-(IBAction)InviteButtonClciked
{
    
}
-(IBAction)SavebuttonClicked
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.CreateView cache:YES];
    self.CreateView.frame = CGRectMake(0, 0, 320, 460);
    [UIView commitAnimations];
    
    [self.TitleTextfield resignFirstResponder];
    [self.DescriptionTextView resignFirstResponder];
    [self.EmailTextfield resignFirstResponder];
    UIAlertView *alert5 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Collection Created Sucessfully!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert5 show];

}
-(IBAction)CancelbuttonClicked
{
     [self.navigationController popViewControllerAnimated:YES];
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
