//
//  TableViewController.m
//  resident
//
//  Created by Xin Qin on 2/6/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "TableViewController.h"
#import "ResidentMainArrayService.h"
#import "ResidentDetailViewController.h"
#import "TableViewCell.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray *residentMainArray;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self initData];
    
//    [self setNavbar];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Init

- (void)initData
{
    self.residentMainArray = [ResidentMainArrayService fetchResidentMainArray];
}

//- (void)setNavbar
//{
//    self.navigationController.hidesBarsOnSwipe = YES;
//}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.residentMainArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
//    if (cell == nil) {
//        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                       reuseIdentifier: CellIdentifier];
//    }else{
//        for (UIView *subView in cell.contentView.subviews)
//        {
//            [subView removeFromSuperview];
//        }
//    }
    
    NSDictionary *dic = [self.residentMainArray objectAtIndex:indexPath.row];
    cell.cnLabel.text = [dic valueForKeyPath:@"cnname"];
    cell.jpLabel.text = [dic valueForKeyPath:@"jpname"];
    cell.enLabel.text = [dic valueForKeyPath:@"enname"];
    cell.yearLabel.text = [dic valueForKeyPath:@"year"];
    
    return cell;
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


#pragma mark - Navigation

- (void)prepareResidentDetailViewController:(ResidentDetailViewController *)rdvc toDisplay:(NSDictionary *)dic
{
    rdvc.title = [dic valueForKeyPath:@"cnname"];
    rdvc.residentDic = dic;
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"List_Detail"]) {
                if ([segue.destinationViewController isKindOfClass:[ResidentDetailViewController class]]) {
                    [self prepareResidentDetailViewController:segue.destinationViewController toDisplay:self.residentMainArray[indexPath.row]];
                }
            }
        }
    }
}


@end
