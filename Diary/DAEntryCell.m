//
//  DAEntryCell.m
//  Diary
//
//  Created by Collin Hartigan on 5/11/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import "DAEntryCell.h"
#import "DADiaryEntry.h"

@implementation DAEntryCell

+(CGFloat)heightForEntry:(DADiaryEntry *)entry {
    const CGFloat topMargin = 35.0f;
    const CGFloat bottomMargin = 39.0f;
    const CGFloat minHeight = 85.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [entry.body boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) +topMargin + bottomMargin);
}


@end
