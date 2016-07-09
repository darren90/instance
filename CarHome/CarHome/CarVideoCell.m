//
//  CarVideoCell.m
//  CarHome
//
//  Created by Tengfei on 16/7/9.
//  Copyright © 2016年 tengfei. All rights reserved.
//

#import "CarVideoCell.h"

@implementation CarVideoCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    //1,创建cell
    static NSString *ID = @"cell";
    CarVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"CarVideoCell" owner:nil options:nil].firstObject;
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
