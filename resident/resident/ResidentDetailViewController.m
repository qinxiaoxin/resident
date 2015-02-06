//
//  ResidentDetailViewController.m
//  resident
//
//  Created by Xin Qin on 2/6/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "ResidentDetailViewController.h"
#import "UIScrollView+TwitterCover.h"

@interface ResidentDetailViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UILabel *briefLabel;
@property (nonatomic, strong) UILabel *historyLabel;
@property (nonatomic, strong) UILabel *storyLabel;


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

- (void)dealloc
{
    [_scrollView removeTwitterCoverView];
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
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    NSString *imageStr = [self.residentDic valueForKeyPath:@"image"];
    if (imageStr) {
        [_scrollView addTwitterCoverWithImage:[UIImage imageNamed:imageStr]];
    }
    [self.view addSubview:_scrollView];
    
    
    _briefLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _briefLabel.numberOfLines = 0;
    _briefLabel.font = [UIFont systemFontOfSize:16];
    NSString *briefText = [[self.residentDic valueForKeyPath:@"brief"] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    _briefLabel.text = briefText;
    NSDictionary *briefAttribute = @{NSFontAttributeName: [UIFont systemFontOfSize:16]};
    CGSize briefLableSize = [_briefLabel.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 40, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:briefAttribute context:nil].size;
    _briefLabel.frame = CGRectMake(20, SCREEN_WIDTH + 100, briefLableSize.width, briefLableSize.height);
    [_scrollView addSubview:_briefLabel];
    
    
    
    
    
    _historyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _historyLabel.numberOfLines = 0;
    _historyLabel.font = [UIFont systemFontOfSize:16];
    NSString *historyText = [[self.residentDic valueForKeyPath:@"history"] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    _historyLabel.text = historyText;
    NSDictionary *historyAttribute = @{NSFontAttributeName: [UIFont systemFontOfSize:16]};
    CGSize historyLabelSize = [_historyLabel.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 40, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:historyAttribute context:nil].size;
    _historyLabel.frame = CGRectMake(20, _briefLabel.bottom + 100, historyLabelSize.width, historyLabelSize.height);
    [_scrollView addSubview:_historyLabel];
    
    
    
    
    
    _storyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _storyLabel.numberOfLines = 0;
    _storyLabel.font = [UIFont systemFontOfSize:16];
    NSString *storyText = [[self.residentDic valueForKeyPath:@"story"] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    _storyLabel.text = storyText;
    NSDictionary *storyAttribute = @{NSFontAttributeName: [UIFont systemFontOfSize:16]};
    CGSize storyLabelSize = [_storyLabel.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 40, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:storyAttribute context:nil].size;
    _storyLabel.frame = CGRectMake(20, _historyLabel.bottom + 100, storyLabelSize.width, storyLabelSize.height);
    [_scrollView addSubview:_storyLabel];
    
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, _storyLabel.bottom + 100);
    
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
