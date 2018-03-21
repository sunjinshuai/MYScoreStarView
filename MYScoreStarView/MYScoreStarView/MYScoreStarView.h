//
//  MYScoreStarView.h
//  MYScoreStarView
//
//  Created by Michael on 2017/2/14.
//  Copyright © 2017年 com.chinabidding. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MYScoreStarStyle) {
    MYScoreStarStyleDefault,   // 只能出现整个星型被选中
    MYScoreStarStyleHalf,      // 只能出现半个星型
    MYScoreStarStylePrecision, // 可以出现精确值
};

@interface MYScoreStarView : UIControl

@property (nonatomic) NSUInteger maxValue;
@property (nonatomic) CGFloat minValue;
@property (nonatomic) CGFloat value;
@property (nonatomic) CGFloat spacing;
@property (nonatomic) MYScoreStarStyle starStyle;

@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *unselectedColor;
@property (nonatomic, strong) UIColor *borderColor;

@end
