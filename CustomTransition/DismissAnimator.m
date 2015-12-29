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
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    NSLog(@"%@----%@",fromVC,toVC);
    
    UIView *containerView = [transitionContext containerView];
    NSLog(@"%@",containerView);
    
    [UIView animateWithDuration:kDuration delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:0 animations:^{
        fromVC.view.transform = CGAffineTransformMakeScale(0.01, 0.01);
        fromVC.view.alpha = 0.1;
    } completion:^(BOOL finished) {
//        [fromVC.view removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}
@end
