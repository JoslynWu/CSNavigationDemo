//
//  UIScreen+CSSugar.h
//  CSSugar
//
//  Created by Joslyn wu on 2016/12/26.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (CSSugar)

/// 屏幕宽度
+ (CGFloat)cs_screenWidth;
/// 屏幕高度
+ (CGFloat)cs_screenHeight;
/// 分辨率
+ (CGFloat)cs_scale;

@end
