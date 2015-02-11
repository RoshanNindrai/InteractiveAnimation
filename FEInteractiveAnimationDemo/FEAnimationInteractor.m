//
//  FEAnimationInteractor.m
//  FEInteractiveAnimationDemo
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 2/10/15.
//  Copyright (c) 2015 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "FEAnimationInteractor.h"
#import "FEPresentedController.h"

@interface FEAnimationInteractor ()<UIViewControllerTransitioningDelegate, UIGestureRecognizerDelegate>

@property(assign)BOOL isAnimating;
@property(nonatomic, weak)UIViewController * parentViewController;

@end

@implementation FEAnimationInteractor

-(instancetype)initWithViewController:(UIViewController *)viewController {
    
    self = [super init];
    if(self) {
        
        self.parentViewController = viewController;
        [self setGestureRecognizers];
    }
    
    return self;
    
}

-(void)setGestureRecognizers {
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didUserPan:)];
    [gestureRecognizer setDelegate:self];
    [self.parentViewController.view addGestureRecognizer:gestureRecognizer];
    
}

-(void)didUserPan:(UIPanGestureRecognizer *)gestureRecognizer {
    
    NSLog(@"Did pan %@", NSStringFromCGPoint([gestureRecognizer locationInView:gestureRecognizer.view]));
    
    
}

-(void)startAnimating {
    
    FEPresentedController *presentedController = [FEPresentedController new];
    [presentedController setTransitioningDelegate:self];
    presentedController.modalPresentationStyle = UIModalPresentationCustom;
    
    [self.parentViewController.navigationController presentViewController:presentedController
                                            animated:YES
                                          completion:NULL];
    
}


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

-(void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    
    
}

#pragma mark UIViewControllerTransitioningDelegate Methods

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    
    return self;
    
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                 presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return self;
    
    
}

@end
