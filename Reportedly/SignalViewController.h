

#import <UIKit/UIKit.h>

@interface SignalViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *BackgroundImage;
    UILabel *HeadingLbl;
    UILabel *SubHeadingLbl;
    UILabel *ViewLbl;
    UILabel *ReadsLbl;
    UILabel *RecomendationsLbl;
    UILabel *ShareLbl;
    UILabel *TweetsLbl;
    UILabel *ViewValueLbl;
    UILabel *ReadsValueLbl;
    UILabel *RecomendationsValueLbl;
    UILabel *ShareValueLbl;
    UILabel *TweetsValueLbl;
    
}
@property(nonatomic,strong) IBOutlet UIButton *CancelBtn;
-(IBAction)CancelButtonClicked;
@property(nonatomic,strong)IBOutlet UITableView *mTableView;

@end
