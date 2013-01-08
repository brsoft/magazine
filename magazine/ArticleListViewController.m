//
//  ArticleListViewController.m
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "ArticleListViewController.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"
#import "Utils.h"


@interface ArticleListViewController ()

@end

@implementation ArticleListViewController

@synthesize catalog;
@synthesize articleAry;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(_refreshHeaderView == nil)
    {
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];//CGRectMake(0.0f, -320.0f, self.view.frame.size.width, 320)
        
        view.delegate = self;
        [self.tableView addSubview:view];
        _refreshHeaderView = view;
    }
    [_refreshHeaderView refreshLastUpdatedDate];
    

    self->allArticleCount = 0;
    self.articleAry = [[NSMutableArray alloc]initWithCapacity:page_size];
    [self reloadArticleList:0 andRefresh:NO andIsScrollPull:NO];
    self.tableView.backgroundColor = [Utils getBackgroundColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadArticleList:(int)catalogId andRefresh:(BOOL)refresh andIsScrollPull:(BOOL)isPull
{
    int typeId = -1;
    int beginIndex = 0;
    NSArray *newArticles;
    NSMutableArray *tempAry;
    
    self.catalog = catalogId;
    if (refresh) {
        [self clear];
    }
    
    if (isLoading || isLoadOver) {
        return;
    }
    
    switch (catalogId) {
        case 0:
            typeId = ARTICLE_TYPE_ID_IPHONE;
            break;
        case 1:
            typeId = ARTICLE_TYPE_ID_ANDROID;
            break;
        case 2:
            typeId = ARTICLE_TYPE_ID_WEBSITE;
            break;
        case 3:
            typeId = ARTICLE_TYPE_ID_EC;
            break;
    }
    
    beginIndex = self->allArticleCount;
    isLoading = YES;
    newArticles = [self getArticleList:typeId andBeginIndex:beginIndex andEndIndex:page_size];
    if (isPull) {
        // add the new records at the first
        tempAry = [[NSMutableArray alloc]initWithArray:newArticles];
        [tempAry addObjectsFromArray:self.articleAry];
        self.articleAry = tempAry;
        [tempAry release];
    } else {
        // click on the Next Records, add the new records at the last
        [self.articleAry addObjectsFromArray:newArticles];
    }
    
    if ([newArticles count] < page_size) {
        isLoadOver = YES;
    }
    
    self->allArticleCount += [newArticles count];
    [self.tableView reloadData];
    [self doneLoadingTableViewData];
    isLoading = NO;
}

- (void)clear
{
    self->allArticleCount = 0;
    [articleAry removeAllObjects];
    isLoadOver = NO;
}

- (NSMutableArray *)getArticleList:(int)aTypeid andBeginIndex:(int)begin andEndIndex:(int)end
{
    NSString *urlStr = [NSString stringWithFormat:api_article_list, aTypeid, begin, end];
    NSURL *url = [NSURL URLWithString:urlStr];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    //[request setResponseEncoding:NSUTF8StringEncoding];
    [request startSynchronous];
    
    NSError *error = [request error];
    if (!error) {
        NSString *respStr = [request responseString];
        NSMutableArray *articleList = [Utils readStrNewsArray:respStr];        
        //todo: download images?
        return articleList;
    } else {
        return nil;
    }
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (isLoadOver) {
        return articleAry.count == 0 ? 1 : articleAry.count;
    }
    else {
        return articleAry.count + 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([articleAry count] > 0) {
        if ([indexPath row] < [articleAry count])
        {
            ArticleListCell *cell = [tableView dequeueReusableCellWithIdentifier:article_cell_identifier];
            if (!cell) {
                NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"ArticleListCell" owner:self options:nil];
                for (NSObject *o in objects) {
                    if ([o isKindOfClass:[ArticleListCell class]]) {
                        cell = (ArticleListCell *)o;
                        break;
                    }
                }
            }
            cell.lblTitle.font = [UIFont boldSystemFontOfSize:15.0];
            Article *article = [articleAry objectAtIndex:[indexPath row]];
            cell.lblTitle.text = article.title;
            cell.lblDescription.text = article.summary;
            cell.lblDate.text = [NSString stringWithFormat:msg_article_publish, article.publishDate, article.visitsCount];
            if (article.imageUrl && ![article.imageUrl isEqualToString:@""]) {
                NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", article_source_url, article.imageUrl]];
                ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
                [request startSynchronous];
                cell.imgView.image = [UIImage imageWithData:[request responseData]];
            } else {
                cell.imgView.image = [UIImage imageNamed:@"mm004.png"];
            }
            
            
            //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
        else
        {
            return [[LoadingCellSingleton Instance] getLoadMoreCell:tableView andIsLoadOver:isLoadOver andLoadOverString:msg_article_loadAll andLoadingString:(isLoading ? loadingTip : loadNext20Tip) andIsLoading:isLoading];
        }
    }
    else
    {
        return [[LoadingCellSingleton Instance] getLoadMoreCell:tableView andIsLoadOver:isLoadOver andLoadOverString:msg_article_loadAll andLoadingString:(isLoading ? loadingTip : loadNext20Tip) andIsLoading:isLoading];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (articleAry.count == 0 || !([indexPath row] < [articleAry count])) {
        return 62;
    } else {
        return 110;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [Utils getCellBackgroundColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    if (row >= [articleAry count]) {
        if (!isLoading) {
            [self reloadArticleList:self.catalog andRefresh:NO andIsScrollPull:NO];
        }
    } else {
    
    }
}

#pragma mark EGOTableViewPullRefresh
- (void)reloadTableViewDataSource
{
    _reloading = YES;
}

- (void)doneLoadingTableViewData
{
    _reloading = NO;
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view
{
    [self reloadTableViewDataSource];
    [self refresh];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view
{
    return _reloading;
}

- (NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view
{
    return [NSDate date];
}

-(void)refresh
{
//    int endIndex = allArticleCount + page_size;
//    NSArray *newArticles = [self getArticleList:self.catalog andBeginIndex:allArticleCount andEndIndex:endIndex];
//    [self.articleAry addObjectsFromArray:newArticles];
//    allArticleCount += [newArticles count];
//    [self.tableView reloadData];
//    [self doneLoadingTableViewData];
    isLoadOver = NO;
    [self reloadArticleList:self.catalog andRefresh:NO andIsScrollPull:YES];
    [self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:2.0];
}

#pragma mark - Release
- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
