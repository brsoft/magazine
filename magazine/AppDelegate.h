//
//  AppDelegate.h
//  magazine
//
//  Created by Leslie.Li on 11/21/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WelcomeViewController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) WelcomeViewController *viewController;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
