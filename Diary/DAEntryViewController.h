//
//  DANewEntryViewController.h
//  Diary
//
//  Created by Collin Hartigan on 5/7/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DADiaryEntry;

@interface DAEntryViewController : UIViewController

@property (nonatomic, strong) DADiaryEntry *entry;

@end
