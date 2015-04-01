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
#import "JLTNewsController.h"



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
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[JLTNewsController sharedController] getLatestNewsStoriesWithCompletion:^(NSError *error, NSArray *stories) {

    
    if (error) {
        NSLog(@"Sorry, couldnt load news stories");
        return;
    }
    
    self.stories = stories;
    [self.tableView reloadData];

    }];
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
    cell.imageView.image = [UIImage  imageWithData:[NSData dataWithContentsOfURL:newsStory.storyImageURL]];
    
    
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
