//
//  ViewController.m
//  CustomTransition
//
//  Created by Lin on 15/12/29.
//  Copyright © 2015年 Lin. All rights reserved.
//

#import "ViewController.h"
#import "PresentedViewController.h"
#import "PresentAnimator.h"
#import "DismissAnimator.h"
#import "DismissInteractiveAnimator.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic,strong) DismissInteractiveAnimator *interactiveAnimator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked:(UIButton *)button{
    PresentedViewController *presentedVC = [[PresentedViewController alloc] init];
    presentedVC.transitioningDelegate = self;
    //设置呈现控制器的模式为自定义，让你可以更改控制器的frame
    presentedVC.modalPresentationStyle = UIModalPresentationCustom;
    self.interactiveAnimator = [[DismissInteractiveAnimator alloc] init];
    [self.interactiveAnimator addGestureRecognizerToViewController:presentedVC];
    
    [self presentViewController:presentedVC animated:YES completion:nil];
    
}

//返回transition animator（管理过渡动画的对象）
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[PresentAnimator alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [[DismissAnimator alloc] init];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return self.interactiveAnimator;
}
@end
