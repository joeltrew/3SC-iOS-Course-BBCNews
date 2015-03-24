//
//  JLTNewsDetailTableViewController.m
//  BBCNews
//
//  Created by Joel Trew on 10/03/2015.
//  Copyright (c) 2015 Joel Trew. All rights reserved.
//

#import "JLTNewsDetailTableViewController.h"
#import "JLTNewsStory.h"
#import "JLTNewsStoryImageCell.h"


@interface JLTNewsDetailTableViewController ()

@property (nonatomic, strong) JLTNewsStory *story;

@end

@implementation JLTNewsDetailTableViewController

- (instancetype)initWithStory:(JLTNewsStory *)story
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.story = story;
        NSLog(@"Story:%@", self.story.storyHeadline);
        [self.tableView registerClass:[JLTNewsStoryImageCell class] forCellReuseIdentifier:@"ImageCellID"];
        
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellID"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    
    // Configure the cell...
    if (indexPath.row == 0) {
        JLTNewsStoryImageCell *imageCell = [tableView dequeueReusableCellWithIdentifier:@"ImageCellID" forIndexPath:indexPath];
        
        imageCell.imageView.image = self.story.storyImage;
        
        return imageCell;
    } else if(indexPath.row == 1) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
        cell.textLabel.text = self.story.storyBody;
        
        cell.textLabel.numberOfLines = 0;
        
        return cell;
        
    }
    
UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 150;
    } else if (indexPath.row == 1){
        CGSize constrainedSize = CGSizeMake([UIScreen mainScreen].bounds.size.width -32, MAXFLOAT);
        CGRect bodyRect = [self.story.storyBody boundingRectWithSize:constrainedSize
                           
                            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                            attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18] }
                            context:nil];
        
        return bodyRect.size.height + 24;
    }
    return 45;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
