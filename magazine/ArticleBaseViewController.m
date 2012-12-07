//
//  ArticleBaseViewController.m
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "ArticleBaseViewController.h"


@interface ArticleBaseViewController ()

@end

@implementation ArticleBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)navTitle {
    return NAV_TITLE_ARTICLE;
}

- (void)initView {
    self.tabBarItem.image = [UIImage imageNamed:TAB_IMAGE_ACTICLE];
    self.tabBarItem.title = BTN_TITLE_ARTICLE;
    
    NSArray *segmentTextArr = [NSArray arrayWithObjects:ARTICLE_TYPE_IPHONE,
                                                        ARTICLE_TYPE_ANDROID,
                                                        ARTICLE_TYPE_WEBSITE,
                                                        ARTICLE_TYPE_EC,
                                                        nil];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentTextArr];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    self.segmentedControl.frame = CGRectMake(0, 0, 300, 30);
    [self.segmentedControl addTarget:self action:@selector(onSelectSegment:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = self.segmentedControl;
    
    self.articleListView = [[ArticleListViewController alloc] init];
    self.articleListView.catalog = 1;
    [self addChildViewController:self.articleListView];
    [self.view addSubview:self.articleListView.view];
}

- (NSString *)getSegmentedTitle {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            return ARTICLE_TYPE_IPHONE;
            break;
        case 1:
            return ARTICLE_TYPE_ANDROID;
            break;
        case 2:
            return ARTICLE_TYPE_WEBSITE;
            break;
        case 3:
            return ARTICLE_TYPE_EC;
            break;
            
        default:
            return @"";
            break;
    }
}

- (void)onSelectSegment:(id)sender {
    [self.articleListView reloadArticleList:self.segmentedControl.selectedSegmentIndex andRefresh:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.segmentedControl == nil || self.articleListView == nil) {
        [self initView];
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.segmentedControl = nil;
    self.articleListView = nil;
}

@end
