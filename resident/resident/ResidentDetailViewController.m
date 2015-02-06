//
//  ResidentDetailViewController.m
//  resident
//
//  Created by Xin Qin on 2/6/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "ResidentDetailViewController.h"

@interface ResidentDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *originLabel;
@property (weak, nonatomic) IBOutlet UILabel *transplantLabel;
@property (weak, nonatomic) IBOutlet UIImageView *residentCover;


@end

@implementation ResidentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavbar];
    
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Init

- (void)setNavbar
{
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}

- (void)initView
{
    _originLabel.text = [self.residentDic valueForKeyPath:@"origin"];
    _transplantLabel.text = [self.residentDic valueForKeyPath:@"transplant"];
    _residentCover.image = [UIImage imageNamed:[self.residentDic valueForKeyPath:@"image"]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
