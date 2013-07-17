
#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>

{
    UISearchBar *searchBar;
    UISearchDisplayController *searchDisplayController;
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
@property(nonatomic,strong)IBOutlet UIButton *mCreateBtn;
@property(nonatomic,strong)IBOutlet UIButton *mRecentBtn;
@property(nonatomic,strong)IBOutlet UIButton *mCollectionBtn;
@property(nonatomic,strong)IBOutlet UIButton *mMostBtn;
@property(nonatomic,strong)IBOutlet UITableView *mTableView;

@property(nonatomic,strong)IBOutlet UIView *FlipView;

//For Sliding Menu Bar...
@property(nonatomic,strong)IBOutlet UIButton *mHomeBtn;
@property(nonatomic,strong)IBOutlet UIButton *mSignalBtn;
@property(nonatomic,strong)IBOutlet UIButton *mRoundBtn;
@property(nonatomic,strong)IBOutlet UIButton *mPencilBtn;
@property(nonatomic,strong)IBOutlet UIButton *mProfileBtn;
@property(nonatomic,strong)IBOutlet UIButton *mSatelliteBtn;
@property(nonatomic,strong)IBOutlet UIButton *mSettingsBtn;
@property(nonatomic,strong)IBOutlet UIButton *mMapBtn;






-(IBAction)MenuButtonClicked;
-(IBAction)CreateButtonClicked;
-(IBAction)RecentButtonClicked;
-(IBAction)CollectionButtonClicked;
-(IBAction)MostButtonClicked;
-(IBAction)MapButtonClicked;

-(void)setSelectedButton:(UIButton *)ThreeButton;

-(IBAction)HomeButtonClicked;
-(IBAction)SignalButtonClicked;
-(IBAction)RoundButtonClicked;
-(IBAction)PencilButtonClicked;
-(IBAction)ProfileButtonClicked;
-(IBAction)SatelliteButtonClicked;
-(IBAction)SettingsButtonClicked;



-(void)FacebookButton;
-(void)TwitterButton;
-(void)CheckButton;
@end
