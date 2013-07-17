//
//  SettingsViewController.h
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 07/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController<UIAlertViewDelegate,UIImagePickerControllerDelegate,
UINavigationControllerDelegate,UIActionSheetDelegate>
{
    UIImagePickerController *mImagePicker;
    UIImage *finalImage;
      int deletevar;
}
@property (nonatomic, strong) UIImage *finalImage;
@property (nonatomic, strong) UIImagePickerController *mImagePicker;
@property(nonatomic,strong) IBOutlet UIButton *CancelBtn;
@property(nonatomic,strong) IBOutlet UIButton *SaveBtn;


@property(nonatomic,strong) IBOutlet UIButton *ProfilePicBtn;
@property(nonatomic,strong) IBOutlet UIButton *EditProfileBtn;
@property(nonatomic,strong) IBOutlet UIButton *StoriesBtn;
@property(nonatomic,strong) IBOutlet UIButton *LogoutBtn;


-(IBAction)ProfilePicButtonClicked;

-(IBAction)EditProfileButtonClicked;

-(IBAction)StoriesButtonClicked;

-(IBAction)CancelButtonClicked;

-(IBAction)SaveButtonClicked;

-(IBAction)LogoutButtonClicked;

@end
