//
//  HomeViewController.h
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "BaseViewController.h"
#import "ArticleBaseViewController.h"
#import "PhotoBaseViewController.h"
#import "PostBaseViewController.h"
#import "SettingViewController.h"

@interface HomeViewController : BaseViewController <UITabBarControllerDelegate>

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) ArticleBaseViewController *articleBaseView;
@property (strong, nonatomic) PhotoBaseViewController *photoBaseView;
@property (strong, nonatomic) PostBaseViewController *postBaseView;
@property (strong, nonatomic) SettingViewController *settingView;

- (void)initView;

@end
