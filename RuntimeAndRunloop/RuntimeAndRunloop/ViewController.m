//
//  ViewController.m
//  RuntimeAndRunloop
//
//  Created by 鑫鑫 on 2018/4/18.
//  Copyright © 2018年 xinxin. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+ButtonBlockCategory.h"
#import "UIView+ViewHitEdgeInsetsSwizze.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *blockBtn = [UIButton ZTK_fatoryButtonWithFrame:CGRectMake(50, 60, 44, 44) WithTitle:@"你好" WithTitleColor:[UIColor redColor] Withfont:11 Withimage:nil WithselImage:nil toSuperView:self.view WithClick:^(id sender) {
//        NSLog(@"blockBtn====%@",NSStringFromClass([weakBlockBtn class]));
        
    }];
    blockBtn.hitTestEdgeInsets = UIEdgeInsetsMake(100, 100, 100, 100);
    __weak typeof(blockBtn) weakBlockBtn = blockBtn;
    __weak typeof(self) weakSelf = self;
    blockBtn.blcok = ^(id sender) {
        NSLog(@"blockBtn====%@",NSStringFromClass([weakBlockBtn class]));
        [weakSelf queryPropertyList];
    };
    

}
#warning 3-获取属性列表
//获取 UITableView 的属性列表
-(void)queryPropertyList{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([UITableView class], &count);
    NSMutableArray * mutableList_property = [NSMutableArray arrayWithCapacity:count];
    for (unsigned int  i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        [mutableList_property addObject:[NSString stringWithUTF8String:propertyName]];
    }
    free(propertyList);
    NSArray * propertylist = [NSArray arrayWithArray:mutableList_property];
    NSLog(@"\n获取UITableView的属性列表:%@",propertylist);


}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
