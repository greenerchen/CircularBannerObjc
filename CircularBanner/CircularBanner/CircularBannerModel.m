//
//  CircularBannerModel.m
//  CircularBanner
//
//  Created by Greener Chen on 2020/4/16.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

#import "CircularBannerModel.h"

@implementation CircularBannerModel

- (instancetype)initWithImageNames:(NSArray *)imageNames autoScrollingEnabled:(BOOL)autoScrollingEnabled timeInterval:(NSTimeInterval)timeInterval
{
    self = [super init];
    if (self) {
        __weak CircularBannerModel *weakSelf = self;
        self.dataSource = weakSelf;
        self.imageNames = imageNames;
        self.autoScrollingEnabled = autoScrollingEnabled;
        self.scrollingTimeInterval = timeInterval;
    }
    return self;
}

// MARK: - CircularBannerDataSource

- (NSInteger)numberOfItemsInCircularBanner:(CircularBanner *)circularBanner
{
    return self.imageNames.count;
}

- (UIView *)circularBannerView:(CircularBanner *)circularBanner viewForItemAtIndex:(NSInteger)index
{
    NSString *imageName = self.imageNames[index];
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *view = [[UIImageView alloc] initWithImage:image];
    view.contentMode = UIViewContentModeScaleAspectFill;
    return view;
}

@end
