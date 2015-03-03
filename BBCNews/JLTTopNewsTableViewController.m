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
    self = [super initWithStyle:UITableViewStyleGrouped];
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }else{
        return 2;
    }
    // Return the number of rows in the section.
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return @"Today";
    } else if (section == 1){
        return @"Yesterday";
    }
    return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsStoryCellIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Man dies after golf lake accident";
            cell.detailTextLabel.text = @"A 20-year-old man has died after a vehicle rolled into a lake at the Celtic Manor Resort golf course in Newport, police say.";
            cell.imageView.image = [UIImage imageNamed:@"NewsStoryImage"];
            cell.textLabel.numberOfLines = 0;
            cell.detailTextLabel.numberOfLines = 0;
            
        }
    } else if (indexPath.section == 1){
        if(indexPath.row == 0){
            cell.textLabel.text = @"News Story 2";
            cell.detailTextLabel.text = @"News Story 2 subtitle";
            cell.detailTextLabel.numberOfLines = 0;
        }
        
        
        else if(indexPath.row == 1){
            cell.textLabel.text = @"News Story 3";
            cell.detailTextLabel.text = @"News Story 3 subtitle";
        }
    }
    
    else {
        cell.textLabel.text = nil;
        cell.detailTextLabel.text =  nil;
        cell.imageView.image = nil;
    }
    //    cell.textLabel.text = @"Hello World!";
    //    cell.detailTextLabel.text = @"Hello again!";
    //    cell.imageView.image = [UIImage imageNamed:@"NewsStoryImage"];
    return cell;
    
}

@end
