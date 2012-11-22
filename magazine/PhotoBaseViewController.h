//
//  PhotoBaseViewController.h
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "BaseViewController.h"
#import "PhotoListViewController.h"

@interface PhotoBaseViewController : BaseViewController

@property (strong, nonatomic) PhotoListViewController *photoListView;

- (void) initView;

@end
