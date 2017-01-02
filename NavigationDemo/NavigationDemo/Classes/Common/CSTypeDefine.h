//
//  CSTypeDefine.h
//  NavigationDemo
//
//  Created by Joslyn wu on 2016/12/28.
//  Copyright © 2016年 joslyn. All rights reserved.
//


#define kDefaultColor ([UIColor cs_colorWithHex:0x0076FF])

typedef NS_ENUM(NSInteger, NavigationBarType) {
    NavigationBarTypeSystemDefault,             // 系统默认
    NavigationBarTypeSystemConfig,              // 系统的基础上，微调
    NavigationBarTypeCustomShade,               // 自定义 渐变
    NavigationBarTypeCustomShadeAndPull         // 自定义 渐变 拉伸
};
