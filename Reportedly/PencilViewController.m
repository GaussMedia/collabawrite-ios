//
//  PencilViewController.m
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 07/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "PencilViewController.h"

@interface PencilViewController ()

@end

@implementation PencilViewController
@synthesize CancelBtn;

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
            [[NSBundle mainBundle] loadNibNamed:@"PencilViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"PencilViewController-568h" owner:self options:nil];
        }
    }
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)CancelButtonClicked
{
    [self.navigationController popViewControllerAnimated:YES]; 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
