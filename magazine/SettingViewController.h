//
//  SettingViewController.h
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "BaseViewController.h"

@interface SettingViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *settingTableView;
@property (retain, nonatomic) NSMutableDictionary *settingsDictionary;
@property (retain, nonatomic) NSArray *settingSectons;

- (void)initSettingsData;

@end
