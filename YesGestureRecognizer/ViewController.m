//
//  ViewController.m
//  YesGestureRecognizer
//
//  Created by Severus Peng on 2021/7/10.
//

#import "ViewController.h"
#import "YesTapGestureRecognizer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blueColor]];
    YesTapGestureRecognizer* tap=[[YesTapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    tap.numberOfTapsRequired = 2;
    tap.numberOfTouchesRequired = 1;
    tap.intervalBetweenTaps = 0.2;
    [self.view addGestureRecognizer:tap];
}

-(void)tap:(UITapGestureRecognizer*)sender
{
    [self.view setBackgroundColor:[self randColor]];
    
}

- (UIColor *) randColor
{
    float red = (50+(arc4random()%200)) / 250.0;
    float green = ((arc4random()%250)) / 250.0;
    float blue = ((arc4random()%250)) / 250.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:0.8];
    return color;
}

@end
