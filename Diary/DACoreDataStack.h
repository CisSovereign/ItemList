//
//  DACoreDataStack.h
//  Diary
//
//  Created by Collin Hartigan on 5/5/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DACoreDataStack : NSObject

+ (instancetype)defaultStack;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
