//
//  ResidentCoverViewController.m
//  resident
//
//  Created by Xin Qin on 2/7/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "ResidentCoverViewController.h"

@interface ResidentCoverViewController ()

@property (nonatomic, strong) UIImageView *coverImageView;

@end

@implementation ResidentCoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _coverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_WIDTH * COVER_IMAGE_VIEW_HEIGHT / COVER_IMAGE_VIEW_WIDTH)];
    _coverImageView.userInteractionEnabled = YES;
    _coverImageView.image = self.coverImage;
    [_coverImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissViewControllerAnimated:)]];
    [self.view addSubview:_coverImageView];
}

- (void)dismissViewControllerAnimated:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
