//
//  SplashViewController.m
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 03/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "SplashViewController.h"
#import "QuartzCore/CALayer.h"
#import "LoginViewController.h"
#import "ReportedlyViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

@synthesize mspalshImage;
@synthesize mLogoImage;
@synthesize mLabel;
@synthesize mStartedBtn;
@synthesize mLoginBtn;
NSInteger adCount;

+ (NSString*)nibNamedForDevice:(NSString*)name
{
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if ([UIScreen mainScreen].bounds.size.height == 568)
        {
            //Check if there a path extension or not
            if (name.pathExtension.length)
            {
                name = [name stringByReplacingOccurrencesOfString: [NSString stringWithFormat:@".%@", name.pathExtension]withString:[NSString stringWithFormat:@"-568h.%@", name.pathExtension ]];
                
            }
            else
            {
                name = [name stringByAppendingString:@"-568h"];
            }
            
            
            // if 568h nib is found
            NSString *nibExists = [[NSBundle mainBundle] pathForResource:name ofType:@"nib"];
            if (nibExists) {
                return name;
            }
            
        }
    }
    
    // just default to ios naming convention
    return Nil;
}


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
            [[NSBundle mainBundle] loadNibNamed:@"SplashViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"SplashViewController-568h" owner:self options:nil];
        }
    }
    // Do any additional setup after loading the view from its nib.

    self.navigationController.navigationBarHidden=TRUE;
    //[mspalshImage setImage:[UIImage imageNamed:@"New_background.png"]];
    self.view.alpha = 1.0f;
     self.view.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.8f];
    [self.view addSubview:mspalshImage];
    [self.view addSubview:mLogoImage];
    [self.view addSubview:mLabel];
    
    [NSTimer scheduledTimerWithTimeInterval:6
                                    target:self
                                   selector:@selector(rotateImages)
                                  userInfo:nil
                                    repeats:YES];
    
     mspalshImage.animationRepeatCount= 10000000;
    [mspalshImage startAnimating];
	[self.view addSubview:mspalshImage];
    
}

-(void)rotateImages
{

    if (adCount == 5)
    {

        adCount = 0;
    }

    switch (adCount) {
        case 0:
            mspalshImage.image = [UIImage imageNamed:@"New_background.png"];
       break;
      case 1:
      mspalshImage.image = [UIImage imageNamed:@"New_background2.png"];
       break;
       case 2:
      mspalshImage.image = [UIImage imageNamed:@"New_background3.png"];
      break;
      case 3:
      mspalshImage.image = [UIImage imageNamed:@"New_background4.png"];
      break;
      case 4:
      mspalshImage.image = [UIImage imageNamed:@"New_background5.png"];
     break;
   default:
 break;
  }
adCount++;

 }

#pragma mark-
#pragma mark UIButton Click Methods.

-(IBAction)StartedButtonClicked
{
    ReportedlyViewController *ReportVC=[[ReportedlyViewController alloc]initWithNibName:@"ReportedlyViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:ReportVC animated:YES];
}

-(IBAction)LoginButtonClicked
{
    LoginViewController *LoginVC=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:LoginVC animated:YES];
}
#pragma mark-
#pragma mark Memory Management Methods.
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
