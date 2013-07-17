//
//  SigninViewController.h
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 04/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SigninViewController : UIViewController<UIAlertViewDelegate>
@property(nonatomic,strong)IBOutlet UIButton *mContinueBtn;
-(IBAction)ContinueButtonClicked;
@property(nonatomic,strong)IBOutlet UIButton *mBrowseBtn;
-(IBAction)BrowseButtonClicked;




@end
