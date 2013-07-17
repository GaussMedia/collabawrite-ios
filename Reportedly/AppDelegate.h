

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate>
{
      UINavigationController *loginNavController;
    UIWindow *window;
    UINavigationController *navController;
    AppDelegate *appDelegate;
     Reachability *reachStatus;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) UINavigationController *navController;
@property (strong, nonatomic) UINavigationController *loginNavController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


- (BOOL)checkForInternetConnection;
- (BOOL)updateInterfaceWithReachability:(Reachability*)curReach;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
