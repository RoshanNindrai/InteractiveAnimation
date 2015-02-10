//
//  ViewController.m
//  FEInteractiveAnimationDemo
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 2/9/15.
//  Copyright (c) 2015 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "FEPresentingViewController.h"
#import "FEPresentor.h"
#import "FEPresentedController.h"

@interface FEPresentingViewController ()

@end

@implementation FEPresentingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAnimation:(id)sender {
    
    FEPresentedController *presentedController = [FEPresentedController new];
    [presentedController setTransitioningDelegate:self];
    presentedController.modalPresentationStyle = UIModalPresentationCustom;
    
    [self.navigationController presentViewController:presentedController
                                            animated:YES
                                          completion:NULL];
    
}
#pragma mark transition animatino delegate

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    
    return nil;
    
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                 presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [FEPresentor new];
    
    
}

@end
