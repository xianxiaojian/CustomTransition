//
//  PresentedViewController.m
//  Transition
//
//  Created by Lin on 15/12/7.
//  Copyright © 2015年 Lin. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 30, 30)];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
