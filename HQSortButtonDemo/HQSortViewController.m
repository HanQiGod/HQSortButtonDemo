//
//  HQSortViewController.m
//  HQSortButtonDemo
//
//  Created by Mr_Han on 2018/10/10.
//  Copyright © 2018年 Mr_Han. All rights reserved.
//

#import "HQSortViewController.h"
#import "HQSortButton.h"
#import <Masonry.h>

NSInteger const CQSortButtonBeginTag = 1000;

@interface HQSortViewController ()

@end

@implementation HQSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *titleArray = @[@"同比", @"销售额", @"🙃", @"文字有点多啊"];
    
    NSMutableArray *buttonArray = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        HQSortButton *button = [[HQSortButton alloc] init];
        [self.view addSubview:button];
        button.title = titleArray[i];
        button.tag = CQSortButtonBeginTag + i;
        [button addTarget:self action:@selector(sortButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [buttonArray addObject:button];
    }
    
    // 按钮等宽依次排列
    [buttonArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [buttonArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
}

- (void)sortButtonClicked:(HQSortButton *)sender {
    for (int i = 0; i < 4; i++) {
        HQSortButton *button = [self.view viewWithTag:(CQSortButtonBeginTag + i)];
        button.selected = (button.tag == sender.tag);
    }
    NSLog(@"第%ld个按钮点击，状态：%@", (long)(sender.tag-CQSortButtonBeginTag), sender.isAscending ? @"升序" : @"降序");
}

@end
