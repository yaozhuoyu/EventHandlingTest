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
    [super touchesBegan:touches withEvent:event];
    //NSLog(@"==== touch began event %@ ***** %@", event, touches);
    NSLog(@"==== touch began event");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    //NSLog(@"==== touch moved event %@ ***** %@", event, touches);
    NSLog(@"==== touch moved event");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    //NSLog(@"==== touch ended event %@ ***** %@", event, touches);
    NSLog(@"==== touch ended event");
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
    //NSLog(@"==== touch cancelled event %@ ***** %@", event, touches);
    NSLog(@"==== touch cancelled event");
}


@end
