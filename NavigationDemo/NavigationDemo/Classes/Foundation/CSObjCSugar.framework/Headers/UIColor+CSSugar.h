//
//  UIColor+CSSugar.h
//  CSSugar
//
//  Created by Joslyn wu on 2016/12/26.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CSSugar)

#pragma mark - 颜色函数

/**
 使用十六进制数字生成颜色

 @param hex hex，格式 0xFFEEDD
 @return UIColor
 */
+ (nonnull instancetype)cs_colorWithHex:(u_int32_t)hex;

/**
 使用十六进制数字和透明度生成颜色

 @param hex hex 格式 0xFFEEDD
 @param alpha 透明度
 @return UIColor
 */
+ (nonnull instancetype)cs_colorWithHex:(u_int32_t)hex alpha:(CGFloat)alpha;

/// 使用指定的 r / g / b 数值（0 ≤ value ≤ 255）生成颜色
+ (nonnull instancetype)cs_colorWithRed:(u_int8_t)red green:(u_int8_t)green blue:(u_int8_t)blue;

/// 使用指定的 r / g / b / alpha 数值生成颜色
/// （r/g/b:0 ≤ value ≤ 255,alpha:0 ≤ value ≤ 1）
+ (nonnull instancetype)cs_colorWithRed:(u_int8_t)red green:(u_int8_t)green blue:(u_int8_t)blue alpha:(CGFloat)alpha;

/// 随机色
+ (nonnull instancetype)cs_randomColor;

#pragma mark - 颜色值
/// 返回当前颜色的 red 的 0～255 值
- (u_int8_t)cs_redValue;

/// 返回当前颜色的 green 的 0～255 值
- (u_int8_t)cs_greenValue;

/// 返回当前颜色的 blue 的 0～255 值
- (u_int8_t)cs_blueValue;

/// 返回当前颜色的 alpha 值
- (CGFloat)cs_alphaValue;

@end
