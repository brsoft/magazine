//
//  ArticleListViewController.m
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "ArticleListViewController.h"

#define article_cell_identifier @"articleCellIdentifier"
#define loadNext20Tip           @"下面 20 项 . . ."
#define loadingTip              @"正在加载 . . ."

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
    
    Article *art1 = [[Article alloc] initWithParameters:1 andTitle:@"title1" andUrl:@"url1" andAuthor:@"Leslie" andAuthorID:1 andPubDate:@"2012-11-24 23:00" andImageUrl:@"imageURL1" andVisitsCount:100 andArticleType:1 andSummay:@"Do any additional setup after loading the view from its nibDo any additional setup after loading the view from its nib"];
    Article *art2 = [[Article alloc] initWithParameters:2 andTitle:@"title2" andUrl:@"url2" andAuthor:@"Leslie" andAuthorID:1 andPubDate:@"2012-11-23 20:50" andImageUrl:@"imageURL2" andVisitsCount:100 andArticleType:1 andSummay:@"Do any additional setup after loading the view from its nibDo any additional setup after loading the view from its nib"];
    
    articleAry = [[NSMutableArray alloc] initWithObjects:art1, art2, nil];
    //[articleAry addObject:art1];
    //[articleAry addObject:art2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma TableView
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
            cell.lblDate.text = [NSString stringWithFormat:@"%@ 发布于 %@ (%d)", article.author, article.publishDate, article.visitsCount];
            cell.imgView.image = [UIImage imageNamed:@"mm004.png"];
            
            //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
        else
        {
            return [[LoadingCellSingleton Instance] getLoadMoreCell:tableView andIsLoadOver:isLoadOver andLoadOverString:@"已经加载全部文章" andLoadingString:(isLoading ? loadingTip : loadNext20Tip) andIsLoading:isLoading];
        }
    }
    else
    {
        return [[LoadingCellSingleton Instance] getLoadMoreCell:tableView andIsLoadOver:isLoadOver andLoadOverString:@"已经加载全部文章" andLoadingString:(isLoading ? loadingTip : loadNext20Tip) andIsLoading:isLoading];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (articleAry.count == 0 || !([indexPath row] < [articleAry count])) {
        return 62;
    } else {
        return 110;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //todo
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
