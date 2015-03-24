//
//  JLTNewsController.m
//  BBCNews
//
//  Created by Joel Trew on 24/03/2015.
//  Copyright (c) 2015 Joel Trew. All rights reserved.
//

#import "JLTNewsController.h"
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


- (void)getLatestNewsStories
{
    [self.requestController get:@"topStories.php" completion:^(TSCRequestResponse *response, NSError *error) {
        if (error) {
            NSLog(@"Something went wrong!!");
            return;
        }
        
        NSLog(@"response:%@", response.array);
    }];
}

@end
