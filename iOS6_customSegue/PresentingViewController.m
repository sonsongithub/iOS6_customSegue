//
//  PresentingViewController.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/21.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "PresentingViewController.h"

#import "MyDismissingSegue.h"

@interface PresentingViewController ()

@end

@implementation PresentingViewController

- (UIViewController*)viewControllerForUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender {
	NSLog(@"%@ - viewControllerForUnwindSegueAction:fromViewController:withSender", self);
	return [super viewControllerForUnwindSegueAction:action fromViewController:fromViewController withSender:sender];
}

- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController
									  fromViewController:(UIViewController *)fromViewController
											  identifier:(NSString *)identifier {
	NSLog(@"%@ - segueForUnwindingToViewController:fromViewController:identifier", self);
	
	if ([identifier isEqualToString:@"dissmissPresentedViewController"])
		return [[MyDismissingSegue alloc] initWithIdentifier:identifier
													  source:fromViewController
												 destination:toViewController];
	return [super segueForUnwindingToViewController:toViewController
								 fromViewController:fromViewController
										 identifier:identifier];
}

- (IBAction)dissmissPresentedViewController:(UIStoryboardSegue*)segue {
}

@end
