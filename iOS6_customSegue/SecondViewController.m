//
//  SecondViewController.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/21.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender {
	NSLog(@"%@ - canPerformUnwindSegueAction:fromViewController:withSender", self);
	return [super canPerformUnwindSegueAction:action fromViewController:fromViewController withSender:sender];
}

@end
