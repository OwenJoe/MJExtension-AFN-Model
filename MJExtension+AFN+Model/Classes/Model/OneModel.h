//
//  OneModel.h
//  MJExtension+AFN+Model
//
//  Created by imac on 2016/11/28.
//  Copyright © 2016年 imac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneModel : NSObject
@property (nonatomic, copy) NSString *city_id;//城市id
@property (nonatomic, copy) NSString *city_name;//城市名称
@property (nonatomic, copy) NSString *city_pinyin;//城市拼音
@property (nonatomic, copy) NSString *short_name;//城市名称简写
@property (nonatomic, copy) NSString *short_pinyin;//城市名称拼音简写
@property (nonatomic, copy) NSString *m_letter;//首字母
@end
