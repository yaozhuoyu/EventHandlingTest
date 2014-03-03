//
//  GestureViewController.m
//  EventHandlingTest
//
//  Created by yaozhuoyu on 14-3-3.
//  Copyright (c) 2014年 yzy. All rights reserved.
//

#import "GestureViewController.h"

@interface GestureViewController ()

@end

@implementation GestureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(actionSwipeGesture:)];
    //需要的手指数
    swipeGesture.numberOfTouchesRequired = 2;
    //方向
    swipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeGesture];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)actionSwipeGesture:(UISwipeGestureRecognizer *)swipeGesture{
    //只有快速的在正确的方向滑动的时候才会认出此手势
    NSLog(@"==== actionSwipeGesture state %d",swipeGesture.state);
}

@end
