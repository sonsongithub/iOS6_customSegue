//
//  FirstViewController.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/21.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (IBAction)popToFirstViewController:(UIStoryboardSegue*)segue {
}

- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender {
	NSLog(@"%@ - canPerformUnwindSegueAction:fromViewController:withSender", self);
	return [super canPerformUnwindSegueAction:action fromViewController:fromViewController withSender:sender];
}

@end
