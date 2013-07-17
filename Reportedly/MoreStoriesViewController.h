
#import <UIKit/UIKit.h>

@interface MoreStoriesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
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
@property(nonatomic,strong) IBOutlet UILabel *mStoriesLbl;
@property(nonatomic,strong) IBOutlet UILabel *mCollectionLbl;
@property(nonatomic,strong) IBOutlet UILabel *mHeadingLbl;
@property(nonatomic,strong) IBOutlet UILabel *mSubheadingLbl;
@property(nonatomic,strong) IBOutlet UILabel *mUrlLbl;

@property(nonatomic,strong)IBOutlet UITableView *mTableView;


-(IBAction)CancelButtonClicked;




@end
