//
//  YesTapGestureRecognizer.h
//  YesGestureRecognizer
//
//  Created by Severus Peng on 2021/7/10.
//

#ifndef YesTapGestureRecognizer_h
#define YesTapGestureRecognizer_h
#import <UIKit/UITapGestureRecognizer.h>

@interface YesTapGestureRecognizer : UITapGestureRecognizer
@property (nonatomic, assign) NSTimeInterval intervalBetweenTaps;

@end

#endif /* YesTapGestureRecognizer_h */
