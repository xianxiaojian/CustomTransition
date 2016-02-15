//
//  PresentAnimator.m
//  Transition
//
//  Created by Lin on 15/12/7.
//  Copyright © 2015年 Lin. All rights reserved.
//

#import "PresentAnimator.h"

static const NSTimeInterval kDuration = 0.5;

@implementation PresentAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return kDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //过渡动画的容器视图
    UIView *containerView = [transitionContext containerView];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    toVC.view.frame = CGRectMake(0, 0, 260, 260);
    toVC.view.center = containerView.center;
    [containerView addSubview:toVC.view];
    toVC.view.transform = CGAffineTransformMakeScale(0.3, 0.3);
    [UIView animateWithDuration:kDuration delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:0 animations:^{
        toVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        //告诉系统过渡动画完成了
        [transitionContext completeTransition:YES];
    }];
}
@end
