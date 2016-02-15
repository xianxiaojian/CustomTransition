//
//  DismissAnimator.m
//  Transition
//
//  Created by Lin on 15/12/7.
//  Copyright © 2015年 Lin. All rights reserved.
//

#import "DismissAnimator.h"
static const NSTimeInterval kDuration = 0.5;
@implementation DismissAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return kDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{

    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [UIView animateWithDuration:kDuration animations:^{
        fromVC.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
        fromVC.view.alpha = 0.1;
    } completion:^(BOOL finished) {
        //告诉系统过渡动画是完成还是取消
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
@end
