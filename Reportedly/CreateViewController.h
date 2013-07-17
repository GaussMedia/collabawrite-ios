//
//  CreateViewController.h
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 06/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *BackgroundImage;
    UIImageView *PostImage;
    UILabel *NameLbl;
    UILabel *DescriptionLbl;
    UIButton *FacebookBtn;
    UIButton *TwitterBtn;
    UIButton *CheckBtn;
    BOOL *menuOpen;
}

@property(nonatomic,strong)IBOutlet UIButton *mMenuBtn;
@property(nonatomic,strong)IBOutlet UITableView *mCreateTableView;
@property(nonatomic,strong)IBOutlet UIView *FlipView;

//For Sliding Menu Bar...
@property(nonatomic,strong)IBOutlet UIButton *mHomeBtn;
@property(nonatomic,strong)IBOutlet UIButton *mSignalBtn;
@property(nonatomic,strong)IBOutlet UIButton *mRoundBtn;
@property(nonatomic,strong)IBOutlet UIButton *mPencilBtn;
@property(nonatomic,strong)IBOutlet UIButton *mProfileBtn;
@property(nonatomic,strong)IBOutlet UIButton *mSatelliteBtn;
@property(nonatomic,strong)IBOutlet UIButton *mSettingsBtn;
@property(nonatomic,strong)IBOutlet UIButton *mAddBtn;
@property(nonatomic,strong)IBOutlet UIButton *mMapBtn;


-(IBAction)MapButtonClicked;
-(IBAction)AddButtonClicked;
-(IBAction)HomeButtonClicked;
-(IBAction)SignalButtonClicked;
-(IBAction)RoundButtonClicked;
-(IBAction)PencilButtonClicked;
-(IBAction)ProfileButtonClicked;
-(IBAction)SatelliteButtonClicked;
-(IBAction)SettingsButtonClicked;

-(IBAction)MenuButtonClicked;
-(void)FacebookButton;
-(void)TwitterButton;
-(void)CheckButton;


@end
