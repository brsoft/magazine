//
//  ArticleListCell.m
//  magazine
//
//  Created by Leslie.Li on 11/23/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "ArticleListCell.h"

@implementation ArticleListCell
@synthesize imgView;
@synthesize lblTitle;
@synthesize lblDescription;
@synthesize lblDate;


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

@end
