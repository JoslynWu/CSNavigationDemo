//
//  CSDefaultCtl.m
//  NavigationDemo
//
//  Created by Joslyn wu on 2016/12/28.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import "CSDefaultCtl.h"

@interface CSDefaultCtl ()

@end

@implementation CSDefaultCtl

-(instancetype)initWithType:(NavigationBarType)navBarType {
    if (self = [super init]) {
        self.navBarType = navBarType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.navBarType == NavigationBarTypeSystemConfig) {
        
        self.navigationController.navigationBar.barTintColor = [UIColor cs_randomColor];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_home"] style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
       
        [self setGradientColor];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

/**
 渐变色
 */
-(void)setGradientColor {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = self.view.layer.bounds;
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
    layer.colors = [NSArray arrayWithObjects:(id)[UIColor cs_randomColor].CGColor, (id)[UIColor cs_randomColor].CGColor, (id)[UIColor cs_randomColor].CGColor, nil];
    [self.view.layer insertSublayer:layer atIndex:0];
}

#pragma mark  -  listen
-(void)back:(UIBarButtonItem *)barBtn {
    self.navigationController.navigationBar.barTintColor = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

@end
