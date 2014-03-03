//
//  TouchView.m
//  EventHandlingTest
//
//  Created by 姚卓禹 on 14-3-4.
//  Copyright (c) 2014年 yzy. All rights reserved.
//

#import "TouchView.h"

@implementation TouchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

/*
 在一次过程中，event都是同一个对象,而每一个方法中参数touches和event allTouches 相同
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"==== touch began event %@ ***** %@", event, touches);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"==== touch moved event %@ ***** %@", event, touches);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"==== touch ended event %@ ***** %@", event, touches);
}


@end
