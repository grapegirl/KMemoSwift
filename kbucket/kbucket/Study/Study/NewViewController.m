//
//  NewViewController.m
//  Study
//
//  Created by 김미혜 on 2018. 9. 19..
//  Copyright © 2018년 kikiplus. All rights reserved.
//

#import "NewViewController.h"
#import "HRModel.h"

@implementation NewViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)cofigureTableview{
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (HRModel *) modelHR{
    if (_modelHR == nil){
        _modelHR= [[HRModel alloc] init];
    }
    return _modelHR;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[self modelHR] arrayList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"row : " );
//  UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    //NSDictionary *dic = [[[self modelHR] arrayList]objectAtIndex:[indexPath row]];
    NSDictionary *dic = _modelHR.arrayList[indexPath.row];
    
    [[cell textLabel]  setText:[dic objectForKey:@"name"]];
    cell.detailTextLabel.text = dic[@"job"];
    //[[cell detailTextLabel] setText:[dic objectForKey:@"job"]];
    
    return cell;
}


@end
