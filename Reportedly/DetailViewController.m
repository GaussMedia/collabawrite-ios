
#import "DetailViewController.h"
#import "MoreStoriesViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize mTableView;
@synthesize mCancelBtn;



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
            [[NSBundle mainBundle] loadNibNamed:@"DetailViewController" owner:self options:nil];
        }
        if(result.height == 568)
        {
            // iPhone 5
            [[NSBundle mainBundle] loadNibNamed:@"DetailViewController-568h" owner:self options:nil];
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
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        return 280;
    }
    
    else if(indexPath.row==1)
    {
    return 800;

    }
    else if (indexPath.row==2)
  {
      return 60;
  }
    
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
    ////For Tableview Label
//    HeadingLbl=[[UILabel alloc]init];
//    HeadingLbl.frame=CGRectMake(20,50,290,35);
//    HeadingLbl.textColor = [UIColor colorWithRed:93.0/255.0 green:93.0/255.0 blue:93.0/255.0 alpha:1];
//    HeadingLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0];
//    HeadingLbl.backgroundColor=[UIColor redColor];
//    HeadingLbl.text=@"When you finally go back to your old home, you find it wasn't the old home you missed but your childhood.";
//    HeadingLbl.numberOfLines=2;
    
    if (indexPath.row==0)
    {
        
        HeadingLbl=[[UILabel alloc]init];
        HeadingLbl.frame=CGRectMake(5,0,295,35);
        HeadingLbl.textColor = [UIColor colorWithRed:93.0/255.0 green:93.0/255.0 blue:93.0/255.0 alpha:1];
        HeadingLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0];
         HeadingLbl.numberOfLines =3;
        HeadingLbl.backgroundColor=[UIColor clearColor];
      //  [HeadingLbl setNumberOfLines:2];
      //  [HeadingLbl sizeToFit];
        HeadingLbl.text=@"When you finally go back to your old home, you find it wasn't the old home you missed but your childhood.";
        
        
        
        HolderContainImage=[[UIImageView alloc]init];
        HolderContainImage.frame=CGRectMake(5, 45,30,30);
        HolderContainImage.image = [UIImage imageNamed:@"Pari.JPG"];
        
        HolderImage=[[UIImageView alloc]init];
        HolderImage.frame=CGRectMake(5, 40,42,42);
        HolderImage.image = [UIImage imageNamed:@"img_holder.png"];
        
       
        
        ByLbl=[[UILabel alloc]init];
        ByLbl.frame=CGRectMake(50,41,20,40);
        ByLbl.textColor = [UIColor colorWithRed:93.0/255.0 green:93.0/255.0 blue:93.0/255.0 alpha:1];
        ByLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:10.0];
        ByLbl.backgroundColor=[UIColor clearColor];
        
        ByLbl.text=@"By";
        
        NameLbl=[[UILabel alloc]init];
        NameLbl.frame=CGRectMake(65,41,100,40);
        NameLbl.textColor = [UIColor colorWithRed:140.0/255.0 green:210.0/255.0 blue:2369.0/255.0 alpha:1];
        NameLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:10.0];
        NameLbl.backgroundColor=[UIColor clearColor];
        
        NameLbl.text=@"Josin Samuel";
        
        
        LineImage=[[UIImageView alloc]init];
        LineImage.frame=CGRectMake(25, 85, 250,1);
        LineImage.image = [UIImage imageNamed:@"line-1.png"];
        
        
        DescriptionLbl=[[UILabel alloc]init];
        DescriptionLbl.frame=CGRectMake(5,85,290,70);
        DescriptionLbl.textColor = [UIColor colorWithRed:124.0/255.0 green:124.0/255.0 blue:124.0/255.0 alpha:1];
        DescriptionLbl.font = [UIFont fontWithName:@"Helvetica" size:12.0];
        DescriptionLbl.numberOfLines =6;
        DescriptionLbl.backgroundColor=[UIColor clearColor];
         DescriptionLbl.text=@"Never make your home in a place. Make a home for yourself inside your own head. You'll find what you need to furnish it - memory, friends you can trust, love of learning, and other such things.";
        
        DisplayImage=[[UIImageView alloc]init];
        DisplayImage.frame=CGRectMake(5, 154, 290, 110);
        DisplayImage.image = [UIImage imageNamed:@"2.png"];

        
          [cell.contentView addSubview:ByLbl];
        [cell.contentView addSubview:NameLbl];
        [cell.contentView addSubview:HeadingLbl];
        
      // [cell.contentView addSubview:HolderContainImage];
        [cell.contentView addSubview:HolderImage];
        [cell.contentView addSubview:LineImage];
        [cell.contentView addSubview:DescriptionLbl];
        [cell.contentView addSubview:DisplayImage];
    }
    else if(indexPath.row==1)
        
    {
       SecondDescriptionLbl =[[UILabel alloc]init];
        SecondDescriptionLbl.frame=CGRectMake(5,0,290,80);
        SecondDescriptionLbl.textColor = [UIColor colorWithRed:124.0/255.0 green:124.0/255.0 blue:124.0/255.0 alpha:1];
        SecondDescriptionLbl.font = [UIFont fontWithName:@"Helvetica" size:12.0];
        SecondDescriptionLbl.numberOfLines =6;
        SecondDescriptionLbl.backgroundColor=[UIColor clearColor];
        
        SecondDescriptionLbl.text=@"How far you go in life depends on your being tender with the young, compassionate with the aged, sympathetic with the striving and tolerant of the weak and strong. Because someday in your life you will have been all of these.";
      
       
        DisplayImage=[[UIImageView alloc]init];
        DisplayImage.frame=CGRectMake(5, 90, 290, 100);
        DisplayImage.image = [UIImage imageNamed:@"2.png"];
        
        ThirdDescriptionLbl =[[UILabel alloc]init];
        ThirdDescriptionLbl.frame=CGRectMake(5,200,290,580);
        ThirdDescriptionLbl.textColor = [UIColor colorWithRed:124.0/255.0 green:124.0/255.0 blue:124.0/255.0 alpha:1];
        ThirdDescriptionLbl.font = [UIFont fontWithName:@"Helvetica" size:12.0];
        ThirdDescriptionLbl.numberOfLines =200;
        ThirdDescriptionLbl.backgroundColor=[UIColor clearColor];
        ThirdDescriptionLbl.text=@"When I stand before God at the end of my life, I would hope that I would not have a single bit of talent left, and could say, 'I used everything you gave me'.Throughout life people will make you mad, disrespect you and treat you bad. Let God deal with the things they do, cause hate in your heart will consume you too.How far you go in life depends on your being tender with the young, compassionate with the aged, sympathetic with the striving and tolerant of the weak and strong. Because someday in your life you will have been all of these.I have a simple philosophy: Fill what's empty. Empty what's full. Scratch where it itches.Never make your home in a place. Make a home for yourself inside your own head. You'll find what you need to furnish it - memory, friends you can trust, love of learning, and other such things. That way it will go with you wherever you journey.Trees are sanctuaries. Whoever knows how to speak to them, whoever knows how to listen to them, can learn the truth. They do not preach learning and precepts, they preach, undeterred by particulars, the ancient law of life. A tree says: A kernel is hidden in me, a spark, a thought, I am life from eternal life. The attempt and the risk that the eternal mother took with me is unique, unique the form and veins of my skin, unique the smallest play of leaves in my branches and the smallest scar on my bark. I was made to form and reveal the eternal in my smallest special detail.A tree says: My strength is trust. I know nothing about my fathers, I know nothing about the thousand children that every year spring out of me. I live out the secret of my seed to the very end, and I care for nothing else. I trust that God is in me. I trust that my labor is holy. Out of this trust I live.Home wasn't a set house, or a single town on a map. It was wherever the people who loved you were, whenever you were together. Not a place, but a moment, and then another, building on each other like bricks to create a solid shelter that you take with you for your entire life, wherever you may go,Everybody has a home team: It’s the people you call when you get a flat tire or when something terrible happens. It’s the people who, near or far, know everything that’s wrong with you and love you anyways. These are the ones who tell you their secrets, who get themselves a glass of water without asking when they’re at your house. These are the people who cry when you cry. These are your people, your middle-of-the-night, no-matter-what people. And then I laugh, because it's so ridiculous and so gorgeous and it's all I an do to not melt into a fit of giggles. ";
             [cell.contentView addSubview:SecondDescriptionLbl];
        [cell.contentView addSubview:DisplayImage];
        [cell.contentView addSubview:ThirdDescriptionLbl];
        
        
    }
    
    else if (indexPath.row==2)
    {
        
        
        MoreBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        MoreBtn.frame=CGRectMake(0, 0,320, 60);
        //[MoreBtn setTitle:@"More Stories by" forState:UIControlStateNormal];
        // FacebookBtn.backgroundColor=[UIColor blueColor];
        UIImage *FacebookButtonImage = [UIImage imageNamed:@"more_stories.png"];
        [MoreBtn setBackgroundImage:FacebookButtonImage forState:UIControlStateNormal];
        [MoreBtn addTarget:self action:@selector(FacebookButton) forControlEvents:UIControlEventTouchUpInside];
        
        
        MoreLbl =[[UILabel alloc]init];
        MoreLbl.frame=CGRectMake(55,14,100,30);
        MoreLbl.textColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
        MoreLbl.font = [UIFont fontWithName:@"Helvetica" size:14.0];
        MoreLbl.numberOfLines =0;
        MoreLbl.backgroundColor=[UIColor clearColor];
        
        MoreLbl.text=@"More stories by ";
        
        
        NameLbl =[[UILabel alloc]init];
        NameLbl.frame=CGRectMake(154,14,150,30);
        NameLbl.textColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
        NameLbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0];
        NameLbl.numberOfLines =0;
        NameLbl.backgroundColor=[UIColor clearColor];
        
        NameLbl.text=@"Josin Samuel";
        
      
        [cell.contentView addSubview:MoreBtn];
          [cell.contentView addSubview:MoreLbl];
          [cell.contentView addSubview:NameLbl];
    }
    return cell;
}

-(void)FacebookButton
{
    MoreStoriesViewController *MoreVC=[[MoreStoriesViewController alloc]initWithNibName:@"MoreStoriesViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:MoreVC animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
