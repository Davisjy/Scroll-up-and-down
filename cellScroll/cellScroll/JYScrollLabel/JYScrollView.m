//
//  JYScrollView.m
//  轮播Demo
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "JYScrollView.h"

@interface JYScrollView ()
{
    /** 背景的scrollView*/
    UIScrollView *_scrollView;
    
    /** 当前索引*/
    NSInteger _index;
    
    /** 定时器*/
    NSTimer *_timer;
    
    /** 数据*/
    NSArray *_datas;
}
@end

@implementation JYScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 200, 40)]) {
    }
    return self;
}

- (void)startScrollWithArray:(NSArray *)datas
{
    _datas = datas;
    
    // 设置内部效果
    [self setupScrollView];
}

#pragma mark - 基本内部UI设置
- (void)setupScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    _scrollView.contentSize = CGSizeMake(self.bounds.size.width, _datas.count * self.bounds.size.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.userInteractionEnabled = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:_scrollView];

    for (int i = 0; i < _datas.count; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = _datas[i];
        label.textColor = [UIColor blackColor];
        label.frame = CGRectMake(0, self.bounds.size.height * i, self.bounds.size.width, self.bounds.size.height);
        [_scrollView addSubview:label];
    }
}

#pragma mark - 设置每次轮播的时间间隔
- (void)setInterval:(NSTimeInterval)interval
{
    _interval = interval;
    if (_interval > 0) {
        [self addTimer];
    }
}

/**
 *  添加定时器
 */
- (void)addTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)timerAction
{
    _index++;
    [_scrollView setContentOffset:CGPointMake(0, self.bounds.size.height * _index) animated:YES];
    if (_index >= _datas.count - 1) {
        [_timer invalidate];
    }
}





@end
