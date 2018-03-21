//
//  ViewController.m
//  MYScoreStarView
//
//  Created by Michael on 2017/2/14.
//  Copyright © 2017年 com.chinabidding. All rights reserved.
//

#import "ViewController.h"
#import "MYScoreStarView.h"

@interface ViewController ()

@property (nonatomic, strong) MYScoreStarView *starView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.starView];
}

- (MYScoreStarView *)starView {
    if (!_starView) {
        _starView = [[MYScoreStarView alloc] initWithFrame:CGRectMake(20, 200, [UIScreen mainScreen].bounds.size.width - 40, 30)];
        _starView.starStyle = MYScoreStarStyleDefault;
        _starView.maxValue = 5;
        _starView.value = 3;
        _starView.selectedColor = [UIColor redColor];
        _starView.unselectedColor = [UIColor yellowColor];
        [self.view addSubview:_starView];
    }
    return _starView;
}

@end
