
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MapViewController : UIViewController<MKMapViewDelegate>
{
    MKMapView* mapView;
}



@property(nonatomic,strong)IBOutlet UIButton *mCancelBtn;
@property (nonatomic, retain) MKMapView* mapView;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

-(IBAction)CancelButtonClicked;
@end
