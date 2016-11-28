//
//  OneTableViewCell.m
//  MJExtension+AFN+Model
//
//  Created by imac on 2016/11/28.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "OneTableViewCell.h"

@implementation OneTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.labFirst = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 200, 40)];
    [self addSubview:self.labFirst];
    
    self.labSecond = [[UILabel alloc] initWithFrame:CGRectMake(105, 0, 200, 40)];
    [self addSubview:self.labSecond];
    
    return self;
}


#pragma mark -- 重新给模型对应属性赋值
-(void)setCellModel:(OneModel *)cellModel{

    _cellModel = cellModel;
    self.labFirst.text = _cellModel.city_name;
    self.labSecond.text = _cellModel.city_pinyin;
}

@end
