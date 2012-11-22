//
//  Setting.m
//  magazine
//
//  Created by Leslie.Li on 11/23/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "Setting.h"

@implementation Setting

@synthesize img;
@synthesize title;
@synthesize tag;

- (id)initWith:(NSString *)_title andImg:(NSString *)_img andTag:(NSUInteger)_tag;
{
    Setting *setting = [[Setting alloc] init];
    setting.title = _title;
    setting.img = _img;
    setting.tag = _tag;
    return setting;
}

@end
