//
//  NSString+Substring.h
//  CSSugar
//
//  Created by Joslyn wu on 2016/12/26.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Substring)
/**
 获得特定字符串的中字符串
 
 @param left 左边匹配字符串
 
 @param right 右边匹配的字符串
 
 @return NSString类型
 */
- (NSString*)cs_substringWithLeft:(NSString*)left right:(NSString*)right;

@end
