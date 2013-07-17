//
//  StoriesViewController.h
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 10/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoriesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *BackgroundImage;
    UIImageView *PostImage;
    UILabel *NameLbl;
    UILabel *DescriptionLbl;
    UIButton *FacebookBtn;
    UIButton *TwitterBtn;
    UIButton *CheckBtn;
}

@property(nonatomic,strong)IBOutlet UITableView *mTableView;
@property(nonatomic,strong)IBOutlet UIButton *mCancelBtn;

-(IBAction)CancelButtonClicked;


-(void)FacebookButton;
-(void)TwitterButton;
-(void)CheckButton;

@end
