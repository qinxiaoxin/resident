//
//  XHLoadingNavigationItemTitleView.h
//  XHLoadingNavigationItemTitleView
//
//  Created by qtone-1 on 14-4-10.
//  Copyright (c) 2014年. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHLoadingNavigationItemTitleView : UIView

@property (nonatomic, strong) UIColor *titleColor; // default is [UIColor whiteColor]
@property (nonatomic, strong) UIFont *titleFont; // default is


@property (nonatomic, assign, readonly) BOOL animating; // default is NO

+ (XHLoadingNavigationItemTitleView *)initNavigationItemTitleView;

- (void)setIndicatorView:(UIView *)indicatorView;

- (void)setTitle:(NSString *)title;

- (void)startAnimating;
- (void)stopAnimating;

@end
