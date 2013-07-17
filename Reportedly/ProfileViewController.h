//
//  ProfileViewController.h
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 07/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *BackgroundImage;
    UIImageView *PostImage;
    UILabel *NameLbl;
    UILabel *DescriptionLbl;
    UIButton *FacebookBtn;
    UIButton *TwitterBtn;
    UIButton *CheckBtn;

}
@property(nonatomic,strong) IBOutlet UIButton *CancelBtn;
@property(nonatomic,strong) IBOutlet UILabel *mReportsLbl;
@property(nonatomic,strong) IBOutlet UILabel *mRecommendationsLbl;
@property(nonatomic,strong) IBOutlet UILabel *mHeadingLbl;
@property(nonatomic,strong) IBOutlet UILabel *mSubheadingLbl;
@property(nonatomic,strong) IBOutlet UILabel *mUrlLbl;
@property(nonatomic,strong) IBOutlet UIButton *mEditBtn;
@property(nonatomic,strong)IBOutlet UITableView *mTableView;


-(IBAction)CancelButtonClicked;


-(IBAction)EditButtonClicked;
@end
