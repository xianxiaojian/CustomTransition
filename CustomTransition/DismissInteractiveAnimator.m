//
//  DismissInteractiveAnimator.m
//  Transition
//
//  Created by Lin on 12/27/15.
//  Copyright © 2015 Lin. All rights reserved.
//

#import "DismissInteractiveAnimator.h"

@interface DismissInteractiveAnimator ()
@property (nonatomic,weak) UIViewController *presentingVC;
/** 过渡动画是否完成 */
@property (nonatomic, assign) BOOL completed;
@end

@implementation DismissInteractiveAnimator
- (void)addGestureRecognizerToViewController:(UIViewController *)viewController{
    self.presentingVC = viewController;
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGestureRecognized:)];
    [viewController.view addGestureRecognizer:pinch];
}

- (void)pinchGestureRecognized:(UIPinchGestureRecognizer *)pinch{
    switch (pinch.state) {
        case UIGestureRecognizerStateBegan:{
            self.interactive = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged:{
            //更新过渡动画完成的百分比
            [self updateInteractiveTransition:1-pinch.scale];
            self.completed = (pinch.scale < 0.5);
        }
            break;
        case UIGestureRecognizerStateCancelled:{
            self.interactive = NO;
            [self cancelInteractiveTransition];
        }
            break;
        case UIGestureRecognizerStateEnded:{
            self.interactive = NO;
            if (self.completed) {
                [self finishInteractiveTransition];
            }else{
                [self cancelInteractiveTransition];
            }
        }
            break;
        default:
            break;
    }
}
@end
