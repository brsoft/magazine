//
//  PostBaseViewController.h
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "BaseViewController.h"
#import "PostListViewController.h"

@interface PostBaseViewController : BaseViewController

@property (strong, nonatomic) PostListViewController *postListView;

- (void) initView;

@end
