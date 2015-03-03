//
//  JLTTopNewsTableViewController.m
//  BBCNews
//
//  Created by Joel Trew on 03/03/2015.
//  Copyright (c) 2015 Joel Trew. All rights reserved.
//

#import "JLTTopNewsTableViewController.h"
#import "JLTNewsStoryTableViewCell.h"


@interface JLTTopNewsTableViewController ()

@end

@implementation JLTTopNewsTableViewController



- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        [self.tableView registerClass:[JLTNewsStoryTableViewCell class] forCellReuseIdentifier:@"NewsStoryCellIdentifier"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsStoryCellIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    
    cell.textLabel.text = @"Hello World!";
    cell.detailTextLabel.text = @"Hello again!";
    return cell;
}


@end
