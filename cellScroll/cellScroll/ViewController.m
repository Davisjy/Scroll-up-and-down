//
//  ViewController.m
//  cellScroll
//
//  Created by qingyun on 16/1/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "JYScrollView.h"

@interface ViewController ()<UITableViewDataSource>
{
    NSArray *_datas;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];

    tableView.dataSource = self;
    
    _datas = @[@"asdfasf", @"😊📣"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == 1) {
        JYScrollView *label = [[JYScrollView alloc] initWithFrame:CGRectMake(100, 100, 10, 10)];
        NSArray *data = @[@"jyasdf", @"lkasdg", @"lzzasdga", @"thfadgsd", @"zjxadsgsd", @"lccadsgasd"];
        [label startScrollWithArray:data];
        label.userInteractionEnabled = NO;
        label.interval = 1;
        cell.accessoryView = label;
    }
    
    cell.textLabel.text = _datas[indexPath.row];
    return cell;
}

@end
