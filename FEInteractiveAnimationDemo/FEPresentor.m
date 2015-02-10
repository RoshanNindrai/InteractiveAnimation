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

    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    
        animation.fromValue = [NSNumber numberWithFloat:-transitionContext.containerView.center.y];
       animation.toValue = [NSNumber numberWithFloat:(transitionContext.containerView.center.y + 100)];
    
    animation.duration = [self transitionDuration:transitionContext];
    [toView.layer addAnimation:animation forKey:animation.keyPath];
    toView.center = CGPointMake(transitionContext.containerView.center.x, transitionContext.containerView.center.y + 100);
    [transitionContext completeTransition:YES];
    
    
}


@end
