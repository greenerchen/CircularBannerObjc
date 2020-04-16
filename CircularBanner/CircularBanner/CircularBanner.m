//
//  CircularBanner.m
//  CircularBanner
//
//  Created by Greener Chen on 2020/4/15.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

#import "CircularBanner.h"

@interface CircularBanner()
@property (nonatomic, weak) NSTimer *timer;
@end

@implementation CircularBanner

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = self.bounds;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
}

- (void)setModel:(CircularBannerModel *)model
{
    _model = model;
    [self reloadData];
    [self setAutoScrollingEnabled:model.autoScrollingEnabled withTimeInterval:model.scrollingTimeInterval];
}

- (void)setAutoScrollingEnabled:(BOOL)autoScrolledEnabled withTimeInterval:(NSTimeInterval)timeInterval
{
    _autoScrollingEnabled = autoScrolledEnabled;
    if (autoScrolledEnabled) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(scrollToNext) userInfo:nil repeats:YES];
    }
}

- (void)scrollToNext
{
    [self scrollToNext:YES animated:YES];
}

- (void)scrollToNext:(BOOL)isNext animated:(BOOL)animated
{
    dispatch_async(dispatch_get_main_queue(), ^{
        CGFloat offsetX = isNext ? self.bounds.size.width : -self.bounds.size.width;
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x + offsetX, self.scrollView.contentOffset.y) animated:animated];
        [self.scrollView.delegate scrollViewDidEndDecelerating:self.scrollView];
    });
}

- (void)reloadData
{
    [self reloadScrollView];
}

- (void)reloadScrollView
{
    if (![self.model.dataSource respondsToSelector:@selector(numberOfItemsInCircularBanner:)] &&
        ![self.model.dataSource respondsToSelector:@selector(circularBannerView:viewForItemAtIndex:)]) {
        return;
    }
  
    NSInteger numberOfItems = [self.model.dataSource numberOfItemsInCircularBanner:self];
    if (numberOfItems <= 0) {
        return;
    }
    
    if (numberOfItems == 1) {
        UIView *firstView = [self.model.dataSource circularBannerView:self viewForItemAtIndex:0];
        [self addIntoScrollViewWithView:firstView AtIndex:0];
        self.scrollView.scrollEnabled = NO;
        return;
    }
    // say there are 5 items. put the last item before the first item (index: 0) and put the first item after the last item (index: 6 numberOfItems+1)
    // | 4 | 0 | 1 | 2 | 3 | 4 | 0 |
    UIView *firstView = [self.model.dataSource circularBannerView:self viewForItemAtIndex:0];
    [self addIntoScrollViewWithView:firstView AtIndex:numberOfItems+1];
    UIView *lastView = [self.model.dataSource circularBannerView:self viewForItemAtIndex:numberOfItems-1];
    [self addIntoScrollViewWithView:lastView AtIndex:0];
    for (NSInteger i = 0; i < numberOfItems; i++) {
        UIView *view = [self.model.dataSource circularBannerView:self viewForItemAtIndex:i];
        [self addIntoScrollViewWithView:view AtIndex:i+1];
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * (numberOfItems + 2), self.scrollView.frame.size.height);
    // set offset to the first item
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, self.scrollView.contentOffset.y);
}

- (void)addIntoScrollViewWithView:(UIView *)view AtIndex:(NSInteger)index
{
    view.frame = CGRectMake(index * self.scrollView.frame.size.width, 0.0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    [self.scrollView addSubview:view];
}

// MARK: - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (![self.model.dataSource respondsToSelector:@selector(numberOfItemsInCircularBanner:)]) {
        return;
    }
    
    NSInteger numberOfItems = [self.model.dataSource numberOfItemsInCircularBanner:self];
    NSInteger currentPage = scrollView.contentOffset.x / self.frame.size.width;
    if (currentPage == 0) {
        scrollView.contentOffset = CGPointMake(numberOfItems * self.frame.size.width, scrollView.contentOffset.y);
    } else if (currentPage == numberOfItems + 1 ) {
        scrollView.contentOffset = CGPointMake(1 * self.frame.size.width, scrollView.contentOffset.y);
    }
}

@end



