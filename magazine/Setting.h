//
//  Setting.h
//  magazine
//
//  Created by Leslie.Li on 11/23/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Setting : NSObject

@property (copy,nonatomic) NSString * img;
@property (copy,nonatomic) NSString * title;
@property NSUInteger tag;

- (id)initWith:(NSString *)_title andImg:(NSString *)_img andTag:(NSUInteger)_tag;

@end
