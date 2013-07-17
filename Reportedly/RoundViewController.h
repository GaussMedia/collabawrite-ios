

#import <UIKit/UIKit.h>

@interface RoundViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
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
@property(nonatomic,strong)IBOutlet UITableView *mTableView;
-(IBAction)CancelButtonClicked;


-(void)FacebookButton;
-(void)TwitterButton;
-(void)CheckButton;

@end
