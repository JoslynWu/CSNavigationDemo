//
//  CSNavigationView.m
//  NavigationDemo
//
//  Created by Joslyn wu on 2016/12/30.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import "CSNavigationView.h"
#import <Masonry.h>

#define kNav_h (64)

@implementation CSNavigationView

-(instancetype)init {
    
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen cs_screenWidth], kNav_h)]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        UIButton *backBtn = [UIButton cs_buttonWithImageName:@"back_home" highlightSuffix:@""];
        [self addSubview:backBtn];
        [backBtn addTarget:self action:@selector(leftItemDidClick:) forControlEvents:UIControlEventTouchUpInside];
        
        _titleLabel = [UILabel cs_labelWithText:@"蚂蚁森林" fontSize:17 textColor:kDefaultColor alignment:NSTextAlignmentCenter];
        [self addSubview:_titleLabel];
        
        UIButton *rightBtn = [UIButton cs_buttonWithImageName:@"nav_more" highlightSuffix:@""];
        [self addSubview:rightBtn];
        [rightBtn addTarget:self action:@selector(rightItemDidClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //separate
        CGFloat separate_h = 1 / [UIScreen mainScreen].scale;
        _separateView = [[UIView alloc] init];
        _separateView.backgroundColor = [UIColor clearColor];
        [self addSubview:_separateView];
        
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(9);
            make.bottom.mas_equalTo(-13);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.bottom.mas_equalTo(backBtn);
        }];
        
        [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.mas_equalTo(-9);
            make.bottom.mas_equalTo(backBtn);
        }];
        
        [_separateView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(separate_h);
            make.leading.trailing.bottom.mas_equalTo(self);
        }];
    }
    return self;
}

-(void)leftItemDidClick:(UIButton *)btn {
    
    if (self.leftItemBlock) {
        self.leftItemBlock();
    }
    
}

-(void)rightItemDidClick:(UIButton *)btn {
    NSLog(@"right item did click");
    if (self.rightItemBlock) {
        self.rightItemBlock();
    }
}


@end
