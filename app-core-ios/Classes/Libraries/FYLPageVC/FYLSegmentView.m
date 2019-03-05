//
//  FYLSegmentView.m
//  FYLPageViewController
//
//  Created by FuYunLei on 2017/4/17.
//  Copyright © 2017年 FuYunLei. All rights reserved.
//

#import "FYLSegmentView.h"

@interface FYLSegmentView()

@property (nonatomic,strong)NSArray<FLYModel *> *items;
@property (nonatomic,strong)CALayer *maskLayer;

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,assign)CGFloat itemWidth;
@end

@implementation FYLSegmentView

- (FYLSegmentView *)initWithItems:(NSArray<FLYModel *> *)items{
    
    if (self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)]) {
        self.items = items;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.backgroundColor = RGB(66, 130, 200);
    
    //scrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView];
    
    //top
    UIView *viewTop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    viewTop.backgroundColor = FYLColorFromHexadecimalRGB(0xf7f7f7);
  
    if (self.items.count > 5) {
        _itemWidth = SCREEN_WIDTH / 4;
    }else if (self.items.count > 0){
       _itemWidth = SCREEN_WIDTH/self.items.count;
    }else{
        _itemWidth = SCREEN_WIDTH;
    }
    
    for (int i = 0; i < _items.count; i++) {
        FLYModel *item = _items[i];
        
        UIButton *btnBottom = [[UIButton alloc] initWithFrame:CGRectMake(_itemWidth * i, 0, _itemWidth, 44)];
        [btnBottom setTitle:item.title forState:UIControlStateNormal];
        btnBottom.titleLabel.textAlignment = NSTextAlignmentCenter;
        btnBottom.titleLabel.font = [UIFont systemFontOfSize:13];
        
        //未选中
        [btnBottom setTitleColor:item.titleColor ? : FYLColorFromHexadecimalRGB(0x000000) forState:UIControlStateNormal];
        [btnBottom setBackgroundColor:item.backgroundColor ? : [UIColor whiteColor]];
        [btnBottom setImage:[UIImage imageNamed:item.imageName] forState:UIControlStateNormal];
        [self.scrollView addSubview:btnBottom];
        
        UIButton *btnTop = [[UIButton alloc] initWithFrame:CGRectMake(_itemWidth * i, 0, _itemWidth, 44)];
        [btnTop setTitle:item.title forState:UIControlStateNormal];
        btnTop.titleLabel.textAlignment = NSTextAlignmentCenter;
        btnTop.titleLabel.font = [UIFont systemFontOfSize:13];
        
        //选中
        [btnTop setTitleColor:item.selectedTitleColor ? : [UIColor whiteColor] forState:UIControlStateNormal];
        [btnTop setBackgroundColor:item.selectedBackgroundColor ? : [UIColor colorWithRed:113.0/255.0 green:228.0/255.0 blue:224.0/255.0 alpha:1]];
        [btnTop setImage:[UIImage imageNamed:item.selectedImageName] forState:UIControlStateNormal];
        btnTop.tag = i;
        btnTop.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapLeft = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeView:)];
        [btnTop addGestureRecognizer:tapLeft];
        [viewTop addSubview:btnTop];
        
        //指示下标
        UIView *_viewIndex = [[UIView alloc] initWithFrame:CGRectMake(_itemWidth / 2.0 - item.title.length *12 *0.5, 40, item.title.length *12, 1.5)];
        _viewIndex.backgroundColor = item.indexColor ? : FYLColorFromHexadecimalRGB(0x93C4F6);
        if (item.isShowIndex) {
            [btnTop addSubview:_viewIndex];
        }
    }
    
    [self.scrollView addSubview:viewTop];
  
    self.scrollView.contentSize = CGSizeMake(self.items.count * _itemWidth, 44);
    viewTop.frame = CGRectMake(0, 0, self.items.count * _itemWidth, 44);

    
    //不好用的指示下标--垃圾
//    UIView *_viewIndex = [[UIView alloc] initWithFrame:CGRectMake(0, 42, self.items.count * _itemWidth, 2)];
//
//    [viewTop addSubview:_viewIndex];

    //mask
    _maskLayer = [[CALayer alloc] init];
    _maskLayer.frame = CGRectMake(0, 0, _itemWidth, 44);
    _maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    viewTop.layer.mask = _maskLayer;
}

///标签点击事件
- (void)changeView:(UITapGestureRecognizer *)tap{
    
    if ([self.delegate respondsToSelector:@selector(FYLSegmentView:didClickTagAtIndex:)]) {
        [self.delegate FYLSegmentView:self didClickTagAtIndex:tap.view.tag];
    }
}

- (void)setOffsetOfIndexView:(CGFloat)offsetX withCurrentIndex:(NSInteger)index{
    [self setFrameOfIndexView:CGRectMake(index * _itemWidth, 0, _itemWidth, 44)];
}

#pragma mark - 内部方法
- (void)setFrameOfIndexView:(CGRect)frame{
    _maskLayer.frame = frame;
    [self setScrollViewOffset:frame];
}

///处理边界问题
- (void)setScrollViewOffset:(CGRect)frame{
    
    CGPoint pointOffset = self.scrollView.contentOffset;
    
    CGFloat rightMax = frame.origin.x + frame.size.width;
    CGFloat leftMin = frame.origin.x;
    if (rightMax >= pointOffset.x + SCREEN_WIDTH || rightMax >= self.items.count * _itemWidth) {
        pointOffset.x = rightMax - SCREEN_WIDTH;
        self.scrollView.contentOffset = pointOffset;
    }
    
    if (leftMin <= pointOffset.x || leftMin <= 0) {
        pointOffset.x = leftMin;
        self.scrollView.contentOffset = pointOffset;
    }
}

@end
