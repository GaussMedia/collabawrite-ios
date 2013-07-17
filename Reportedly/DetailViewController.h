
#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *DisplayImage;
    UIImageView *HolderImage;
      UIImageView *HolderContainImage;
    UIImageView *LineImage;
    UILabel *NameLbl;
    UILabel *DescriptionLbl;
      UILabel *HeadingLbl;
      UILabel *ByLbl;
    UILabel *SecondDescriptionLbl;
    UILabel *ThirdDescriptionLbl;
    UIImageView *SecondsDisplayImage;
    UIButton *MoreBtn;
    UILabel *MoreLbl;
    UILabel *UserLbl;
}


@property(nonatomic,strong)IBOutlet UITableView *mTableView;
@property(nonatomic,strong)IBOutlet UIButton *mCancelBtn;

-(IBAction)CancelButtonClicked;


@end
