//
//  Product.h
//  magazine
//
//  Created by 冯 光强 on 12-12-10.
//  Copyright (c) 2012年 brsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseObject.h"

@interface Product : BaseObject

@property int pid;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * publishDate;
@property (nonatomic,copy) NSString * imageUrl;
@property (nonatomic,copy) NSString * description;
@property (nonatomic,copy) NSString * body;

- (id)initWithParameters:(int)_pId
                   title:(NSString *)_title
             publishDate:(NSString *)_publishDate
                imageUrl:(NSString *)_imageUrl
             description:(NSString *)_description
                    body:(NSString *)_body;
- (id)initWithJsonDictionary:(NSDictionary *)dictionary;
@end
