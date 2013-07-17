

#import "HomeViewController.h"
#import "CreateViewController.h"
#import <CoreGraphics/CoreGraphics.h>
#import "SatelliteViewController.h"
#import "RoundViewController.h"
#import "PencilViewController.h"
#import "ProfileViewController.h"
#import "SignalViewController.h"
#import "SettingsViewController.h"
#import "DetailViewController.h"
#import "AddCollectionViewController.h"
#import "MapViewController.h"


#define RecentReportTable1
#define CollectionTable2
#define MostRecommendsTable3




@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize mCreateBtn;
@synthesize mMenuBtn;
@synthesize mRecentBtn;
@synthesize mMostBtn;
@synthesize mCollectionBtn;

@synthesize FlipView;
@synthesize mHomeBtn;
@synthesize mSignalBtn;
@synthesize mRoundBtn;
@synthesize mPencilBtn;
@synthesize mProfileBtn;
@synthesize mSatelliteBtn;
@synthesize mSettingsBtn;

@synthesize mMapBtn;
@synthesize mTableView;


#pragma mark-
#pragma View Cycle.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect frame = self.FlipView.frame;
    //'[UIView setAnimationDelegate:self];
    frame.origin.x =0;
    menuOpen = NO;
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            // iPhone Classic
            [[NSBundle mainBundle] loadNibNamed:@"HomeViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"HomeViewController-568h" owner:self options:nil];
        }
    }
    self.mTableView.delegate=self;
    self.mTableView.dataSource=self;
//    
//    self.mCollectionTableView.delegate=self;
//    self.mCollectionTableView.dataSource=self;
//    
//    self.mMostRecommendedTableView.delegate=self;
//    self.mMostRecommendedTableView.dataSource=self;
    
    
   
    
    //[self.view addSubview: mMostRecommendedTableView];
    
    // Do any additional setup after loading the view from its nib.
}





-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if ([animationID isEqualToString:@"slideMenu"])
    {
        UIView *sq = (__bridge UIView *) context;
        [sq removeFromSuperview];
        
    }
}

#pragma mark-
#pragma mark UIButton Click Methods.


-(IBAction)MenuButtonClicked
{
    NSLog(@"Menu tapped");
    CGRect frame = self.FlipView.frame;
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context: )];
    [UIView beginAnimations:@"slideMenu" context:(__bridge void *)(self.FlipView)];
    if(menuOpen) {
        frame.origin.x =0;
        menuOpen = NO;
    }
    else
    {
        frame.origin.x = 70;
        menuOpen = YES;
       
    }
    
    self.FlipView.frame = frame;
    [UIView commitAnimations];
}

-(IBAction)CreateButtonClicked
{
    CreateViewController *HomeVC=[[CreateViewController alloc]initWithNibName:@"CreateViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:HomeVC animated:YES];
    
}





-(IBAction)RecentButtonClicked
{

    [self setSelectedButton:mRecentBtn];
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 160, 44)];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];

   self.mTableView.tableHeaderView = searchBar;
      // [self.view addSubview: mRecentTableView];
   
}
-(IBAction)CollectionButtonClicked
{
      [self setSelectedButton:mCollectionBtn];
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 160, 44)];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    self.mTableView.tableHeaderView = searchBar;
     //  [self.view addSubview: mCollectionTableView];

    
}
-(IBAction)MostButtonClicked
{

    [self setSelectedButton:mMostBtn];
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,0, 160, 44)];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    self.mTableView.tableHeaderView = searchBar;
      // [self.view addSubview: mMostRecommendedTableView];

}

-(void)setSelectedButton:(UIButton *)ThreeButton
{
     UIImage *image1 = [UIImage imageNamed:@"Modified_check.png"];
     UIImage *image2 = [UIImage imageNamed:@"collection.png"];
     UIImage *image3 = [UIImage imageNamed:@"recomended.png"];
   
     
    if(ThreeButton == mRecentBtn)
    {
        [mRecentBtn setBackgroundImage:image1 forState:UIControlStateNormal];
        [mRecentBtn setBackgroundImage:image1 forState:UIControlStateSelected];
        [mRecentBtn setBackgroundImage:image1 forState:UIControlStateHighlighted];
        mRecentBtn.adjustsImageWhenHighlighted = YES;
        
        [mCollectionBtn setBackgroundImage:nil forState:UIControlStateNormal];
        [mCollectionBtn setBackgroundImage:nil forState:UIControlStateSelected];
        [mCollectionBtn setBackgroundImage:nil forState:UIControlStateHighlighted];
        [mCollectionBtn setBackgroundImage:nil forState:UIControlStateDisabled];
        
        [mMostBtn setBackgroundImage:nil forState:UIControlStateNormal];
        [mMostBtn setBackgroundImage:nil forState:UIControlStateDisabled];
        [mMostBtn setBackgroundImage:nil forState:UIControlStateHighlighted];
        [mMostBtn setBackgroundImage:nil forState:UIControlStateSelected];
        mRecentBtn.enabled=NO;
        mCollectionBtn.enabled=YES;
        mMostBtn.enabled=YES;
     
        
               
        
    }
    else if (ThreeButton==mCollectionBtn)
    {
        [mCollectionBtn setBackgroundImage:image2 forState:UIControlStateNormal];
        [mCollectionBtn setBackgroundImage:image2 forState:UIControlStateSelected];
        [mCollectionBtn setBackgroundImage:image2 forState:UIControlStateHighlighted];
        mCollectionBtn.adjustsImageWhenHighlighted = YES;
        [mMostBtn setBackgroundImage:nil forState:UIControlStateNormal];
        [mMostBtn setBackgroundImage:nil forState:UIControlStateDisabled];
        [mMostBtn setBackgroundImage:nil forState:UIControlStateHighlighted];
        [mMostBtn setBackgroundImage:nil forState:UIControlStateSelected];
        [mRecentBtn setBackgroundImage:nil forState:UIControlStateNormal];
        [mRecentBtn setBackgroundImage:nil forState:UIControlStateDisabled];
        [mRecentBtn setBackgroundImage:nil forState:UIControlStateHighlighted];
        [mRecentBtn setBackgroundImage:nil forState:UIControlStateSelected];
        
        mCollectionBtn.enabled=NO;
        mMostBtn.enabled=YES;
        mRecentBtn.enabled=YES;
             

    }
    else
    {
        [mMostBtn setBackgroundImage:image3 forState:UIControlStateNormal];
        [mMostBtn setBackgroundImage:image3 forState:UIControlStateSelected];
        [mMostBtn setBackgroundImage:image3 forState:UIControlStateHighlighted];
        mMostBtn.adjustsImageWhenHighlighted = YES;
        
        [mRecentBtn setBackgroundImage:nil forState:UIControlStateNormal];
        [mRecentBtn setBackgroundImage:nil forState:UIControlStateDisabled];
        [mRecentBtn setBackgroundImage:nil forState:UIControlStateHighlighted];
        [mRecentBtn setBackgroundImage:nil forState:UIControlStateSelected];
        
        [mCollectionBtn setBackgroundImage:nil forState:UIControlStateNormal];
        [mCollectionBtn setBackgroundImage:nil forState:UIControlStateDisabled];
        [mCollectionBtn setBackgroundImage:nil forState:UIControlStateHighlighted];
        [mCollectionBtn setBackgroundImage:nil forState:UIControlStateSelected];
        
        mMostBtn.enabled=NO;
        mRecentBtn.enabled=YES;
        mCollectionBtn.enabled=YES;
      }
    
}


-(IBAction)HomeButtonClicked
{
    HomeViewController *HomeVC=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:HomeVC animated:YES];
}

-(IBAction)SignalButtonClicked
{
    SignalViewController *SignalVC=[[SignalViewController alloc]initWithNibName:@"SignalViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:SignalVC animated:YES];

}
-(IBAction)RoundButtonClicked
{
    RoundViewController *RoundVC=[[RoundViewController alloc]initWithNibName:@"RoundViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:RoundVC animated:YES];
}
-(IBAction)PencilButtonClicked
{
    AddCollectionViewController *AddVC=[[AddCollectionViewController alloc]initWithNibName:@"AddCollectionViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:AddVC animated:YES];
}
-(IBAction)ProfileButtonClicked
{
    ProfileViewController *ProfileVC=[[ProfileViewController alloc]initWithNibName:@"ProfileViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:ProfileVC animated:YES];
}
-(IBAction)SatelliteButtonClicked
{
    SatelliteViewController *SatelliteVC=[[SatelliteViewController alloc]initWithNibName:@"SatelliteViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:SatelliteVC animated:YES];
}
-(IBAction)SettingsButtonClicked
{
    SettingsViewController *SettingsVC=[[SettingsViewController alloc]initWithNibName:@"SettingsViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:SettingsVC animated:YES];
}

-(IBAction)MapButtonClicked
{
    MapViewController *MapVC=[[MapViewController alloc]initWithNibName:@"MapViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:MapVC animated:YES];
}


#pragma mark-
#pragma mark UITableViewDelegate and UITableViewDataSource.

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
 return 25;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 return 190;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"CellIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSArray *views=[cell.contentView subviews];
    for(int i=0;i<[views count];i++)
    {
        UIView *tempView=[views objectAtIndex:i];
        [tempView removeFromSuperview];
        tempView = nil;
    }
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    BackgroundImage=[[UIImageView alloc]init];
    BackgroundImage.frame=CGRectMake(10, 0, 300, 175);
    BackgroundImage.image = [UIImage imageNamed:@"outer.png"];
    
    PostImage=[[UIImageView alloc]init];
    PostImage.frame=CGRectMake(20, 5, 280, 110);
    PostImage.image = [UIImage imageNamed:@"2.png"];
    /*
     UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     button.frame = CGRectMake(100, 0, 100, 40);
     [button setTitle:@"add contact" forState:UIControlStateNormal];
     button.backgroundColor = [UIColor blueColor];
     [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [button addTarget:self action:@selector(deconnect) forControlEvents:UIControlEventTouchUpInside];
     [cell.contentView addSubview:button];
    
    
    
    
   */
    FacebookBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    FacebookBtn.frame=CGRectMake(230, 117, 20, 20);
    [FacebookBtn setTitle:@"" forState:UIControlStateNormal];
   // FacebookBtn.backgroundColor=[UIColor blueColor];
    UIImage *FacebookButtonImage = [UIImage imageNamed:@"fb.png"];
     [FacebookBtn setBackgroundImage:FacebookButtonImage forState:UIControlStateNormal];
    [FacebookBtn addTarget:self action:@selector(FacebookButton) forControlEvents:UIControlEventTouchUpInside];
    
    TwitterBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    TwitterBtn.frame=CGRectMake(254, 117, 20, 20);
    [TwitterBtn setTitle:@"" forState:UIControlStateNormal];
   // TwitterBtn.backgroundColor=[UIColor blueColor];
    UIImage *TwitterButtonImage = [UIImage imageNamed:@"tw.png"];
    [TwitterBtn setBackgroundImage:TwitterButtonImage forState:UIControlStateNormal];
    [TwitterBtn addTarget:self action:@selector(TwitterButton) forControlEvents:UIControlEventTouchUpInside];

    CheckBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    CheckBtn.frame=CGRectMake(278, 117, 20, 20);
    [CheckBtn setTitle:@"" forState:UIControlStateNormal];
    //CheckBtn.backgroundColor=[UIColor blueColor];
    UIImage *CheckButtonImage = [UIImage imageNamed:@"rec.png"];
    [CheckBtn setBackgroundImage:CheckButtonImage forState:UIControlStateNormal];
    [CheckBtn addTarget:self action:@selector(CheckButton) forControlEvents:UIControlEventTouchUpInside];
    
    NameLbl=[[UILabel alloc]init];
    NameLbl.frame=CGRectMake(20,119, 150,15);
    NameLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:1];
    NameLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    NameLbl.backgroundColor=[UIColor clearColor];
    NameLbl.text=@"Real Home";
    
    
    DescriptionLbl=[[UILabel alloc]init];
    DescriptionLbl.frame=CGRectMake(20,137, 278,35);
    DescriptionLbl.textColor = [UIColor colorWithRed:40.0/255.0 green:54.0/255.0 blue:82.0/255.0 alpha:1];
    DescriptionLbl.font = [UIFont fontWithName:@"Helvetica" size:10.0];
    //DescriptionLbl.lineBreakMode = UILineBreakModeWordWrap;
    DescriptionLbl.numberOfLines =2;
    DescriptionLbl.backgroundColor=[UIColor clearColor];
    //DescriptionLbl = [NSString stringWithFormat:@"%@ \r %@",@"first line",@"seconcd line"];
    DescriptionLbl.text=@"When you finally go back to your old home, you find it wasn't the old home you missed but your childhood.";
    
    DescriptionLbl.numberOfLines = 2;
    
    
    
    
     [cell.contentView addSubview:BackgroundImage];
    [cell.contentView addSubview:PostImage];
    [cell.contentView addSubview:NameLbl];
    [cell.contentView addSubview:DescriptionLbl];
    [cell.contentView addSubview:FacebookBtn];
    [cell.contentView addSubview:TwitterBtn];
    [cell.contentView addSubview:CheckBtn];
       
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    DetailViewController *DetailVC=[[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:DetailVC animated:YES];
}
-(void)FacebookButton
{
    UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Facebook Button!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert1 show];
}

-(void)TwitterButton
{
    UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Twitter Button!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert1 show];
}
-(void)CheckButton
{
    UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:@"Reportedly" message:@"Check Button!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert1 show];
}
#pragma mark - searchDisplayControllerDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
   return YES;
}



#pragma mark-
#pragma mark Memory Management Methods.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
