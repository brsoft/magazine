//
//  LoadingCellSingleton.m
//  magazine
//
//  Created by Leslie.Li on 11/24/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "LoadingCellSingleton.h"

@implementation LoadingCellSingleton

- (UITableViewCell *)getLoadMoreCell:(UITableView *)tableView
                       andIsLoadOver:(BOOL)isLoadOver
                   andLoadOverString:(NSString *)loadOverString
                    andLoadingString:(NSString *)loadingString
                        andIsLoading:(BOOL)isLoading
{
    LoadingCell * cell = [tableView dequeueReusableCellWithIdentifier:@"loadingCell"];
    if (!cell) {
        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"LoadingCell" owner:self options:nil];
        for (NSObject *o in objects) {
            if ([o isKindOfClass:[LoadingCell class]]) {
                cell = (LoadingCell *)o;
                break;
            }
        }
    }
    cell.lblLoading.font = [UIFont boldSystemFontOfSize:17.0];
    cell.lblLoading.text = isLoadOver ? loadOverString : loadingString;
    if (isLoading) {
        cell.activityLoading.hidden = NO;
        [cell.activityLoading startAnimating];
    }
    else
    {
        cell.activityLoading.hidden = YES;
        [cell.activityLoading stopAnimating];
    }
    return cell;
}

#pragma 单例模式定义
static LoadingCellSingleton * instance = nil;
+(LoadingCellSingleton *) Instance
{
    @synchronized(self)
    {
        if(nil == instance)
        {
            [self new];
        }
    }
    return instance;
}
+(id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if(instance == nil)
        {
            instance = [super allocWithZone:zone];
            return instance;
        }
    }
    return nil;
}
@end
