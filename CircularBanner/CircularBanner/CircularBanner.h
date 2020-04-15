//
//  CircularBanner.h
//  CircularBanner
//
//  Created by Greener Chen on 2020/4/15.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CircularBanner;

@protocol CircularBannerDataSource <NSObject>
@required
/// The number of cells of the banner
- (NSInteger)numberOfItemsInCircularBanner:(CircularBanner *)circularBanner;

/// The cell view of the banner
- (UIView *)circularBannerView: (CircularBanner *)circularBanner viewForItemAtIndex:(NSInteger)index;

@end

@interface CircularBanner : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, weak) id<CircularBannerDataSource> dataSource;

@property (nonatomic) BOOL autoScrolledEnabled;

- (void)reloadData;

@end



