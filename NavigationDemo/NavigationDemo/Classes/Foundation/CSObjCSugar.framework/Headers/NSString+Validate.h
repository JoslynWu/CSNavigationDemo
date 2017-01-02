//
//  NSString+Validate.h
//  CSSugar
//
//  Created by Joslyn wu on 2016/12/28.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 字符类型枚举
 */
typedef NS_ENUM(NSUInteger, CSCharacterType) {
    CSCharacterTypeOther,           //其他字符
    CSCharacterTypeChinese,         //中文字符
    CSCharacterTypeSymbol           //符号字符
};

#pragma mark  -  string validate
@interface NSString (Validate)

/// 邮箱
- (BOOL)cs_isEmail;

/// 邮箱掩盖
- (nullable NSString *)cs_coverUpEmail;

/// 手机号码
- (BOOL)cs_isMobile;

/// 身份证号
- (BOOL)cs_isIdentityCard;

/// 车牌号
- (BOOL)cs_isCarNumber;

/// 验证用户名
- (BOOL)cs_validateUserName;

/// 验证密码
- (BOOL)cs_validatePassword;

@end


#pragma mark  -  string Char type
@interface NSString (CSCharType)

/// 获得字符下标的字符类型
- (CSCharacterType)cs_characterTypeAtIndex:(NSUInteger)index;

/// 通过正则表达式验证字符串格式
- (BOOL)cs_isPassWithRegex:(nonnull NSString *)regex;

/// 是否为数字
- (BOOL)cs_isNumberString;

/// 是否是字母字符串
- (BOOL)cs_isLetterString;

/// 是否是中文字符串
- (BOOL)cs_isChineseString;

@end
