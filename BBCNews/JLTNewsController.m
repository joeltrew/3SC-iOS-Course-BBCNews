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

@end
