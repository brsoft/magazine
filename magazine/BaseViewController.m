//
//  BaseViewController.m
//  magazine
//
//  Created by Leslie.Li on 11/21/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *) navTitle {
    return @"";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = [self navTitle];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
