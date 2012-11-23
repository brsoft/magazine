//
//  LoadingCell.h
//  magazine
//
//  Created by Leslie.Li on 11/24/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *lblLoading;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityLoading;

@end
