//
//  ProductDetail.m
//  magazine
//
//  Created by 冯 光强 on 12-12-10.
//  Copyright (c) 2012年 brsoft. All rights reserved.
//

#import "ProductDetail.h"

@implementation ProductDetail

- (id)initWithParameters:(int)_pId
                   title:(NSString *)_title
             publishDate:(NSString *)_publishDate
                imageUrl:(NSString *)_imageUrl
             description:(NSString *)_description
                    body:(NSString *)_body{
    ProductDetail *product= [[ProductDetail alloc] init];
    product.pid = _pId;
    product.title = _title;
    product.publishDate = _publishDate;
    product.imageUrl = _imageUrl;
    product.description = _description;
    product.body = _body;
    return product;
}

- (id)initWithJsonDictionary:(NSDictionary *)dictionary{
    ProductDetail *product= [[ProductDetail alloc] init];
    product.pid = [[dictionary objectForKey:@"id"] integerValue];
    product.title = [dictionary objectForKey:@"title"];
    product.publishDate = [Utils formatDateTime:[NSDate dateWithTimeIntervalSince1970:[[dictionary objectForKey:@"pubdate"] integerValue]]];
    product.imageUrl = [dictionary objectForKey:@"litpic"];
    product.description = [dictionary objectForKey:@"description"];
    product.body = [dictionary objectForKey:@"body"];
    return product;
}

@end
