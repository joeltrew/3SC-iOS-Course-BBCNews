//
//  JLTNewsStory.h
//  BBCNews
//
//  Created by Joel Trew on 10/03/2015.
//  Copyright (c) 2015 Joel Trew. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface JLTNewsStory : NSObject

@property (nonatomic, strong) NSString *storyHeadline;
@property (nonatomic, strong) NSString *storyBody;
@property (nonatomic, strong) UIImage *storyImage;

@end
