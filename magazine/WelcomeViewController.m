//
//  WelcomeViewController.m
//  magazine
//
//  Created by Leslie.Li on 11/21/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "WelcomeViewController.h"
#import "Constants.h"
#import "HomeViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController
@synthesize autoHidedenTimer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setLeftRightButtonHidden:(BOOL)hidden {
    [self.leftBtn setHidden:hidden];
    [self.rightBtn setHidden:hidden];
}

- (NSArray *) getImages {
    NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
    
    [array addObject:[UIImage imageNamed:@"mm001.png"]];
    [array addObject:[UIImage imageNamed:@"mm002.png"]];
    [array addObject:[UIImage imageNamed:@"mm003.png"]];
    [array addObject:[UIImage imageNamed:@"mm004.png"]];
    [array addObject:[UIImage imageNamed:@"mm005.png"]];
    [array addObject:[UIImage imageNamed:@"mm006.png"]];
    
    return array;
}

- (NSString *)navTitle {
    return NAV_TITLE_WELCOME;
}

- (void)initNavigation {
    UIBarButtonItem *homeBtn = [[UIBarButtonItem alloc] initWithTitle:BTN_TITLE_HOME style:UIBarButtonItemStylePlain target:self action:@selector(goHomeScreen)];
    self.navigationItem.leftBarButtonItem = homeBtn;
    [homeBtn release];
}

- (void)initImages {
    self.imageAry = [self getImages];
    
    currentPage = 0;
    maxPage = [self.imageAry count] - 1;
    
    if ([self.imageAry count] > 0) {
        self.imageView.image = [self.imageAry objectAtIndex:currentPage];
    } else {
        self.imageView.image = [UIImage imageNamed:@"mm001.png"];
    }
    
    [self.leftBtn setImage:[UIImage imageNamed:@"arrow-left.png"] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@"arrow-right.png"] forState:UIControlStateNormal];
    
    UITapGestureRecognizer *recongnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnImageView:)];
    [self.view addGestureRecognizer:recongnizer];
    [recongnizer release];
    
    [self setLeftRightButtonHidden:YES];
}

- (void)startImageTimer {
    if ([self.imageAry count] == 0) {
        return;
    }
    
    if (imageTimer) {
        [imageTimer invalidate];
    }
    
    imageTimer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(goToNextImage) userInfo:nil repeats:NO];
}

- (void) doImageTransition:(BOOL)isTransition {
    [self.imageView.layer removeAllAnimations];
    
    if (isTransition) {
        CATransition *transition = [CATransition animation];
        [transition setDuration:0.75];
        [transition setType:kCATransitionFade];
        [transition setSubtype:kCATransitionFromRight];
        [self.imageView.layer addAnimation:transition forKey:@"imageTransition"];
        self.imageView.image = [self.imageAry objectAtIndex:currentPage];
    } else {
        // if not transition
        [UIView beginAnimations:@"imageTransition" context:NULL];
        UIViewAnimationTransition animation = UIViewAnimationTransitionFlipFromRight;
        [UIView setAnimationTransition:animation forView:self.imageView.superview cache:YES];
        [UIView setAnimationDuration:0.75];
        self.imageView.image = [self.imageAry objectAtIndex:currentPage];
        [UIView commitAnimations];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self initImages];
    [self doImageTransition:YES];
    [self startImageTimer];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initNavigation];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickLeft:(id)sender {
    if (currentPage > 0) {
        currentPage--;
    } else {
        currentPage = maxPage;
    }
    
    [self doImageTransition:YES];
    [self startImageTimer];
    [self startAutoHiddenTimer];
}

- (IBAction)clickRight:(id)sender {
    if (currentPage < maxPage) {
        currentPage++;
    } else {
        currentPage = 0;
    }
    
    [self doImageTransition:YES];
    [self startImageTimer];
    [self startAutoHiddenTimer];
}

- (void) goToNextImage {
    if (currentPage < maxPage) {
        currentPage++;
    } else {
        currentPage = 0;
    }
    
    [self doImageTransition:YES];
    [self startImageTimer];
}

- (void) startAutoHiddenTimer {
    if (autoHidedenTimer != nil) {
        [autoHidedenTimer invalidate];
    }
    
    self.autoHidedenTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(btnHidden) userInfo:nil repeats:NO];
}

- (void)btnHidden {
    [self setLeftRightButtonHidden:YES];
    UITapGestureRecognizer *recongnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickOnImageView:)];
    [self.view addGestureRecognizer:recongnizer];
    [recongnizer release];
}

- (void)goHomeScreen {
    HomeViewController *homeView = [[HomeViewController alloc] init];
//    [self.navigationController pushViewController:homeView animated:NO];
//    [homeView release];
    
    self.view.window.rootViewController = homeView;
    [self.view.window makeKeyAndVisible];
}

- (void)clickOnImageView:(UITapGestureRecognizer *)recognizer {
//    [self setLeftRightButtonHidden:NO];
//    [self startAutoHiddenTimer];
//    [self.view removeGestureRecognizer:recognizer];
    [self goHomeScreen];
    //[self.view removeGestureRecognizer:recognizer];
}

- (void)dealloc {
    [_imageView release];
    [_leftBtn release];
    [_rightBtn release];
    [super dealloc];
}

@end
