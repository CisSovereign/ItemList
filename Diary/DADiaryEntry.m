//
//  DADiaryEntry.m
//  Diary
//
//  Created by Collin Hartigan on 5/5/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import "DADiaryEntry.h"


@implementation DADiaryEntry

@dynamic date;
@dynamic body;
@dynamic imageData;
@dynamic mood;
@dynamic location;

-(NSString *)sectionName {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM yyyy"];
    
    return [dateFormatter stringFromDate:date];
}

@end
