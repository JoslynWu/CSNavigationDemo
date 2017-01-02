//
//  NSString+CSSugar.h
//  CSSugar
//
//  Created by Joslyn wu on 2016/12/26.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#pragma mark  -  sandbox path
@interface NSString (CSSugar)

/// 拼接了`文档目录`的全路径
@property (nullable, nonatomic, readonly) NSString *cs_documentDirectory;

/// 拼接了`缓存目录`的全路径
@property (nullable, nonatomic, readonly) NSString *cs_cacheDirecotry;

/// 拼接了`临时目录`的全路径
@property (nullable, nonatomic, readonly) NSString *cs_tmpDirectory;

@end


#pragma mark  -  string base64
@interface NSString (CSBase64)

/// BASE 64 编码字符串内容
@property(nullable, nonatomic, readonly) NSString *cs_base64encode;

/// BASE 64 解码字符串内容
@property(nullable, nonatomic, readonly) NSString *cs_base64decode;

@end


#pragma mark  -  string size
@interface NSString (CSSize)

/// 计算文本Size
- (CGSize)cs_sizeWithUIFont:( UIFont * _Nonnull )font forWidth:(CGFloat)width;

/// 计算文本Size
- (CGSize)cs_sizeWithUIAttribute:(NSDictionary * _Nonnull )attribute forWidth:(CGFloat)width;

@end








