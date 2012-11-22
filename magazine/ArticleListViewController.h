//
//  ArticleListViewController.h
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "BaseViewController.h"

@interface ArticleListViewController : BaseViewController <UITabBarControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property int catalog;

@end
