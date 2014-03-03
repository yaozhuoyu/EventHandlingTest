//
//  GestureViewController.m
//  EventHandlingTest
//
//  Created by yaozhuoyu on 14-3-3.
//  Copyright (c) 2014年 yzy. All rights reserved.
//

#import "GestureViewController.h"

@interface GestureViewController (){
    UIButton *gestureBtn;
}

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
    
    
    gestureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    gestureBtn.frame = CGRectMake(100.0f, 100.0f, 100.0f, 30.0f);
    [gestureBtn setTitle:@"test_button" forState:UIControlStateNormal];
    [gestureBtn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gestureBtn];
    
    //button and tapGesture
    [self buttonAndAddGesture];
    //结果为actionTapGesture响应了，而actionBtn没有响应
    
    //button and superview tapGesture
    //[self buttonAndAddGestureToSuperView];
    //结果为actionTapGesture没响应，而actionBtn响应了
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

- (void)actionTapGesture:(UISwipeGestureRecognizer *)tapGesture{
    //
    NSLog(@"==== actiontapGesture state %d",tapGesture.state);
}

- (void)actionBtn:(UIButton *)btn{
    NSLog(@"---- button action");
}

//
- (void)buttonAndAddGesture{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTapGesture:)];
    [gestureBtn addGestureRecognizer:tapGesture];
    
}

- (void)buttonAndAddGestureToSuperView{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionTapGesture:)];
    [gestureBtn.superview addGestureRecognizer:tapGesture];
}

@end
