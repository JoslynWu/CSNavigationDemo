//
//  CSDefaultCtl.h
//  NavigationDemo
//
//  Created by Joslyn wu on 2016/12/28.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSDefaultCtl : UIViewController

@property (nonatomic, assign) NavigationBarType navBarType;

-(instancetype)initWithType:(NavigationBarType)navBarType;

@end
