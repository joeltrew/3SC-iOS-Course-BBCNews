//
//  JLTTopNewsTableViewController.m
//  BBCNews
//
//  Created by Joel Trew on 03/03/2015.
//  Copyright (c) 2015 Joel Trew. All rights reserved.
//

#import "JLTTopNewsTableViewController.h"
#import "JLTNewsStoryTableViewCell.h"
#import "JLTNewsDetailTableViewController.h"
#import "JLTNewsStory.h"



@interface JLTTopNewsTableViewController ()

@property (nonatomic, strong) NSArray *stories;

@end

@implementation JLTTopNewsTableViewController;





- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.title = @"Joel's News";
        [self.tableView registerClass:[JLTNewsStoryTableViewCell class] forCellReuseIdentifier:@"NewsStoryCellIdentifier"];
        
        JLTNewsStory *storyFirstStory = [[JLTNewsStory alloc] init];
        storyFirstStory.storyHeadline = @"Apple Watch prices and apps revealed";
        storyFirstStory.storyBody = @"Apple's smartwatch collection will range in price from $349 to $17,000 (£299 to £13,500 in the UK) depending on the metals they are made from and the straps they are bought with.";
        storyFirstStory.storyImage = [UIImage imageNamed:@"NewsStoryImage"];
        
        JLTNewsStory *storySecondStory = [[JLTNewsStory alloc] init];
        storySecondStory.storyHeadline = @"Banning Tor unwise and infeasible, MPs told";
        storySecondStory.storyBody = @"A ban on online anonymity networks would be 'technologically infeasible' and unwise, MPs have been told.";
        storySecondStory.storyImage = [UIImage imageNamed:@"NewsStoryImage2"];
        
        self.stories = @[storyFirstStory, storySecondStory];
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
    
    return self.stories.count;
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
    
    JLTNewsStory *newsStory = self.stories[indexPath.row];
    cell.textLabel.text = newsStory.storyHeadline;
    cell.detailTextLabel.text = newsStory.storyBody;
    cell.imageView.image = newsStory.storyImage;
    
    
    cell.textLabel.numberOfLines = 3;
    cell.textLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    cell.detailTextLabel.numberOfLines = 4;
    cell.detailTextLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JLTNewsStory *story = self.stories[indexPath.row];
    JLTNewsDetailTableViewController *detailedView = [[JLTNewsDetailTableViewController alloc] initWithStory:story];
    
    [self.navigationController pushViewController:detailedView animated:true];
}

@end
