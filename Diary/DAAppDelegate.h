//
//  DAAppDelegate.h
//  Diary
//
//  Created by Collin Hartigan on 5/5/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
