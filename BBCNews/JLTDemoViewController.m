//
//  JLTDemoViewController.m
//  BBCNews
//
//  Created by Joel Trew on 24/02/2015.
//  Copyright (c) 2015 Joel Trew. All rights reserved.
//

#import "JLTDemoViewController.h"

@interface JLTDemoViewController ()

@end

@implementation JLTDemoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.helloWorldLabel = [[UILabel alloc] init];
        self.helloWorldLabel.text = @"Hello World";
        self.helloWorldLabel.backgroundColor = [UIColor purpleColor];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.helloWorldLabel];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.helloWorldLabel.frame = CGRectMake(0, 0, 100, 44);
}

@end
