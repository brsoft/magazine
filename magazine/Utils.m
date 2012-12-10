//
//  Utils.m
//  magazine
//
//  Created by Leslie.Li on 11/27/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "Utils.h"
#import "JSONKit.h"
#import "Article.h"

@implementation Utils

+ (UIColor *)getBackgroundColor
{
    return [UIColor colorWithRed:235.0/255 green:235.0/255 blue:243.0/255 alpha:1.0];
}
+ (UIColor *)getCellBackgroundColor
{
    return [UIColor colorWithRed:235.0/255 green:235.0/255 blue:243.0/255 alpha:1.0];
}
+ (NSMutableArray *)readStrNewsArray:(NSString *)str {
    NSData *respData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *result = [respData objectFromJSONData];
    NSMutableArray *articleList = [[NSMutableArray alloc] initWithCapacity:result.count];
    for (int i = 0; i < result.count; i++) {
        NSDictionary *dic = [result objectAtIndex:i];
        Article *article = [[Article alloc]initTitleListWithJsonDictionary:dic];
        [articleList addObject:article];
    }
    return articleList;
}
+ (NSString *) formatDateTime:(NSDate *)_date {
    return [self formatDateTime:_date format:DATE_TIME_FORMAT_01];
}
+ (NSString *) formatDateTime:(NSDate *)_date format:(NSString *)_format{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:_format];
    NSString *result = [format stringFromDate:_date];
    [format release];
    return result;
}

@end
