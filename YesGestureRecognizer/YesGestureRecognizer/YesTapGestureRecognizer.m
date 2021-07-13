//
//  YesTapGestureRecognizer.m
//  YesGestureRecognizer
//
//  Created by Severus Peng on 2021/7/10.
//

#import <Foundation/Foundation.h>
#import "YesTapGestureRecognizer.h"
#import <UIKit/UIKit.h>

@interface YesTapGestureRecognizer()

@property (nonatomic, assign) NSInteger tapCounter;
@property (nonatomic, assign) NSTimeInterval tapTimerStamp;
@property (nonatomic, assign) CGPoint lastPostion;

@end

@implementation YesTapGestureRecognizer

- (instancetype)initWithTarget:(id)target action:(SEL)action
{
    self = [super initWithTarget:target action:action];
    if(self) {
        _tapCounter = 0;
        _intervalBetweenTaps = 0.0;
        _lastPostion = CGPointZero;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if(_tapCounter != 0){
        NSTimeInterval tmp = [NSDate date].timeIntervalSince1970 - _tapTimerStamp;
        if(tmp >_intervalBetweenTaps) {
            [self setState:UIGestureRecognizerStateFailed];
            return;
        }
    }
    _tapTimerStamp = [NSDate date].timeIntervalSince1970;
    _tapCounter = _tapCounter + 1;
    [super touchesEnded:touches withEvent:event];
}

- (void)reset
{
    [super reset];
    _tapCounter = 0;
    _intervalBetweenTaps = [NSDate date].timeIntervalSince1970;
}
@end
