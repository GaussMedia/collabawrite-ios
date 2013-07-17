

#import "SignalViewController.h"

@interface SignalViewController ()

@end

@implementation SignalViewController
@synthesize CancelBtn;
@synthesize mTableView;


#pragma mark-
#pragma View Cycle.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            // iPhone Classic
            [[NSBundle mainBundle] loadNibNamed:@"SignalViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"SignalViewController-568h" owner:self options:nil];
        }
    }
    self.mTableView.delegate=self;
    self.mTableView.dataSource=self;
    // Do any additional setup after loading the view from its nib.
}

#pragma mark-
#pragma mark UIButton Click Methods.

-(IBAction)CancelButtonClicked
{
    [self.navigationController popViewControllerAnimated:YES]; 
}
#pragma mark-
#pragma mark UITableViewDelegate and UITableViewDataSource.


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
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
    BackgroundImage.image = [UIImage imageNamed:@"New.png"];
    
    
    HeadingLbl=[[UILabel alloc]init];
    HeadingLbl.frame=CGRectMake(17,17,295,15);
    HeadingLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:1];
    HeadingLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
    HeadingLbl.backgroundColor=[UIColor clearColor];
    HeadingLbl.text=@"We're Not On The Web,We Are The Web";
    
    SubHeadingLbl=[[UILabel alloc]init];
    SubHeadingLbl.frame=CGRectMake(17,45,150,15);
    SubHeadingLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:0.5f];
    SubHeadingLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0];
    SubHeadingLbl.backgroundColor=[UIColor clearColor];
    SubHeadingLbl.text=@"in Surveillance State";
    
    ViewLbl=[[UILabel alloc]init];
    ViewLbl.frame=CGRectMake(25,115,80,15);
    ViewLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:1.0];
    ViewLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:10.0];
    ViewLbl.backgroundColor=[UIColor clearColor];
    ViewLbl.text=@"Views";
    
    ViewValueLbl=[[UILabel alloc]init];
    ViewValueLbl.frame=CGRectMake(29,140,80,15);
    ViewValueLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:0.5f];
    ViewValueLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    ViewValueLbl.backgroundColor=[UIColor clearColor];
    ViewValueLbl.text=@"60";
    
    
    ReadsLbl=[[UILabel alloc]init];
    ReadsLbl.frame=CGRectMake(77,115,80,15);
    ReadsLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:1.0];
    ReadsLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:10.0];
    ReadsLbl.backgroundColor=[UIColor clearColor];
    ReadsLbl.text=@"Reads";
    
    ReadsValueLbl=[[UILabel alloc]init];
    ReadsValueLbl.frame=CGRectMake(78,140,80,15);
    ReadsValueLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:0.5f];
    ReadsValueLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    ReadsValueLbl.backgroundColor=[UIColor clearColor];
    ReadsValueLbl.text=@"120";
    
    
    RecomendationsLbl=[[UILabel alloc]init];
    RecomendationsLbl.frame=CGRectMake(125,115,120,15);
    RecomendationsLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:1.0];
    RecomendationsLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:10.0];
    RecomendationsLbl.backgroundColor=[UIColor clearColor];
    RecomendationsLbl.text=@"Recomendations";
    
    
    RecomendationsValueLbl=[[UILabel alloc]init];
    RecomendationsValueLbl.frame=CGRectMake(160,140,80,15);
    RecomendationsValueLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:0.5f];
    RecomendationsValueLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    RecomendationsValueLbl.backgroundColor=[UIColor clearColor];
    RecomendationsValueLbl.text=@"9";
    
    ShareLbl=[[UILabel alloc]init];
    ShareLbl.frame=CGRectMake(218,115,80,15);
    ShareLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:1.0];
    ShareLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:10.0];
    ShareLbl.backgroundColor=[UIColor clearColor];
    ShareLbl.text=@"Share";
    
    ShareValueLbl=[[UILabel alloc]init];
    ShareValueLbl.frame=CGRectMake(226,140,80,15);
    ShareValueLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:0.5f];
    ShareValueLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    ShareValueLbl.backgroundColor=[UIColor clearColor];
    ShareValueLbl.text=@"9";
    
    TweetsLbl=[[UILabel alloc]init];
    TweetsLbl.frame=CGRectMake(268,115,80,15);
    TweetsLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:1.0];
    TweetsLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:10.0];
    TweetsLbl.backgroundColor=[UIColor clearColor];
    TweetsLbl.text=@"Tweets";
    
    TweetsValueLbl=[[UILabel alloc]init];
    TweetsValueLbl.frame=CGRectMake(277,140,80,15);
    TweetsValueLbl.textColor = [UIColor colorWithRed:35.0/255.0 green:35.0/255.0 blue:35.0/255.0 alpha:0.5f];
    TweetsValueLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    TweetsValueLbl.backgroundColor=[UIColor clearColor];
    TweetsValueLbl.text=@"9";

    
    

    
     [cell.contentView addSubview:BackgroundImage];
    [cell.contentView addSubview:HeadingLbl];
    [cell.contentView addSubview:SubHeadingLbl];
        [cell.contentView addSubview:ViewLbl];
    [cell.contentView addSubview:ViewValueLbl];
     [cell.contentView addSubview:ReadsLbl];
    [cell.contentView addSubview:ReadsValueLbl];
    [cell.contentView addSubview:RecomendationsLbl];
    [cell.contentView addSubview:RecomendationsValueLbl];
    [cell.contentView addSubview:ShareLbl];
    [cell.contentView addSubview:ShareValueLbl];
    [cell.contentView addSubview:TweetsLbl];
     [cell.contentView addSubview:TweetsValueLbl];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //Do Nothing..
}

@end
