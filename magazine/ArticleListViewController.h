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
#import "EGORefreshTableHeaderView.h"

@interface ArticleListViewController : BaseViewController <UITabBarControllerDelegate, UITableViewDataSource, UITableViewDelegate, EGORefreshTableHeaderDelegate>
{
    BOOL isLoading;
    BOOL isLoadOver;
    int allArticleCount;
    
    BOOL _reloading;
    EGORefreshTableHeaderView *_refreshHeaderView;
}

@property int catalog;
@property (strong, nonatomic) NSMutableArray *articleAry;
@property (retain, nonatomic) IBOutlet UITableView *tableView;

- (NSMutableArray *)getArticleList:(int)aTypeid andBeginIndex:(int)begin andEndIndex:(int)end;
- (void)reloadArticleList:(int)catalogId andRefresh:(BOOL)refresh andIsScrollPull:(BOOL)isPull;
- (void)clear;

-(void)reloadTableViewDataSource;
-(void)doneLoadingTableViewData;
-(void)refresh;

@end
