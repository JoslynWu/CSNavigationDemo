//
//  UIImage+CSSugar.h
//  CSSugar
//
//  Created by Joslyn wu on 2016/12/26.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CSSugar)

/**
 生成指定颜色的一个`点`的图像

 @param color 颜色
 @return 1 * 1 的图像
 */
+ (nonnull UIImage *)cs_singleDotImageWithColor:(nonnull UIColor *)color;

/**
 异步绘制圆形图像。
 
 @param size        区域大小
 @param color       切掉圆角处的颜色
 @param completion  图像处理完毕后的回调
 */
- (void)cs_cornerImageWithSize:(CGSize)size fillColor:(nonnull UIColor *)color completion:(void( ^ _Nullable )(UIImage * _Nonnull image))completion;



@end
