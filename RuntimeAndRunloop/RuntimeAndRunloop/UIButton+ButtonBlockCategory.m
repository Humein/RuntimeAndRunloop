//
//  UIButton+ButtonBlockCategory.m
//  RuntimeAndRunloop
//
//  Created by 鑫鑫 on 2018/4/18.
//  Copyright © 2018年 xinxin. All rights reserved.
//
#import <objc/runtime.h>
#import "UIButton+ButtonBlockCategory.h"
static const char associatedButtonkey;
@implementation UIButton (ButtonBlockCategory)
+ (instancetype)ZTK_fatoryButtonWithFrame:(CGRect)frame
                               WithTitle:(NSString *)title
                          WithTitleColor:(UIColor *)titleHexColor
                                Withfont:(CGFloat)font
                               Withimage:(id)image
                            WithselImage:(id)selImage
                             toSuperView:(UIView *)superView
                               WithClick:(btnBlock)block{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [superView addSubview:btn];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    [btn setTitleColor:titleHexColor forState:UIControlStateNormal];
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    
    UIImage *normalImage = nil;
    if ([image isKindOfClass:[NSString class]]) {
        normalImage = [UIImage imageNamed:image];
    } else if ([image isKindOfClass:[UIImage class]]) {
        normalImage = image;
    }
    
    UIImage *selectedImage = nil;
    if ([selImage isKindOfClass:[NSString class]]) {
        selectedImage = [UIImage imageNamed:image];
    } else if ([selImage isKindOfClass:[UIImage class]]) {
        selectedImage = selImage;
    }
    
    if (normalImage) {
        [btn setImage:normalImage forState:UIControlStateNormal];
    }
    
    if (selectedImage) {
        [btn setImage:selectedImage forState:UIControlStateSelected];
    }
    
    
    if (block)
    {
        //这里调用setter
        btn.blcok = block;
    }
    
    return btn;
}

- (void)btnAction:(id)sender{
    // 这里调用getter
    self.blcok(sender);
}

// setter
- (void)setBlcok:(btnBlock)blcok{
    // 给UIButton 关联一个block
    objc_setAssociatedObject(self, &associatedButtonkey, blcok, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self removeTarget:self
                action:@selector(btnAction:)
      forControlEvents:UIControlEventTouchUpInside];
    
    if (blcok) {
        [self addTarget:self
                 action:@selector(btnAction:)
       forControlEvents:UIControlEventTouchUpInside];
    }
}
//getter
- (btnBlock)blcok{
    // 之前说过的给起个名字，通过那个名字获取添加的 block
    return objc_getAssociatedObject(self, &associatedButtonkey);
}

@end
