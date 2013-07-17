//
//  EditViewController.m
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 06/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "EditViewController.h"
#import "PreviewViewController.h"
@interface EditViewController ()

@end

@implementation EditViewController


@synthesize CancelBtn;
@synthesize CameraBtn;
@synthesize LibraryBtn;
@synthesize LocationBtn;
@synthesize TextBtn;
@synthesize mTitle;
@synthesize mSubtitle;
@synthesize mCollection;
@synthesize PreviewBtn;

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
            [[NSBundle mainBundle] loadNibNamed:@"EditViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"EditViewController-568h" owner:self options:nil];
        }
    }
    self.mTitle.delegate=self;
    self.mSubtitle.delegate=self;

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
-(IBAction)CameraButtonClicked
{
    UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Camera" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
       [alert2 show];
}
-(IBAction)LibraryButtonClicked
{
    UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Camera Library" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert2 show];

}
-(IBAction)LocationlButtonClicked
{
    UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Map Location" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert2 show];

}
-(IBAction)TextButtonClicked
{
    UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"TextField" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert2 show];

}

-(IBAction)PreviewButtonClicked
{
    PreviewViewController *PreviewVC=[[PreviewViewController alloc]initWithNibName:@"PreviewViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:PreviewVC animated:YES];
}



#pragma mark-
#pragma mark Memory Management Methods.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
