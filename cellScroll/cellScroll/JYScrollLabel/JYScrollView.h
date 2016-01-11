//
//  JYScrollView.h
//  轮播Demo
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYScrollView : UIView

/**
 *  设置轮播的时间间隔
 */
@property (nonatomic) NSTimeInterval interval;

/**
 *  开始滚动传过来的数据
 *
 *  @param datas 滚动的数据
 */
- (void)startScrollWithArray:(NSArray *)datas;

@end
