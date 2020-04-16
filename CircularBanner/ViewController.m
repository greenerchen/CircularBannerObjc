//
//  ViewController.m
//  CircularBanner
//
//  Created by Greener Chen on 2020/4/15.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *imageNames = @[@"banner-1", @"banner-2", @"banner-3", @"banner-4"];
    CircularBannerModel *model = [[CircularBannerModel alloc] initWithImageNames:imageNames autoScrollingEnabled:YES timeInterval:2.0];
    self.banner.model = model;
}

@end
