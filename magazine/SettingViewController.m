//
//  SettingViewController.m
//  magazine
//
//  Created by Leslie.Li on 11/22/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "SettingViewController.h"
#import "Setting.h"

#define SETTING_TABLE_CELL_IDENTIFIER @"settingTableIdentifier"

@interface SettingViewController ()

@end

@implementation SettingViewController
@synthesize settingTableView;
@synthesize settingsDictionary;
@synthesize settingSectons;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"更多";
        self.tabBarItem.title = @"更多";
        self.tabBarItem.image = [UIImage imageNamed:@"more"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initSettingsData];
}

- (NSString *)navTitle {
    return @"更多";
}

- (void)initSettingsData {
    self.settingsDictionary = [[NSMutableDictionary alloc] initWithCapacity:3];
    NSArray *section1 = [[NSArray alloc] initWithObjects:
                      [[Setting alloc] initWith: @"登录" andImg:@"setting" andTag:1],
                      [[Setting alloc] initWith: @"注销" andImg:@"setting" andTag:2],
                      nil];
    NSArray *section2 = [[NSArray alloc] initWithObjects:
                       [[Setting alloc] initWith:@"软件" andImg:@"setting" andTag:3],
                       [[Setting alloc] initWith:@"搜索" andImg:@"setting" andTag:4],
                       nil];
    NSArray *section3 = [[NSArray alloc] initWithObjects:
                      [[Setting alloc] initWith:@"意见反馈" andImg:@"setting" andTag:5],
                      [[Setting alloc] initWith:@"官方微博" andImg:@"weibo" andTag:6],
                      [[Setting alloc] initWith:@"关于我们" andImg:@"setting" andTag:7],
                      [[Setting alloc] initWith:@"检测更新" andImg:@"setting" andTag:8],
                      [[Setting alloc] initWith:@"给我评分" andImg:@"setting" andTag:9],
                      nil];
    [self.settingsDictionary setObject:section1 forKey:@"帐号"];
    [self.settingsDictionary setObject:section2 forKey:@"反馈"];
    [self.settingsDictionary setObject:section3 forKey:@"关于"];
    self.settingSectons = [[NSArray alloc] initWithObjects:@"帐号",@"反馈",@"关于",nil];
}

#pragma TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.settingSectons.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = [settingSectons objectAtIndex:section];
    NSArray *sets = [settingsDictionary objectForKey:key];
    return [sets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSString *key = [settingSectons objectAtIndex:section];
    NSArray *sets = [settingsDictionary objectForKey:key];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SETTING_TABLE_CELL_IDENTIFIER];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SETTING_TABLE_CELL_IDENTIFIER];
    }
    Setting *setting = [sets objectAtIndex:row];
    cell.textLabel.text = setting.title;
    cell.imageView.image = [UIImage imageNamed:setting.img];
    cell.tag = setting.tag;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.settingTableView deselectRowAtIndexPath:indexPath animated:YES];
    NSUInteger section = [indexPath section];
    NSString *key = [self.settingSectons objectAtIndex:section];
    NSArray *settings = [self.settingsDictionary objectForKey:key];
    Setting *setting = [settings objectAtIndex:[indexPath row]];
    
    switch (setting.tag) {
        case 1:
            //todo
            break;
        case 2:
            //todo
            break;
        case 3:
            //todo
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [self.settingTableView release];
    [self.settingsDictionary release];
    [self.settingSectons release];
    [super dealloc];
}
@end
