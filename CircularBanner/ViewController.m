//
//  ViewController.m
//  CircularBanner
//
//  Created by Greener Chen on 2020/4/15.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.items = @[@"banner-1", @"banner-2", @"banner-3", @"banner-4"];
    self.banner.dataSource = self;
    self.banner.autoScrolledEnabled = YES;
    [self.banner reloadData];
}

// MARK: - CircularBannerDataSource

- (NSInteger)numberOfItemsInCircularBanner:(CircularBanner *)circularBanner
{
    return self.items.count;
}

- (UIView *)circularBannerView:(CircularBanner *)circularBanner viewForItemAtIndex:(NSInteger)index
{
    UIImage *image = [UIImage imageNamed:self.items[index]];
    UIImageView *view = [[UIImageView alloc] initWithImage:image];
    view.contentMode = UIViewContentModeScaleAspectFill;
    return view;
}

@end
