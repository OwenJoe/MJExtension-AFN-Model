//
//  OneTableViewCell.h
//  MJExtension+AFN+Model
//
//  Created by imac on 2016/11/28.
//  Copyright © 2016年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneModel.h"

@interface OneTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *labFirst;
@property (nonatomic,strong) UILabel *labSecond;


/**
 将模型写在Cell的.h文件,那么在Controller中,就可以直接Cell.模型进行赋值,切记
 */
@property (nonatomic,strong) OneModel *cellModel;
@end
