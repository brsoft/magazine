//
//  ArticleDetailViewController.h
//  magazine
//
//  Created by Leslie.Li on 12/3/12.
//  Copyright (c) 2012 brsoft. All rights reserved.
//

#import "BaseViewController.h"
#import "ArticleDetail.h"

@interface ArticleDetailViewController : BaseViewController<UIWebViewDelegate>
@property (retain, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, retain) ArticleDetail *articleDetail;

@end
