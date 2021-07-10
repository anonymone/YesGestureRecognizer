//
//  YesTapGestureRecognizer.m
//  YesGestureRecognizer
//
//  Created by Severus Peng on 2021/7/10.
//

#import <Foundation/Foundation.h>
#import "YesTapGestureRecognizer.h"
#import <UIKit/UIKit.h>


static const CGFloat INTERACTIVE_ENABLE_DISDANCE = 50.0;

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
    [super touchesCancelled:touches withEvent:event];
    if([touches count] != _numberOfTouchesRequired) {
        [self setState:UIGestureRecognizerStateFailed];
        [self reset];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    if(_tapCounter != 0){
        NSTimeInterval tmp = [NSDate date].timeIntervalSince1970 - _tapTimerStamp;
        if(tmp >_intervalBetweenTaps) {
            [self reset];
            _tapTimerStamp = tmp;
        }
        CGPoint currentPoint = [[touches anyObject] locationInView:nil];
        NSLog(@"%f-%f,%f-%f,%f", currentPoint.x, currentPoint.y, _lastPostion.x, _lastPostion.y, [self distanceBetweenA:_lastPostion andB:currentPoint]);
        if([self distanceBetweenA:_lastPostion andB:currentPoint] > INTERACTIVE_ENABLE_DISDANCE) {
            [self reset];
            _lastPostion = currentPoint;
        }
    }
    _tapTimerStamp = [NSDate date].timeIntervalSince1970;
    _lastPostion = [[touches anyObject] locationInView:nil];
    _tapCounter = _tapCounter + 1;
    
    if(_tapCounter == _numberOfTapsRequired) {
        [self setState:UIGestureRecognizerStateEnded];
        [self reset];
    }
    if(_tapCounter > _numberOfTapsRequired) {
        [self setState:UIGestureRecognizerStateFailed];
        [self reset];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    [self setState:UIGestureRecognizerStateFailed];
    [self reset];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self setState:UIGestureRecognizerStateCancelled];
    [self reset];
}

- (CGFloat)distanceBetweenA:(CGPoint) first andB:(CGPoint) second
{
    CGFloat deltaX = second.x - first.x;
    CGFloat deltaY = second.y - first.y;
    return sqrt(deltaX*deltaX + deltaY*deltaY );
}

- (void)reset
{
    _tapCounter = 0;
}
@end
