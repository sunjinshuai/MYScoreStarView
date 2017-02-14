//
//  ViewController.m
//  MYScoreStarView
//
//  Created by Michael on 2017/2/14.
//  Copyright © 2017年 com.chinabidding. All rights reserved.
//

#import "ViewController.h"
#import "MYScoreStarView.h"

@interface ViewController ()<MYScoreStarViewDelegate>

@property (nonatomic, strong) MYScoreStarView *starView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.starView];
}

#pragma mark - MYScoreStarViewDelegate
- (void)starsScore:(MYScoreStarView *)starsScore valueChange:(CGFloat)value {
    NSLog(@"等级%f",value);
}

- (MYScoreStarView *)starView
{
    if (!_starView) {
        _starView = [[MYScoreStarView alloc] initWithFrame:CGRectMake(150, 300, 130, 18) numberOfStars:5];
        _starView.scorePercent = 5;
        _starView.allowIncompleteStar = YES;
        _starView.hasAnimation = YES;
        _starView.delegate = self;
        [self.view addSubview:_starView];
    }
    return _starView;
}


@end
