

#import <UIKit/UIKit.h>

@interface SatelliteViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

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
@property(nonatomic,strong) IBOutlet UIButton *CancelBtn;
-(IBAction)CancelButtonClicked;

@end
