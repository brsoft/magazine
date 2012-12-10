//
//  Utils.h
//  magazine
//
//  Created by Leslie.Li on 11/27/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (UIColor *)getBackgroundColor;
+ (UIColor *)getCellBackgroundColor;

+ (NSMutableArray *)readStrNewsArray:(NSString *)str;
// Format Date
+ (NSString *) formatDateTime:(NSDate *)_date;
+ (NSString *) formatDateTime:(NSDate *)_date format:(NSString *)_format;
@end
