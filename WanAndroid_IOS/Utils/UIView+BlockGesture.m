//
//  UIView+BlockGesture.m
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/10/11.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import "UIView+BlockGesture.h"
#import <objc/runtime.h>

static char kActionHandlerTapBlockKey;
static char kActionHandlerTapGestureKey;
static char kActionHandlerLongPressBlockKey;
static char kActionHandlerLongPressGestureKey;


@implementation UIView (BlockGesture)

 - (void)addTapActionWithBlock:(GestureActionBlock)block
 {
     UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey);
     if (!gesture)
     {
         gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
         [self addGestureRecognizer:gesture];
         objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
     }
     objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
 }

- (void)handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
    // 禁止点击0.1秒
    UIView *view = gesture.view;
    view.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        view.userInteractionEnabled = YES;
    });
    
    
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        GestureActionBlock block = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}

@end
