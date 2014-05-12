//
//  DAEntryCell.h
//  Diary
//
//  Created by Collin Hartigan on 5/11/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DADiaryEntry;

@interface DAEntryCell : UITableViewCell

+ (CGFloat)heightForEntry:(DADiaryEntry *)entry;

@end
