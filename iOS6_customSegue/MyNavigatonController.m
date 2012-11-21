//
//  MyNavigatonController.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/21.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "MyNavigatonController.h"

@interface MyNavigatonController ()

@end

@implementation MyNavigatonController

- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
	NSLog(@"%@", identifier);
	if ([identifier isEqualToString:@"backFromView2"]) {
		return [UIStoryboardSegue segueWithIdentifier:identifier source:fromViewController destination:toViewController performHandler:^(){
			[self popToViewController:toViewController animated:NO];
		}];
	}
	else if ([identifier isEqualToString:@"backFromView3"]) {
		return [UIStoryboardSegue segueWithIdentifier:identifier source:fromViewController destination:toViewController performHandler:^(){
			[self popToViewController:toViewController animated:YES];
		}];
	}
	return [UIStoryboardSegue segueWithIdentifier:identifier source:fromViewController destination:toViewController performHandler:^(){
		[self popToViewController:toViewController animated:YES];
	}];
}

@end
