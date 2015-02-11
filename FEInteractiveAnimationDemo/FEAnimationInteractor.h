//
//  FEAnimationInteractor.h
//  FEInteractiveAnimationDemo
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 2/10/15.
//  Copyright (c) 2015 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FEAnimationInteractor : NSObject <UIViewControllerInteractiveTransitioning, UIViewControllerAnimatedTransitioning>



-(instancetype)initWithViewController:(UIViewController *)viewController;

-(void)startAnimating;

@end
