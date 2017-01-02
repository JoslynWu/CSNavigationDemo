//
//  CSNavigationView.h
//  NavigationDemo
//
//  Created by Joslyn wu on 2016/12/30.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSNavigationView : UIView
/**
 导航左侧按钮回调
 */
@property (nonatomic, copy) void(^leftItemBlock)();

/**
 导航右侧按钮回调
 */
@property (nonatomic, copy) void(^rightItemBlock)();

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *separateView;


@end
