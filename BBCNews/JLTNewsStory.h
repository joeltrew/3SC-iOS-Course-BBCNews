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

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, strong) NSString *storyHeadline;
@property (nonatomic, strong) NSString *storyBody;
@property (nonatomic, strong) UIImage *storyImage;
@property (nonatomic, strong) NSURL *storyImageURL;

@end
