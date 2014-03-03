//
//  TouchViewController.m
//  EventHandlingTest
//
//  Created by 姚卓禹 on 14-3-4.
//  Copyright (c) 2014年 yzy. All rights reserved.
//

#import "TouchViewController.h"
#import "TouchView.h"

@interface TouchViewController (){
    TouchView *touchView_;
}

@end

@implementation TouchViewController

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
	// Do any additional setup after loading the view.
    touchView_ = [[TouchView alloc] initWithFrame:CGRectMake(50.0f, 150.0f, 250.0f, 250.0f)];
    [self.view addSubview:touchView_];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
