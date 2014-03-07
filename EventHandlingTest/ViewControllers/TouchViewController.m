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
    touchView_ = [[TouchView alloc] initWithFrame:CGRectMake(50.0f, 150.0f, 150.0f, 150.0f)];
    [self.view addSubview:touchView_];
    
    //在touchView上添加tapgesture(discrete)
    //[self addTapGestureToTouchView];
    
    //在touchView上添加pangesture(continuous)
    //[self addPanGestureToTouchView];
    
    //[self testBtnFrameBigTouchView];
    
    //[self testBtnAndClearView];
    
    //测试事件传递过程
    [self testEventDelivery];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//viewcontroller event

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"************** %@ touches Began", self);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"************** %@ touches Moved", self);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"************** %@ touches Ended", self);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"************** %@ touches Cancelled", self);
}


- (void)testEventDelivery{
    //将一个btn放在touchview，当点击btn的时候，touchview是不会响应的，因为btn把事件截获了，猜测btn的touchevent事件没有调用super
    
    UIButton *actionbigBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    //actionbigBtn.frame = CGRectMake(50.0f, 250.0f, 100.0f, 30.0f);
    actionbigBtn.frame = CGRectMake(20.0f, 50.0f, 100.0f, 50.0f);
    [touchView_ addSubview:actionbigBtn];
    [actionbigBtn setTitle:@"event del" forState:UIControlStateNormal];
    [actionbigBtn addTarget:self action:@selector(testEventDel:) forControlEvents:UIControlEventTouchUpInside];
    actionbigBtn.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1];
}

- (void)testEventDel:(UIButton *)btn{
    NSLog(@"test event delivery");
}

- (void)testHit:(UIButton *)btn{
    NSLog(@"test hit");
}

- (void)testBtnFrameBigTouchView{
    UIButton *actionbigBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    actionbigBtn.frame = CGRectMake(-50.0f, -50.0f, 300.0f, 300.0f);
    [touchView_ addSubview:actionbigBtn];
    [actionbigBtn setTitle:@"test hit" forState:UIControlStateNormal];
    [actionbigBtn addTarget:self action:@selector(testHit:) forControlEvents:UIControlEventTouchUpInside];
    actionbigBtn.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.2];
}

- (void)testBtnAndClearView{
    UIButton *actionbigBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    actionbigBtn.frame = CGRectMake(100.0f, 250.0f, 200.0f, 200.0f);
    [self.view addSubview:actionbigBtn];
    [actionbigBtn setTitle:@"test clear" forState:UIControlStateNormal];
    [actionbigBtn addTarget:self action:@selector(testHit:) forControlEvents:UIControlEventTouchUpInside];
    actionbigBtn.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.2];
    
    UIView *transView = [[UIView alloc] initWithFrame:CGRectMake(50.0f, 200.0f, 300.0f, 300.0f)];
    //alpha 和 hidden的时候 btn可以响应事件。
    //transView.alpha = 0.0f;
    //transView.hidden = YES;
    
    //默认就是clearColor颜色,此时btn不能响应事件
    transView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:transView];
}


- (void)addTapGestureToTouchView{
    
    /*
     ==== touch began event
     ==== touch moved event
     ==== touch moved event
     ==== touch moved event
     ==== touch moved event
     tap gesture state 3
     ==== touch cancelled event
     */
    UITapGestureRecognizer *tapGestureRecon = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    tapGestureRecon.numberOfTapsRequired = 2;
    //tapGestureRecon.delaysTouchesBegan = NO;
    tapGestureRecon.delaysTouchesEnded = YES;
    [touchView_ addGestureRecognizer:tapGestureRecon];
    
}

- (void)tapGestureAction:(UITapGestureRecognizer *)tapGesture{
    NSLog(@"tap gesture state %d", tapGesture.state);
}

- (void)addPanGestureToTouchView{
    /*
     2014-03-04 13:46:05.641 EventHandlingTest[1032:60b] ==== touch began event
     2014-03-04 13:46:05.856 EventHandlingTest[1032:60b] ==== touch moved event
     2014-03-04 13:46:05.873 EventHandlingTest[1032:60b] ==== touch moved event
     2014-03-04 13:46:05.890 EventHandlingTest[1032:60b] ==== touch moved event
     2014-03-04 13:46:05.906 EventHandlingTest[1032:60b] ==== touch moved event
     2014-03-04 13:46:05.923 EventHandlingTest[1032:60b] ==== touch moved event
     2014-03-04 13:46:05.939 EventHandlingTest[1032:60b] ==== touch moved event
     2014-03-04 13:46:05.956 EventHandlingTest[1032:60b] pan gesture state 1
     2014-03-04 13:46:05.958 EventHandlingTest[1032:60b] ==== touch cancelled event
     2014-03-04 13:46:05.973 EventHandlingTest[1032:60b] pan gesture state 2
     2014-03-04 13:46:05.974 EventHandlingTest[1032:60b] pan gesture state 2
     2014-03-04 13:46:05.989 EventHandlingTest[1032:60b] pan gesture state 2
     2014-03-04 13:46:06.006 EventHandlingTest[1032:60b] pan gesture state 2
     2014-03-04 13:46:06.023 EventHandlingTest[1032:60b] pan gesture state 2
     2014-03-04 13:46:06.939 EventHandlingTest[1032:60b] pan gesture state 2
     2014-03-04 13:46:07.023 EventHandlingTest[1032:60b] pan gesture state 2
     2014-03-04 13:46:07.156 EventHandlingTest[1032:60b] pan gesture state 2
     2014-03-04 13:46:07.406 EventHandlingTest[1032:60b] pan gesture state 2
     2014-03-04 13:46:07.423 EventHandlingTest[1032:60b] pan gesture state 2
     2014-03-04 13:46:07.439 EventHandlingTest[1032:60b] pan gesture state 3
    */
    
    UIPanGestureRecognizer *panGestureRecon = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
    [touchView_ addGestureRecognizer:panGestureRecon];
    //panGestureRecon.delaysTouchesBegan = YES;
    panGestureRecon.delaysTouchesEnded = NO;
    
    /*
     当取消注释，delaysTouchesBegan设置为YES的时候，结果为：
     2014-03-04 14:02:17.375 EventHandlingTest[1060:60b] pan gesture state 1
     2014-03-04 14:02:17.391 EventHandlingTest[1060:60b] pan gesture state 2
     2014-03-04 14:02:17.393 EventHandlingTest[1060:60b] pan gesture state 2
     2014-03-04 14:02:17.924 EventHandlingTest[1060:60b] pan gesture state 2
     2014-03-04 14:02:17.958 EventHandlingTest[1060:60b] pan gesture state 2
     2014-03-04 14:02:18.141 EventHandlingTest[1060:60b] pan gesture state 2
     2014-03-04 14:02:18.175 EventHandlingTest[1060:60b] pan gesture state 3
     
     view的touch事件不会响应。
     */
}

- (void)panGestureAction:(UITapGestureRecognizer *)tapGesture{
    NSLog(@"pan gesture state %d", tapGesture.state);
}

@end
