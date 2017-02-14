//
//  MYScoreStarView.m
//  MYScoreStarView
//
//  Created by Michael on 2017/2/14.
//  Copyright © 2017年 com.chinabidding. All rights reserved.
//

#import "MYScoreStarView.h"

#define ANIMATION_TIME_INTERVAL 0.2
#define DEFALUT_STAR_NUMBER 5

@interface MYScoreStarView ()

@property (nonatomic, strong) UIView *foregroundStarView;
@property (nonatomic, strong) UIView *backgroundStarView;
@property (nonatomic, assign) NSInteger numberOfStars;

@end

@implementation MYScoreStarView

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame numberOfStars:DEFALUT_STAR_NUMBER];
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars {
    if (self = [super initWithFrame:frame]) {
        _numberOfStars = numberOfStars;
        [self buildDataAndUI];
    }
    return self;
}

#pragma mark - Private Methods
- (void)buildDataAndUI {
    _scorePercent = 5;//默认为1
    _hasAnimation = NO;//默认为NO
    _allowIncompleteStar = NO;//默认为NO
    
    self.foregroundStarView = [self createStarViewWithImage:@"product_star"];
    self.backgroundStarView = [self createStarViewWithImage:@"product_star_empty"];
    
    [self addSubview:self.backgroundStarView];
    [self addSubview:self.foregroundStarView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
}

- (void)userTapRateView:(UITapGestureRecognizer *)gesture {
    CGPoint tapPoint = [gesture locationInView:self];
    CGFloat offset = tapPoint.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars);
    CGFloat starScore = self.allowIncompleteStar ? realStarScore : ceilf(realStarScore);
    NSInteger tmpScore = (starScore / self.numberOfStars) * 5;
    
    NSInteger score = (starScore / self.numberOfStars) * 5 > tmpScore ? tmpScore + 1 : tmpScore;
    
    self.scorePercent = (CGFloat)score;;
}

- (UIView *)createStarViewWithImage:(NSString *)imageName {
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    for (NSInteger i = 0; i < self.numberOfStars; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * self.bounds.size.width / self.numberOfStars, 0, self.bounds.size.width / self.numberOfStars, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self animationTheShow];
}

- (void)animationTheShow
{
    __weak MYScoreStarView *weakSelf = self;
    CGFloat animationTimeInterval = self.hasAnimation ? ANIMATION_TIME_INTERVAL : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
        weakSelf.foregroundStarView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * (weakSelf.scorePercent / 5), weakSelf.bounds.size.height);
    }];
}

- (void)setScorePercent:(CGFloat)scroePercent {
    if (_scorePercent == scroePercent) {
        return;
    }
    
    _scorePercent = scroePercent;
    
    _scorePercent = (_scorePercent <= 1) ? 1 : _scorePercent;
    _scorePercent = (_scorePercent >= 5) ? 5 : _scorePercent;
    
    
    if ([self.delegate respondsToSelector:@selector(starsScore:valueChange:)]) {
        [self.delegate starsScore:self valueChange:_scorePercent];
    }
    
    [self setNeedsLayout];
}

@end
