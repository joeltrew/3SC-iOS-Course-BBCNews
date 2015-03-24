//
//  JLTNewsStory.m
//  BBCNews
//
//  Created by Joel Trew on 10/03/2015.
//  Copyright (c) 2015 Joel Trew. All rights reserved.
//

#import "JLTNewsStory.h"

@implementation JLTNewsStory

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.storyHeadline = dictionary[@"headline"];
        self.storyBody = dictionary[@"body"];
        self.storyImageURL = [NSURL URLWithString:dictionary[@"imageURL"]];
        
    
    
    }
    return self;
}

@end
