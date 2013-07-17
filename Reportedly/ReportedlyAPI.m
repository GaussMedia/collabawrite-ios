
#import "ReportedlyAPI.h"
#import "JSON.h"

@interface ReportedlyAPI ()

@end

@implementation ReportedlyAPI

#pragma mark-
#pragma mark Request.

+ (NSString *)sendRequest:(NSMutableURLRequest *)request
{
	
	NSHTTPURLResponse *response;
	NSError *error;
	NSData *responseData;
	responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	if(responseData && [responseData length])
    {
		NSString* aStr;
		aStr = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
		return aStr;
	}
	else
    {
		return @"No Record Found";
	}
}

#pragma mark -
#pragma mark User Login.

+(NSMutableDictionary *)UserLogin:(NSDictionary *)userLoginInfoDict
{
    NSString *urlStr = [NSString stringWithFormat:@"http://reportedly.pnf-sites.info/webservices/iphone/api1/login/%@/%@",[userLoginInfoDict valueForKey:@"Username"],[userLoginInfoDict valueForKey:@"password"]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlStr]];
	NSString *responseString = [ReportedlyAPI sendRequest:request];
	NSDictionary *responseDict = [responseString JSONValue];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
    //NSLog(@"dict-------------%@",dict);
    return dict;
}


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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
