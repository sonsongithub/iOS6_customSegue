//
//  MyNavigatonController.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/21.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "MyNavigatonController.h"

#import "MyPopSegue.h"

@interface MyNavigatonController ()

@end

@implementation MyNavigatonController

- (UIViewController*)viewControllerForUnwindSegueAction:(SEL)action
									 fromViewController:(UIViewController *)fromViewController
											 withSender:(id)sender {
	NSLog(@"%@ - viewControllerForUnwindSegueAction:fromViewController:withSender", self);
	return [super viewControllerForUnwindSegueAction:action
								  fromViewController:fromViewController
										  withSender:sender];
}

- (BOOL)canPerformUnwindSegueAction:(SEL)action
				 fromViewController:(UIViewController *)fromViewController
						 withSender:(id)sender {
	NSLog(@"%@ - canPerformUnwindSegueAction:fromViewController:withSender", self);
	return [super canPerformUnwindSegueAction:action
						   fromViewController:fromViewController
								   withSender:sender];
}

- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController
									  fromViewController:(UIViewController *)fromViewController
											  identifier:(NSString *)identifier {
	NSLog(@"%@ - segueForUnwindingToViewController:fromViewController:identifier", self);
	if ([identifier isEqualToString:@"popToFirstViewController"])
		return [[MyPopSegue alloc] initWithIdentifier:identifier
											   source:fromViewController
										  destination:toViewController];
	return [super segueForUnwindingToViewController:toViewController
								 fromViewController:fromViewController
										 identifier:identifier];
}

@end
