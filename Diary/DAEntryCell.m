//
//  DAEntryCell.m
//  Diary
//
//  Created by Collin Hartigan on 5/11/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import "DAEntryCell.h"
#import "DADiaryEntry.h"

@interface DAEntryCell ()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIImageView *moodImageView;

@end

@implementation DAEntryCell

+(CGFloat)heightForEntry:(DADiaryEntry *)entry {
    const CGFloat topMargin = 35.0f;
    const CGFloat bottomMargin = 80.0f;
    const CGFloat minHeight = 85.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [entry.body boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) +topMargin + bottomMargin);
}

-(void)configureCellForEntry:(DADiaryEntry *)entry {
    self.bodyLabel.text = entry.body;
    self.locationLabel.text = entry.location;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE, MMMM d yyyy"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:entry.date];
    
    self.dateLabel.text = [dateFormatter stringFromDate:date];
    
    if (entry.imageData) {
        self.mainImageView.image = [UIImage imageWithData:entry.imageData];
    }else {
        self.mainImageView.image = [UIImage imageNamed:@"IMAGENAMEHERE"];
    }
    
    if (entry.mood == DADiaryEntryMoodGood) {
        self.moodImageView.image = [UIImage imageNamed:@"IMAGENAMEHERE"];
    }else if (entry.mood == DADiaryEntryMoodAverage) {
        self.moodImageView.image = [UIImage imageNamed:@"IMAGENAMEHERE"];
    }else if (entry.mood == DADiaryEntryMoodBad) {
        self.moodImageView.image = [UIImage imageNamed:@"IMAGENAMEHERE"];
    }
    
}




@end
