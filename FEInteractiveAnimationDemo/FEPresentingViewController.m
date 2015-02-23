//
//  ViewController.m
//  FEInteractiveAnimationDemo
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 2/9/15.
//  Copyright (c) 2015 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "FEPresentingViewController.h"
#import "FEAnimationInteractor.h"


@interface FEPresentingViewController ()

@property(nonatomic, strong)FEAnimationInteractor *interactor;

@end

@implementation FEPresentingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    self.interactor = [[FEAnimationInteractor alloc] initWithViewController:self];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAnimation:(id)sender {
    
    [self.interactor startAnimating];
    
}



@end
