//
//  PhotoBaseViewController.m
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "PhotoBaseViewController.h"

@interface PhotoBaseViewController ()

@end

@implementation PhotoBaseViewController

@synthesize photoListView;

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
    return @"图库";
}

- (void)initView {
    self.tabBarItem.image = [UIImage imageNamed:@"info"];
    self.tabBarItem.title = @"图库";
    
    self.photoListView = [[PhotoListViewController alloc] init];
    [self addChildViewController:self.photoListView];
    [self.view addSubview:self.photoListView.view];
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.photoListView == nil) {
        [self initView];
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.photoListView = nil;
}

@end
