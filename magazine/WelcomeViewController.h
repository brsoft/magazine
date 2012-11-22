//
//  WelcomeViewController.h
//  magazine
//
//  Created by Leslie.Li on 11/21/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "BaseViewController.h"

@interface WelcomeViewController : BaseViewController {
    NSInteger currentPage;
    NSInteger maxPage;
    NSTimer *imageTimer;
}
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UIButton *leftBtn;
@property (retain, nonatomic) IBOutlet UIButton *rightBtn;

@property (retain, nonatomic) IBOutlet NSTimer *autoHidedenTimer;
@property (retain, nonatomic) NSArray *imageAry;


- (IBAction)clickLeft:(id)sender;
- (IBAction)clickRight:(id)sender;

- (void) startImageTimer;
- (void) startAutoHiddenTimer;
- (void) goToNextImage;
- (void) goHomeScreen;

@end
