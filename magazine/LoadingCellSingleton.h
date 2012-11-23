//
//  LoadingCellSingleton.h
//  magazine
//
//  Created by Leslie.Li on 11/24/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadingCell.h"

@interface LoadingCellSingleton : NSObject
+ (LoadingCellSingleton *) Instance;
+ (id)allocWithZone:(NSZone *)zone;

//返回标示正在加载的选项
- (UITableViewCell *)getLoadMoreCell:(UITableView *)tableView
                       andIsLoadOver:(BOOL)isLoadOver
                   andLoadOverString:(NSString *)loadOverString
                    andLoadingString:(NSString *)loadingString
                        andIsLoading:(BOOL)isLoading;
@end
