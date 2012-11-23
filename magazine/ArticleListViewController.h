//
//  ArticleListViewController.h
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "BaseViewController.h"
#import "ArticleListCell.h"
#import "Article.h"
#import "LoadingCellSingleton.h"

@interface ArticleListViewController : BaseViewController <UITabBarControllerDelegate, UITableViewDataSource, UITableViewDelegate>
{
    BOOL isLoading;
    BOOL isLoadOver;
}

@property int catalog;
@property (strong, nonatomic) NSMutableArray *articleAry;
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
