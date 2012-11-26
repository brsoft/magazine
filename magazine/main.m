//
//  main.m
//  magazine
//
//  Created by Leslie.Li on 11/21/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "JSONKit.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    
//    NSDateFormatter *format = [[NSDateFormatter alloc] init];
//    [format setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSDate *now = [[NSDate alloc] init];
//    NSLog(@"Now: @%@",now);
//    NSLog(@"%@", [format stringFromDate:now]);
//    
//    NSLog(@"Milis: %f", now.timeIntervalSince1970);
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:1353777064];
//    
//    NSLog(@"Date: %@", date);
//    NSLog(@"%@", [format stringFromDate:date]);
    
    
//    NSString *json = @"{\"a\":123, \"b\":\"abc\", \"c\":[134, \"hello\"],\"d\":{\"name\":\"张三\",\"age\":23}}";
//    NSLog(@"json:%@", json);
////    NSDictionary *data = [json objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
//    NSData *d = [json dataUsingEncoding:NSUTF8StringEncoding];
//    NSDictionary *data = [d objectFromJSONData];
//    NSLog(@"json.c:%@", [data objectForKey:@"c"]);
//    NSLog(@"json.d:%@", [[data objectForKey:@"d"]objectForKey:@"name"]);
//    [json release];
}
