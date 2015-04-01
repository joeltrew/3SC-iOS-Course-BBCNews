//
//  JLTNewsController.h
//  BBCNews
//
//  Created by Joel Trew on 24/03/2015.
//  Copyright (c) 2015 Joel Trew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLTNewsController : NSObject

typedef void (^JLTNewsStoriesCompletion)(NSError *error, NSArray *stories);

+ (JLTNewsController *)sharedController;
- (void)getLatestNewsStoriesWithCompletion:(JLTNewsStoriesCompletion) completion;

@end
