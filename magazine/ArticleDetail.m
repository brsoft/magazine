//
//  ArticleDetail.m
//  magazine
//
//  Created by Leslie.Li on 12/3/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "ArticleDetail.h"
#import "Constants.h"

@implementation ArticleDetail
@synthesize articleId;
@synthesize title;
@synthesize pubdate;
@synthesize articleDesc;
@synthesize articleBody;

- (id)initArticleDetailWithJsonDictionary:(NSDictionary *)dictionary
{
    ArticleDetail *articleDetail = [[ArticleDetail alloc] init];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:DATE_TIME_FORMAT_01];
    
    articleDetail.articleId = [[dictionary objectForKey:@"id"] integerValue];
    articleDetail.title = [dictionary objectForKey:@"title"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[dictionary objectForKey:@"pubdate"] integerValue]];
    articleDetail.pubdate = [format stringFromDate:date];
    articleDetail.articleDesc = [dictionary objectForKey:@"description"];
    articleDetail.articleBody = [dictionary objectForKey:@"body"];
    
    return articleDetail;
}

@end
