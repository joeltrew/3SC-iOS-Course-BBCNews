//
//  JLTNewsController.m
//  BBCNews
//
//  Created by Joel Trew on 24/03/2015.
//  Copyright (c) 2015 Joel Trew. All rights reserved.
//

#import "JLTNewsController.h"
#import "JLTNewsStory.h"
@import ThunderRequest;

static JLTNewsController *sharedController = nil;


@interface JLTNewsController ()

@property (nonatomic, strong) TSCRequestController *requestController;

@end

@implementation JLTNewsController

+ (JLTNewsController *)sharedController
{
    @synchronized(self) {
        if (sharedController == nil ){
            sharedController = [self new];
        }
    }
    
    return sharedController;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.requestController = [[TSCRequestController alloc]initWithBaseAddress:@"https://mattcheetham.co.uk/bbc"];
    }
    return self;
}


- (void)getLatestNewsStoriesWithCompletion:(JLTNewsStoriesCompletion) completion
{
    [self.requestController get:@"topStories.php" completion:^(TSCRequestResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Something went wrong!!");
            completion(error, nil);
            return;
        }
        
        NSMutableArray *stories = [NSMutableArray array];
        
        for (NSDictionary *dictionary in response.array){
            JLTNewsStory *newsStory = [[JLTNewsStory alloc]initWithDictionary:dictionary];
            
            [stories addObject:newsStory];
        }
        
        completion(nil, stories);
    }];
}

@end
