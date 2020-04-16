//
//  CircularBanner.h
//  CircularBanner
//
//  Created by Greener Chen on 2020/4/15.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircularBannerModel.h"

@interface CircularBanner : UIView <UIScrollViewDelegate>

@property (nonatomic) CircularBannerModel *model;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic) BOOL autoScrollingEnabled;

- (void)reloadData;
- (void)setAutoScrollingEnabled:(BOOL)autoScrolledEnabled withTimeInterval:(NSTimeInterval)timeInterval;
- (void)scrollToNext:(BOOL)isNext animated:(BOOL)animated;

@end
