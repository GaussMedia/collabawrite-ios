
#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property(nonatomic,strong)IBOutlet UIButton *mMenuBtn;
@property(nonatomic,strong)IBOutlet UIButton *mCreateBtn;
@property(nonatomic,strong)IBOutlet UIButton *mRecentBtn;
@property(nonatomic,strong)IBOutlet UIButton *mCollectionBtn;
@property(nonatomic,strong)IBOutlet UIButton *mMostBtn;

-(IBAction)MenuButtonClicked;
-(IBAction)CreateButtonClicked;
-(IBAction)RecentButtonClicked;
-(IBAction)CollectionButtonClicked;
-(IBAction)MostButtonClicked;
@end
