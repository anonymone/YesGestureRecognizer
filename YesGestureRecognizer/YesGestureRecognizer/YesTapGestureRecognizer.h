//
//  YesTapGestureRecognizer.h
//  YesGestureRecognizer
//
//  Created by Severus Peng on 2021/7/10.
//

#ifndef YesTapGestureRecognizer_h
#define YesTapGestureRecognizer_h
#import <UIKit/UIGestureRecognizer.h>

@interface YesTapGestureRecognizer : UIGestureRecognizer

@property (nonatomic, assign) NSUInteger numberOfTapsRequired;
@property (nonatomic, assign) NSUInteger numberOfTouchesRequired;
@property (nonatomic, assign) NSTimeInterval intervalBetweenTaps;

@end

#endif /* YesTapGestureRecognizer_h */
