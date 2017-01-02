//
//  NSBundle+CSSugar.h
//  CSSugar
//
//  Created by Joslyn wu on 2016/12/26.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSBundle (CSSugar)

/// 当前版本号字符串
+ (nullable NSString *)cs_currentVersion;

/// 与当前屏幕尺寸匹配的启动图像
+ (nullable UIImage *)cs_launchImage;

@end
