//
//  FLYModel.h
//  FYLPageViewController
//
//  Created by playable-iMac2 on 2018/5/14.
//  Copyright © 2018年 FuYunLei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLYModel : NSObject

@property (nonatomic , copy) NSString *title;
@property (nonatomic , copy) NSString *imageName;
@property (nonatomic , copy) NSString *selectedImageName;
@property (nonatomic , strong) UIColor *titleColor;
@property (nonatomic , strong) UIColor *selectedTitleColor;
@property (nonatomic , strong) UIColor *backgroundColor;
@property (nonatomic , strong) UIColor *selectedBackgroundColor;
@property (nonatomic , strong) UIColor *indexColor;
@property (nonatomic , assign) BOOL isShowIndex;
@property (nonatomic , strong) id objectInfo;

-(instancetype)initWithTitle:(NSString *)title iamgeName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName objectInfo:(id)info;

-(instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor selectedTitleColor:(UIColor *)selectedTitleColor backgroundColor:(UIColor *)backgroundColor selectedBackgroundColor:(UIColor *)selectedBackgroundColor isShowIndex:(BOOL)isShowIndex indexColor:(UIColor *)indexColor objectInfo:(id)info;

@end
