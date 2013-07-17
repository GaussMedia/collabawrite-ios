

#import <UIKit/UIKit.h>

@interface SplashViewController : UIViewController

-(void)rotateImages;


@property (nonatomic) NSInteger adCount;

@property (nonatomic,strong)UIColor *shadowColor;
@property (nonatomic,retain)IBOutlet UIImageView *mspalshImage;
@property (nonatomic,strong)IBOutlet UIImageView *mLogoImage;
@property (nonatomic,strong)IBOutlet UILabel *mLabel;
@property (nonatomic,strong)IBOutlet UIButton *mStartedBtn;
@property (nonatomic,strong)IBOutlet UIButton *mLoginBtn;

-(IBAction)StartedButtonClicked;
-(IBAction)LoginButtonClicked;



@end
