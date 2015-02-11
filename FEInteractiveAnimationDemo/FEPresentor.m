//
//  FREPresentor.m
//  FEInteractiveAnimationDemo
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 2/9/15.
//  Copyright (c) 2015 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "FEPresentor.h"

@implementation FEPresentor : NSObject

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    toView.frame = CGRectMake(0,
                              0,
                              CGRectGetWidth(transitionContext.containerView.bounds) - 104.f,
                              CGRectGetHeight(transitionContext.containerView.bounds) - 288.f);
    toView.center = CGPointMake(transitionContext.containerView.center.x, -transitionContext.containerView.center.y);
    
    [transitionContext.containerView addSubview:toView];
    
    [UIView animateWithDuration:.50 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
        toView.center = CGPointMake(transitionContext.containerView.center.x, transitionContext.containerView.center.y + 100);
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    
}


@end
