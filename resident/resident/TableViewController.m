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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setNavbarWhiteAndStatusBarWhite];
    
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

//设置新界面 navigationbar & statusbar
- (void)setNavbarWhiteAndStatusBarWhite
{
    //navigationbar 背景色
    self.navigationController.navigationBar.barTintColor = COLOR(55, 55, 55, 1);
    
    //navigationbar 标题颜色
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont systemFontOfSize:16.f], NSFontAttributeName, nil]];
    
    //navigationbar 置为不透明
    self.navigationController.navigationBar.translucent = NO;
    
    
    //navigationbar 还原底部横线
//    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//        
//        NSArray *array = self.navigationController.navigationBar.subviews;
//        
//        for (id obj in array) {
//            if ([obj isKindOfClass:[UIImageView class]]) {
//                UIImageView *imageView = (UIImageView *)obj;
//                imageView.hidden = NO;
//            }
//        }
//    }
    
    //statusbar 显示为白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.residentMainArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.backgroundColor = COLOR(50, 50, 50, 1);
    
    NSDictionary *dic = [self.residentMainArray objectAtIndex:indexPath.row];
    cell.cnLabel.text = [dic valueForKeyPath:@"cnname"];
    cell.jpLabel.text = [dic valueForKeyPath:@"jpname"];
    cell.enLabel.text = [dic valueForKeyPath:@"enname"];
    cell.yearLabel.text = [dic valueForKeyPath:@"year"];
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.backgroundColor = COLOR(50, 50, 50, 1);
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


#pragma mark - Navigation

- (void)prepareResidentDetailViewController:(ResidentDetailViewController *)rdvc toDisplay:(NSDictionary *)dic
{
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
