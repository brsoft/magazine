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
@end
