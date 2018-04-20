//
//  UIButton+ButtonBlockCategory.h
//  RuntimeAndRunloop
//
//  Created by 鑫鑫 on 2018/4/18.
//  Copyright © 2018年 xinxin. All rights reserved.
//
typedef void (^btnBlock)(id sender);
#import <UIKit/UIKit.h>

#warning 1-添加属性
@interface UIButton (ButtonBlockCategory)
@property (nonatomic, copy) btnBlock blcok;
+ (instancetype)ZTK_fatoryButtonWithFrame:(CGRect)frame
                               WithTitle:(NSString *)title
                          WithTitleColor:(UIColor *)titleHexColor
                                Withfont:(CGFloat)font
                               Withimage:(id)image
                            WithselImage:(id)selImage
                             toSuperView:(UIView *)superView
                               WithClick:(btnBlock)block;
@end
