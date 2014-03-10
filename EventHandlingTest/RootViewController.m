//
//  RootViewController.m
//  EventHandlingTest
//
//  Created by yaozhuoyu on 14-3-3.
//  Copyright (c) 2014年 yzy. All rights reserved.
//

#import "RootViewController.h"
#import "GestureViewController.h"
#import "TouchViewController.h"
#import "ButtonActionForOutSideViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIButton *gestureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    gestureBtn.frame = CGRectMake(100.0f, 100.0f, 100.0f, 30.0f);
    [gestureBtn setTitle:@"gotoGesture" forState:UIControlStateNormal];
    [gestureBtn addTarget:self action:@selector(gotoGesture) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gestureBtn];
    
    gestureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    gestureBtn.frame = CGRectMake(100.0f, 150.0f, 100.0f, 30.0f);
    [gestureBtn setTitle:@"gotoTouch" forState:UIControlStateNormal];
    [gestureBtn addTarget:self action:@selector(gotoTouch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gestureBtn];
    
    gestureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    gestureBtn.frame = CGRectMake(100.0f, 200.0f, 100.0f, 30.0f);
    [gestureBtn setTitle:@"gotobtnOutSide" forState:UIControlStateNormal];
    [gestureBtn addTarget:self action:@selector(gotobtnOutSide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gestureBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gotoGesture{
    GestureViewController *gestVC = [[GestureViewController alloc] init];
    [self.navigationController pushViewController:gestVC animated:YES];
}

- (void)gotoTouch{
    TouchViewController *gestVC = [[TouchViewController alloc] init];
    [self.navigationController pushViewController:gestVC animated:YES];
}

- (void)gotobtnOutSide{
    ButtonActionForOutSideViewController *vc = [[ButtonActionForOutSideViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
