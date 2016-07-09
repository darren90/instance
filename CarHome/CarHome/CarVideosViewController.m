//
//  CarVideosViewController.m
//  CarHome
//
//  Created by Tengfei on 16/7/9.
//  Copyright © 2016年 tengfei. All rights reserved.
//

#import "CarVideosViewController.h"
#import "CarVideoCell.h"

@interface CarVideosViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation CarVideosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CarVideoCell *cell = [CarVideoCell cellWithTableView:tableView];
    
    return cell;
}



-(NSMutableArray *)dataArray
{
    if(!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
