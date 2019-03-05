//
//  ViewController.h
//  FYLPageViewController
//
//  Created by FuYunLei on 2017/4/17.
//  Copyright © 2017年 FuYunLei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FYLSegmentView.h"


/*
 
 如要改变头部样式,可修改FYLSegmentView实现
 
 */

@protocol FYLPageViewControllerDelegate <NSObject>

- (void)scrollNextViewWithIndex:(NSInteger)index;
@end

@interface FYLPageViewController : UIViewController

/**
 初始化方法

 @param items 头部标签数据
 @param viewControllers 控制器数组
 @return PageVC
 */
@property(nonatomic,strong) NSArray *viewControllers;
@property (nonatomic, weak)id<FYLPageViewControllerDelegate> delegate;

- (instancetype)initWithViewControllers:(NSArray *)viewControllers;
- (instancetype)initWithItems:(NSArray *)items viewControllers:(NSArray *)viewControllers;

- (void)setViewControllers:(NSArray *)viewControllers;
- (void)setItems:(NSArray *)items viewControllers:(NSArray *)viewControllers;

- (void)setSelectedVCWithIndex:(NSInteger)index;
- (void)scrollToNextCompletion:(void(^)(NSInteger index))handler;
- (void)scrollToPreviousCompletion:(void(^)(NSInteger index))handler;

@end

