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
//过渡动画是否完成
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
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged:{
//            NSLog(@"%f----%f",pinch.scale,pinch.velocity);
            [self updateInteractiveTransition:1-pinch.scale];
            if (pinch.scale < 0.8) {
                self.completed = YES;
            }
            NSLog(@"%f----%f",pinch.scale,pinch.velocity);
        }
            break;
        case UIGestureRecognizerStateCancelled:{
            [self cancelInteractiveTransition];
        }
            break;
        case UIGestureRecognizerStateEnded:{
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
