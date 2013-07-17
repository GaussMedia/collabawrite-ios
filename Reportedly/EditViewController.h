//
//  EditViewController.h
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 06/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic,strong) IBOutlet UIButton *CancelBtn;
@property(nonatomic,strong) IBOutlet UIButton *PreviewBtn;
@property(nonatomic,strong) IBOutlet UIButton *CameraBtn;
@property(nonatomic,strong) IBOutlet UIButton *LibraryBtn;
@property(nonatomic,strong) IBOutlet UIButton *LocationBtn;
@property(nonatomic,strong) IBOutlet UIButton *TextBtn;
@property (nonatomic,strong)IBOutlet UITextField *mTitle;
@property (nonatomic,strong)IBOutlet UITextField *mSubtitle;
@property (nonatomic,strong)IBOutlet UILabel *mCollection;

-(IBAction)CancelButtonClicked;
-(IBAction)PreviewButtonClicked;
-(IBAction)CameraButtonClicked;
-(IBAction)LibraryButtonClicked;
-(IBAction)LocationlButtonClicked;
-(IBAction)TextButtonClicked;




@end
