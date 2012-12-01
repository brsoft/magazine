//
//  Article.m
//  magazine
//
//  Created by Leslie.Li on 11/23/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "Article.h"

@implementation Article
@synthesize articleId;
@synthesize title;
@synthesize url;
@synthesize author;
@synthesize authorId;
@synthesize publishDate;
@synthesize imageUrl;
@synthesize visitsCount;
@synthesize articleType;

- (id)initWithParameters:(int)aArticleId
                andTitle:(NSString *)aArticleTitle
                  andUrl:(NSString *)aArticleUrl
               andAuthor:(NSString *)aAuthor
             andAuthorID:(int)aAuthorId
              andPubDate:(NSString *)aPublishDate
             andImageUrl:(NSString *)aImageUrl
          andVisitsCount:(int)aVisitsCount
          andArticleType:(int)aArticleType
               andSummay:(NSString *)aSummay
{
    Article *article = [[Article alloc] init];
    article.articleId = aArticleId;
    article.title = aArticleTitle;
    article.url = aArticleUrl;
    article.author = aAuthor;
    article.authorId = aAuthorId;
    article.publishDate = aPublishDate;
    article.imageUrl = aImageUrl;
    article.visitsCount = aVisitsCount;
    article.articleType = aArticleType;
    article.summary = aSummay;
    
    return article;
}

- (id)initTitleListWithJsonDictionary:(NSDictionary *)dictionary
{
    Article *article = [[Article alloc] init];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:DATE_TIME_FORMAT_01];
    
    article.articleType = [[dictionary objectForKey:@"typeid"] integerValue];
    article.articleId = [[dictionary objectForKey:@"id"] integerValue];
    article.visitsCount = [[dictionary objectForKey:@"click"] integerValue];
    article.title = [dictionary objectForKey:@"title"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[[dictionary objectForKey:@"pubdate"] integerValue]];
    article.publishDate = [format stringFromDate:date];
    article.summary = [dictionary objectForKey:@"description"];
    article.imageUrl = [dictionary objectForKey:@"litpic"];
    
    
    return article;
}

@end
