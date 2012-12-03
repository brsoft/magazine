//
//  ArticleDetail.h
//  magazine
//
//  Created by Leslie.Li on 12/3/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleDetail : NSObject
@property int articleId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *pubdate;
@property (nonatomic, copy) NSString *articleDesc;
@property (nonatomic, copy) NSString *articleBody;

- (id)initArticleDetailWithJsonDictionary:(NSDictionary *)dictionary;

@end
