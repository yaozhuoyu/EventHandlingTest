//
//  ButtonActionForOutSideViewController.m
//  EventHandlingTest
//
//  Created by 姚卓禹 on 14-3-9.
//  Copyright (c) 2014年 yzy. All rights reserved.
//

#import "ButtonActionForOutSideViewController.h"

@interface ActionCustomView : UIView

@property (nonatomic, strong) UIControl *hitControl;

@end

@implementation ActionCustomView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if ([self pointInside:point withEvent:event]) {
        return self.hitControl;
    }
    return nil;
}

@end

@interface ButtonActionForOutSideViewController ()

@end

@implementation ButtonActionForOutSideViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *actionbigBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    actionbigBtn.frame = CGRectMake(100.0f, 250.0f, 100.0f, 50.0f);
    [self.view addSubview:actionbigBtn];
    [actionbigBtn setTitle:@"testhit" forState:UIControlStateNormal];
    [actionbigBtn addTarget:self action:@selector(testHit:) forControlEvents:UIControlEventTouchDown];
    [actionbigBtn addTarget:self action:@selector(testHit2:) forControlEvents:UIControlEventTouchUpInside];
    [actionbigBtn addTarget:self action:@selector(testHit3:) forControlEvents:UIControlEventTouchUpOutside];
    actionbigBtn.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.6];
    
    
    
	//现在button所在的位置为CGRectMake(100.0f, 250.0f, 100.0f, 50.0f)，如果我想让点击（50，150，50，50）的区域也会响应button事件，则需要这么做
    
    ActionCustomView *customView = [[ActionCustomView alloc] initWithFrame:CGRectMake(50, 150, 50, 50)];
    customView.backgroundColor = [UIColor redColor];
    customView.hitControl = actionbigBtn;
    [self.view addSubview:customView];
    
    [self.view bringSubviewToFront:actionbigBtn];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testHit:(UIButton *)btn{
    NSLog(@"UIControlEventTouchDown");
}

- (void)testHit2:(UIButton *)btn{
    NSLog(@"UIControlEventTouchUpInside");
}

- (void)testHit3:(UIButton *)btn{
    NSLog(@"UIControlEventTouchUpOutside");
}

@end
