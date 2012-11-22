//
//  PostBaseViewController.m
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "PostBaseViewController.h"

@interface PostBaseViewController ()

@end

@implementation PostBaseViewController

@synthesize postListView;

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
    return @"留言";
}

- (void)initView {
    self.tabBarItem.image = [UIImage imageNamed:@"info"];
    self.tabBarItem.title = @"留言";
    
    self.postListView = [[PostListViewController alloc] init];
    [self addChildViewController:self.postListView];
    [self.view addSubview:self.postListView.view];
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.postListView == nil) {
        [self initView];
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.postListView = nil;
}

@end
