//
//  DismissInteractiveAnimator.h
//  Transition
//
//  Created by Lin on 12/27/15.
//  Copyright © 2015 Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DismissInteractiveAnimator : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL interactive;
- (void)addGestureRecognizerToViewController:(UIViewController *)viewController;
@end
