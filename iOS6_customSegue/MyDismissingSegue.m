//
//  MyDismissingSegue.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/20.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "MyDismissingSegue.h"

#import <QuartzCore/QuartzCore.h>

@implementation MyDismissingSegue

-(void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)finished {
	id context = [theAnimation valueForKey:@"context"];
	[context removeFromSuperview];
}

- (void)perform {
	NSLog(@"MyDismissingSegue - perform");
	
	void (^completionMethod)()
	= ^() {
		UIView *sourceView = ((UIViewController*)self.sourceViewController).view;
		UIView *destinationView = ((UIViewController*)self.destinationViewController).view;
		
		[destinationView addSubview:sourceView];
		
		CAKeyframeAnimation *sizeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
		sizeAnimation.values = @[@(1), @(0)];
		sizeAnimation.keyTimes = @[@(0), @(1)];
		
		CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
		rotateAnimation.values = @[@(0), @(M_PI*2)];
		rotateAnimation.keyTimes = @[@(0), @(1)];
		
		
		// make group
		CAAnimationGroup *group = [CAAnimationGroup animation];
		group.animations = [NSArray arrayWithObjects:sizeAnimation, rotateAnimation, nil];
		group.duration = 0.4;
		group.removedOnCompletion = NO;
		group.fillMode = kCAFillModeForwards;
		group.delegate = self;
		
		// set context
		[group setValue:sourceView forKey:@"context"];
		
		// commit animation
		[sourceView.layer addAnimation:group forKey:@"hoge"];
	};
	
	[self.sourceViewController dismissViewControllerAnimated:NO
												  completion:completionMethod];
}

@end
