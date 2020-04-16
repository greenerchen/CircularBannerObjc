//
//  CircularBannerModel.h
//  CircularBanner
//
//  Created by Greener Chen on 2020/4/16.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CircularBanner;

@protocol CircularBannerDataSource <NSObject>
@required
/// The number of cells of the banner
- (NSInteger)numberOfItemsInCircularBanner:(CircularBanner *)circularBanner;

/// The cell view of the banner
- (UIView *)circularBannerView: (CircularBanner *)circularBanner viewForItemAtIndex:(NSInteger)index;

@end


@interface CircularBannerModel : NSObject <CircularBannerDataSource>

@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, weak) id<CircularBannerDataSource> dataSource;
@property (nonatomic) BOOL autoScrollingEnabled;
@property (nonatomic) NSTimeInterval scrollingTimeInterval;

- (instancetype)initWithImageNames:(NSArray *)imageNames autoScrollingEnabled:(BOOL)autoScrollingEnabled timeInterval:(NSTimeInterval)timeInterval;

@end


