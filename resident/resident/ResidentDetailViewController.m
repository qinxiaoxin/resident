//
//  ResidentDetailViewController.m
//  resident
//
//  Created by Xin Qin on 2/6/15.
//  Copyright (c) 2015 Xin Qin. All rights reserved.
//

#import "ResidentDetailViewController.h"
#import "UIScrollView+TwitterCover.h"

@interface ResidentDetailViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *briefLabel;
@property (nonatomic, strong) UILabel *historyLabel;
@property (nonatomic, strong) UILabel *storyLabel;

@end

@implementation ResidentDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setNavbarTranslucentWhiteAndStatusBarWhite];
}


#pragma mark - Init

- (void)initView
{
    //ScrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.backgroundColor = COLOR(50, 50, 50, 1);
    NSString *imageStr = [self.residentDic valueForKeyPath:@"image"];
    if (imageStr) {
        [_scrollView addTwitterCoverWithImage:[UIImage imageNamed:imageStr]];
    }
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    
    
    //Cover ImageView
    _coverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - COVER_IMAGE_VIEW_WIDTH / 2, _scrollView.top + 10, COVER_IMAGE_VIEW_WIDTH, COVER_IMAGE_VIEW_HEIGHT)];
    _coverImageView.image = [UIImage imageNamed:imageStr];
    _coverImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    _coverImageView.layer.shadowOffset = CGSizeMake(0, 0);
    _coverImageView.layer.shadowOpacity = 0.8f;
    _coverImageView.layer.shadowRadius = 20.f;
    [_scrollView addSubview:_coverImageView];
    
    
    
    //Label
    _briefLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _briefLabel.numberOfLines = 0;
    _briefLabel.font = [UIFont systemFontOfSize:16];
    _briefLabel.textColor = [UIColor whiteColor];
    NSString *briefText = [[self.residentDic valueForKeyPath:@"brief"] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    _briefLabel.text = briefText;
    NSDictionary *briefAttribute = @{NSFontAttributeName: [UIFont systemFontOfSize:16]};
    CGSize briefLableSize = [_briefLabel.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 40, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:briefAttribute context:nil].size;
    _briefLabel.frame = CGRectMake(20, _scrollView.twitterCoverView.bottom + 100, briefLableSize.width, briefLableSize.height);
    [_scrollView addSubview:_briefLabel];
    
    
    _historyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _historyLabel.numberOfLines = 0;
    _historyLabel.font = [UIFont systemFontOfSize:16];
    _historyLabel.textColor = [UIColor whiteColor];
    NSString *historyText = [[self.residentDic valueForKeyPath:@"history"] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    _historyLabel.text = historyText;
    NSDictionary *historyAttribute = @{NSFontAttributeName: [UIFont systemFontOfSize:16]};
    CGSize historyLabelSize = [_historyLabel.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 40, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:historyAttribute context:nil].size;
    _historyLabel.frame = CGRectMake(20, _briefLabel.bottom + 100, historyLabelSize.width, historyLabelSize.height);
    [_scrollView addSubview:_historyLabel];
    
    
    _storyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _storyLabel.numberOfLines = 0;
    _storyLabel.font = [UIFont systemFontOfSize:16];
    _storyLabel.textColor = [UIColor whiteColor];
    NSString *storyText = [[self.residentDic valueForKeyPath:@"story"] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    _storyLabel.text = storyText;
    NSDictionary *storyAttribute = @{NSFontAttributeName: [UIFont systemFontOfSize:16]};
    CGSize storyLabelSize = [_storyLabel.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 40, 0) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:storyAttribute context:nil].size;
    _storyLabel.frame = CGRectMake(20, _historyLabel.bottom + 100, storyLabelSize.width, storyLabelSize.height);
    [_scrollView addSubview:_storyLabel];
    
    
    //ScrollView ContentSize
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, _storyLabel.bottom + 100);
    
    
    //版本低于8.0 设置scrollview.contentOffset.y -64
    if (SYSTEM_VERSION < 8.f) {
        _scrollView.contentOffset = CGPointMake(0, -64);
    }
}


//设置新界面 navigationbar & statusbar
- (void)setNavbarTranslucentWhiteAndStatusBarWhite
{
    //navigationbar 控件颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //navigationbar 去掉返回Title
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    //navigationbar 添加按钮
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    UIBarButtonItem *strategyItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:nil];
    NSArray *actionButtonItems = @[shareItem, strategyItem];
    self.navigationItem.rightBarButtonItems = actionButtonItems;
    
    
    //navigationbar 置为透明
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefaultPrompt];
    
    
    //navigationbar 隐藏底部横线
//    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
//        
//        NSArray *array = self.navigationController.navigationBar.subviews;
//        
//        for (id obj in array) {
//            if ([obj isKindOfClass:[UIImageView class]]) {
//                UIImageView *imageView = (UIImageView *)obj;
//                imageView.hidden = YES;
//            }
//        }
//    }
    
    //statusbar 显示为白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

//还原成首页状态 navigationbar & statusbar
- (void)setNavbarAndStatusBarBlack
{
    
}



#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



#pragma mark - Dealloc

- (void)dealloc
{
    debugMethod();
    [_scrollView removeTwitterCoverView];
}

@end
