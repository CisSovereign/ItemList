//
//  DADiaryEntry.h
//  Diary
//
//  Created by Collin Hartigan on 5/5/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ENUM(int16_t, DADiaryEntryMood){
    DADiaryEntryMoodGood = 0,
    DADiaryEntryMoodAverage = 1,
    DADiaryEntryMoodBad = 2
};

@interface DADiaryEntry : NSManagedObject

@property (nonatomic) NSTimeInterval date;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSData * imageData;
@property (nonatomic) int16_t mood;
@property (nonatomic, retain) NSString * location;

@property (nonatomic, readonly) NSString *sectionName;

@end
