//
//  PreviewViewController.h
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 15/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PreviewViewController : UIViewController<UIAlertViewDelegate>

@property(nonatomic,strong)IBOutlet UIButton *mCancelBtn;

-(IBAction)CancelButtonClicked;

@property(nonatomic,strong)IBOutlet UIButton *mPostBtn;

-(IBAction)PostButtonClicked;




@end
