//
//  ArticleListCell.h
//  magazine
//
//  Created by Leslie.Li on 11/23/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleListCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *imgView;
@property (nonatomic, strong) IBOutlet UILabel *lblTitle;
@property (nonatomic, strong) IBOutlet UILabel *lblDescription;
@property (nonatomic, strong) IBOutlet UILabel *lblDate;

@end
