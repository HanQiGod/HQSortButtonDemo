//
//  HQSortButton.m
//  HQSortButtonDemo
//
//  Created by Mr_Han on 2018/10/10.
//  Copyright © 2018年 Mr_Han. All rights reserved.
//

#import "HQSortButton.h"
#import <Masonry.h>

@interface HQSortButton ()

/** 文本label */
@property (nonatomic, strong) UILabel *cq_titleLabel;
/** 箭头imageView */
@property (nonatomic, strong) UIImageView *cq_arrowImageView;

@end

@implementation HQSortButton

#pragma mark - 构造方法

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UI搭建

- (void)setupUI {
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1;
    
    // 文本和图片的父view
    UIView *contentView = [[UIView alloc] init];
    [self addSubview:contentView];
    contentView.userInteractionEnabled = NO;
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.centerX.mas_equalTo(self);
        make.left.mas_greaterThanOrEqualTo(self).mas_offset(3);
        make.right.mas_lessThanOrEqualTo(self).mas_offset(-3);
    }];
    
    // 文本
    self.cq_titleLabel = [[UILabel alloc] init];
    [contentView addSubview:self.cq_titleLabel];
    self.cq_titleLabel.font = [UIFont boldSystemFontOfSize:13];
    self.cq_titleLabel.adjustsFontSizeToFitWidth = YES;
    [self.cq_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.mas_offset(0);
    }];
    
    // 图片
    self.cq_arrowImageView = [[UIImageView alloc] init];
    [contentView addSubview:self.cq_arrowImageView];
    self.cq_arrowImageView.image = [UIImage imageNamed:@"up_down"];
    [self.cq_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.mas_equalTo(contentView);
        make.left.mas_equalTo(self.cq_titleLabel.mas_right);
        make.right.mas_equalTo(contentView);
    }];
}

#pragma mark - 赋值选中状态

- (void)setSelected:(BOOL)selected {
    //// 注意：
    //// selected 表示你要赋值的状态
    //// super.selected 表示当前处于的状态
    
    if (selected) { // 即将设置成选中状态
        if (super.selected) { // 如果原本就处于选中状态
            // 那么就切换筛选状态
            _ascending = !_ascending;
            if (_ascending) {
                // 升序
                self.cq_arrowImageView.image = [UIImage imageNamed:@"red_arrow_up"];
            } else {
                // 降序
                self.cq_arrowImageView.image = [UIImage imageNamed:@"red_arrow_down"];
            }
        } else { // 如果之前不是选中状态
            // 那么设置成选中的默认排序状态：升序
            _ascending = YES;
            self.cq_arrowImageView.image = [UIImage imageNamed:@"red_arrow_up"];
        }
    } else { // 即将设置成非选中状态
        // 设置成非选中状态的图片
        self.cq_arrowImageView.image = [UIImage imageNamed:@"up_down"];
    }
    
    // 最后再赋值
    [super setSelected:selected];
}

#pragma mark - 赋值文本

- (void)setTitle:(NSString *)title {
    _title = title;
    self.cq_titleLabel.text = title;
}


@end
