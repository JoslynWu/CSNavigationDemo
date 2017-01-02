//
//  UITextField+CSSugar.h
//  CSSugar
//
//  Created by Joslyn wu on 2016/12/26.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (CSSugar)

/// 实例化 UITextField
///
/// @param placeHolder     占位文本
///
/// @return UITextField
+ (nonnull instancetype)cs_textFieldWithPlaceHolder:(nonnull NSString *)placeHolder;

@end
