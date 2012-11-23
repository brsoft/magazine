//
//  Article.h
//  magazine
//
//  Created by Leslie.Li on 11/23/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject
@property int articleId;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * url;
@property (nonatomic,copy) NSString * author;
@property int authorId;
@property (nonatomic,copy) NSString * publishDate;
@property (nonatomic,copy) NSString * imageUrl;
@property int visitsCount;
@property int articleType;
@property (nonatomic,copy) NSString * summary;

- (id)initWithParameters:(int)aArticleId
                andTitle:(NSString *)aArticleTitle
                  andUrl:(NSString *)aArticleUrl
               andAuthor:(NSString *)aAuthor
             andAuthorID:(int)aAuthorId
              andPubDate:(NSString *)aPublishDate
             andImageUrl:(NSString *)aImageUrl
          andVisitsCount:(int)aVisitsCount
          andArticleType:(int)aArticleType
               andSummay:(NSString *)aSummay;
@end
