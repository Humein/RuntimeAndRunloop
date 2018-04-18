//
//  ViewController.m
//  RuntimeAndRunloop
//
//  Created by 鑫鑫 on 2018/4/18.
//  Copyright © 2018年 xinxin. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+ButtonBlockCategory.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *blockBtn = [UIButton ZTK_fatoryButtonWithFrame:CGRectMake(50, 60, 44, 44) WithTitle:@"你好" WithTitleColor:[UIColor redColor] Withfont:11 Withimage:nil WithselImage:nil toSuperView:self.view WithClick:^(id sender) {
//        NSLog(@"blockBtn====%@",NSStringFromClass([weakBlockBtn class]));
        
    }];
//    __weak typeof(blockBtn) weakBlockBtn = blockBtn;
//
//    blockBtn.blcok = ^(id sender) {
//        NSLog(@"blockBtn====%@",NSStringFromClass([weakBlockBtn class]));
//    };
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
