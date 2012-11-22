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
    return @"文章";
}

- (void)initView {
    self.tabBarItem.image = [UIImage imageNamed:@"info"];
    self.tabBarItem.title = @"文章";
    
    NSArray *segmentTextArr = [NSArray arrayWithObjects:@"推荐文章", @"最新文章", @"热门文章", nil];
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
            return @"推荐文章";
            break;
        case 1:
            return @"最新文章";
            break;
        case 2:
            return @"热门文章";
            break;
            
        default:
            return @"";
            break;
    }
}

- (void)onSelectSegment:(id)sender {

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
