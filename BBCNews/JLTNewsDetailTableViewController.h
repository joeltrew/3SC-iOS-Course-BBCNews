//
//  JLTNewsDetailTableViewController.h
//  BBCNews
//
//  Created by Joel Trew on 10/03/2015.
//  Copyright (c) 2015 Joel Trew. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JLTNewsStory;

@interface JLTNewsDetailTableViewController : UITableViewController

- (instancetype)initWithStory:(JLTNewsStory *)story;

@end
