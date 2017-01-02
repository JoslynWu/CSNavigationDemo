//
//  UINavigationController+CSSugar.h
//  CSSugar
//
//  Created by Joslyn wu on 2016/12/26.
//  Copyright © 2016年 joslyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (CSSugar)

/// 自定义全屏拖拽返回手势
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *cs_popGestureRecognizer;

@end
