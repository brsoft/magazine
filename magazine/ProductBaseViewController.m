//
//  ArticleBaseViewController.m
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "ProductBaseViewController.h"


@interface ProductBaseViewController ()

@end

@implementation ProductBaseViewController

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
    return NAV_TITLE_PRODUCT;
}

- (void)initView {
    self.tabBarItem.image = [UIImage imageNamed:TAB_IMAGE_PRODUCT];
    self.tabBarItem.title = BTN_TITLE_PRODUCT;
    
    NSArray *segmentTextArr = [NSArray arrayWithObjects:PRODUCT_TYPE_IPHONE,
                                                        PRODUCT_TYPE_WEB,
                                                        PRODUCT_TYPE_SOFTWARE,
                                                        nil];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentTextArr];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    self.segmentedControl.frame = CGRectMake(0, 0, 300, 30);
    [self.segmentedControl addTarget:self action:@selector(onSelectSegment:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = self.segmentedControl;
    
    self.productListView = [[ProductListViewController alloc] init];
    //self.productListView.catalog = 1;
    [self addChildViewController:self.productListView];
    [self.view addSubview:self.productListView.view];
}

- (NSString *)getSegmentedTitle {
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            return PRODUCT_TYPE_IPHONE;
            break;
        case 1:
            return PRODUCT_TYPE_WEB;
            break;
        case 2:
            return PRODUCT_TYPE_SOFTWARE;
            break; 
        default:
            return msg_empty;
            break;
    }
}

- (void)onSelectSegment:(id)sender {
    //[self.productListView reloadProductList:self.segmentedControl.selectedSegmentIndex andRefresh:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    if (self.segmentedControl == nil || self.productListView == nil) {
        [self initView];
    }
}

- (void)viewDidUnload {
    [super viewDidUnload];
    self.segmentedControl = nil;
    self.productListView = nil;
}

@end
