//
//  MYScoreStarView.h
//  MYScoreStarView
//
//  Created by Michael on 2017/2/14.
//  Copyright © 2017年 com.chinabidding. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MYScoreStarView;

@protocol MYScoreStarViewDelegate <NSObject>

@optional

- (void)starsScore:(MYScoreStarView *)starsScore valueChange:(CGFloat)value;

@end

@interface MYScoreStarView : UIView

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;

@property (nonatomic, assign) CGFloat scorePercent;//得分值，范围为0--1，默认为1
@property (nonatomic, assign) BOOL hasAnimation;//是否允许动画，默认为NO
@property (nonatomic, assign) BOOL allowIncompleteStar;//评分时是否允许不是整星，默认为NO

@property (nonatomic, weak) id<MYScoreStarViewDelegate> delegate;

@end
