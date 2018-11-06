//
//  HQSortButton.h
//  HQSortButtonDemo
//
//  Created by Mr_Han on 2018/10/10.
//  Copyright © 2018年 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HQSortButton : UIButton

/** 按钮文本 */
@property (nonatomic, copy) NSString *title;
/** 是否是升序 */
@property (nonatomic, assign, readonly, getter=isAscending) BOOL ascending;

@end

NS_ASSUME_NONNULL_END
