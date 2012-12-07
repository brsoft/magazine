//
//  ArticleBaseViewController.h
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "BaseViewController.h"
#import "ProductListViewController.h"

@interface ProductBaseViewController : BaseViewController

@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) ProductListViewController *productListView;

- (void) initView;
- (NSString *) getSegmentedTitle;

@end
