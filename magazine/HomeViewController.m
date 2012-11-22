//
//  HomeViewController.m
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize tabBarController = _tabBarController;
@synthesize articleBaseView;
@synthesize photoBaseView;
@synthesize postBaseView;
@synthesize settingView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        [self initView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view from its nib.
}

- (void)initView {
    self.articleBaseView = [[ArticleBaseViewController alloc] initWithNibName:@"ArticleBaseViewController" bundle:nil];
    UINavigationController *articleNav = [[UINavigationController alloc] initWithRootViewController:self.articleBaseView];
    
    self.photoBaseView = [[PhotoBaseViewController alloc] initWithNibName:@"PhotoBaseViewController" bundle:nil];
    UINavigationController *photoNav = [[UINavigationController alloc] initWithRootViewController:self.photoBaseView];
    
    self.postBaseView = [[PostBaseViewController alloc] initWithNibName:@"PostBaseViewController" bundle:nil];
    UINavigationController *postNav = [[UINavigationController alloc] initWithRootViewController:self.postBaseView];
    
    self.settingView = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
    UINavigationController *settingNav = [[UINavigationController alloc] initWithRootViewController:self.settingView];
    settingNav.navigationBarHidden = NO;
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:articleNav, photoNav, postNav, settingNav, nil];
    
    self.tabBarController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.tabBarController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
