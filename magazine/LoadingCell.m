//
//  LoadingCell.m
//  magazine
//
//  Created by Leslie.Li on 11/24/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "LoadingCell.h"

@implementation LoadingCell

@synthesize lblLoading;
@synthesize activityLoading;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [lblLoading release];
    [activityLoading release];
    [super dealloc];
}
@end
