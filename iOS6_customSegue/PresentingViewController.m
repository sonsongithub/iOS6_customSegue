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

- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController
									  fromViewController:(UIViewController *)fromViewController
											  identifier:(NSString *)identifier {
	return [[MyDismissingSegue alloc] initWithIdentifier:identifier
												  source:fromViewController
											 destination:toViewController];
}

- (IBAction)dissmissPresentedViewController:(UIStoryboardSegue*)segue {
}

@end
