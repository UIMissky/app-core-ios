//
//  FLYModel.m
//  FYLPageViewController
//
//  Created by playable-iMac2 on 2018/5/14.
//  Copyright © 2018年 FuYunLei. All rights reserved.
//

#import "FLYModel.h"

@implementation FLYModel

-(instancetype)initWithTitle:(NSString *)title iamgeName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName objectInfo:(id)info{
    self = [super init];
    if (self) {
        _title = title;
        _imageName = imageName;
        _selectedImageName = selectedImageName;
        _objectInfo = info;
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor selectedTitleColor:(UIColor *)selectedTitleColor backgroundColor:(UIColor *)backgroundColor selectedBackgroundColor:(UIColor *)selectedBackgroundColor isShowIndex:(BOOL)isShowIndex indexColor:(UIColor *)indexColor objectInfo:(id)info{
    self = [super init];
    if (self) {
        _title = title;
        _titleColor = titleColor;
        _selectedTitleColor = selectedTitleColor;
        _backgroundColor = backgroundColor;
        _selectedBackgroundColor = selectedBackgroundColor;
        _isShowIndex = isShowIndex;
        _indexColor = indexColor;
    }
    return self;
}
@end
