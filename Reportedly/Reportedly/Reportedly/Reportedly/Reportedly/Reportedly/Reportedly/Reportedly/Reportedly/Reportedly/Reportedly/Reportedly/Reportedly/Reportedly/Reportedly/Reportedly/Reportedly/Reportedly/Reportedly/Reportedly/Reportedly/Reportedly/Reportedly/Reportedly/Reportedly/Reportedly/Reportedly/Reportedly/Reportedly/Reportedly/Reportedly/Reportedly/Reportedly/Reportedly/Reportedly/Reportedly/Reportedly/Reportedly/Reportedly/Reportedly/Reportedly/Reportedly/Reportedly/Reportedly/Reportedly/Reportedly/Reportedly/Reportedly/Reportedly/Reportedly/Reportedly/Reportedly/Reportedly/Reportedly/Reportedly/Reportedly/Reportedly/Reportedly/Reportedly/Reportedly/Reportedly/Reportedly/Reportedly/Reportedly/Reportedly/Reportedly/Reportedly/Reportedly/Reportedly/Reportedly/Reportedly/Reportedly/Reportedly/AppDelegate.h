//
//  AppDelegate.h
//  Reportedly
//
//  Created by PICNFRAMES TECHNOLOGIES on 03/06/13.
//  Copyright (c) 2013 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate>
{
    UIWindow *window;
    UINavigationController *navController;
    AppDelegate *appDelegate;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) UINavigationController *navController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
