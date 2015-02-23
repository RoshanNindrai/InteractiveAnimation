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
@property(nonatomic, weak)UIView * presentedView;
@property(nonatomic, assign)CGPoint initialViewCenter;
@property(nonatomic, strong)id<UIViewControllerContextTransitioning> transitionContext;

@end

@implementation FEAnimationInteractor

-(instancetype)initWithViewController:(UIViewController *)viewController {
    
    self = [super init];
    if(self) {
        
        self.parentViewController = viewController;
    
    }
    
    return self;
    
}

-(void)didUserPan:(UIPanGestureRecognizer *)gestureRecognizer {
    
    
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
        self.presentedView.transform = CGAffineTransformScale(self.presentedView.transform, .9, .9);
            CALayer *layer = self.presentedView.layer.presentationLayer;
        
            self.presentedView.layer.position = layer.position;
            [self.presentedView.layer removeAllAnimations];
            self.initialViewCenter = self.presentedView.center;
        
    }
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        
        CGPoint centerTranslated = self.initialViewCenter;
        centerTranslated.x += translation.x;
        centerTranslated.y += translation.y;
        self.presentedView.center = centerTranslated;
        
    }
    if(gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        
        self.presentedView.transform = CGAffineTransformIdentity;
        
    }
    
    
}

-(void)startAnimating {
    
    FEPresentedController *presentedController = [FEPresentedController new];
    [presentedController setTransitioningDelegate:self];
    presentedController.modalPresentationStyle = UIModalPresentationCustom;
    
    [self.parentViewController.navigationController presentViewController:presentedController
                                            animated:YES
                                          completion:NULL];
    
}


- (NSTimeInterval)transitionDuration:(id)transitionContext
{
    return 1.0f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return;
    
}

-(void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didUserPan:)];
    [gestureRecognizer setDelegate:self];
    [transitionContext.containerView addGestureRecognizer:gestureRecognizer];
    self.transitionContext = transitionContext;
    
    self.presentedView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    self.presentedView.frame = CGRectMake(0,
                              0,
                              CGRectGetWidth(transitionContext.containerView.bounds) - 104.f,
                              CGRectGetHeight(transitionContext.containerView.bounds) - 288.f);
    self.presentedView.center = CGPointMake(transitionContext.containerView.center.x, -transitionContext.containerView.center.y);
    
    [transitionContext.containerView addSubview:self.presentedView];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
        self.presentedView.center = CGPointMake(transitionContext.containerView.center.x, transitionContext.containerView.center.y + 150);
        
    } completion:^(BOOL finished) {
        
        if(finished) {
            
            [gestureRecognizer.view removeGestureRecognizer:gestureRecognizer];
            [transitionContext finishInteractiveTransition];
            [transitionContext completeTransition:YES];
            
        }
    }];

    
}

#pragma mark UIViewControllerTransitioningDelegate Methods

- (id<UIViewControllerInteractiveTransitioning>)
interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
    
    
    return (id<UIViewControllerInteractiveTransitioning>)self;
}

- (id<UIViewControllerInteractiveTransitioning>)
interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    
    return (id<UIViewControllerInteractiveTransitioning>)self;
}

- (id<UIViewControllerAnimatedTransitioning>)
animationControllerForPresentedController:(UIViewController *)presented
presentingController:(UIViewController *)presenting
sourceController:(UIViewController *)source {
    
    
    return self;
    
}

- (id<UIViewControllerAnimatedTransitioning>)
animationControllerForDismissedController:(UIViewController *)dismissed {
    
    
    return self;
    
}

@end
