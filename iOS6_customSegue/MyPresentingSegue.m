//
//  MyPresentingSegue.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/20.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "MyPresentingSegue.h"
#import <QuartzCore/QuartzCore.h>

#define USE_CORE_ANIMATION		1
#define USE_UIVIEW_ANIMATION	1
#define USE_UIIMAGE				1

@implementation MyPresentingSegue

- (void)perform {
	NSLog(@"MyPresentingSegue - perform");

#if USE_CORE_ANIMATION
	UIView *sourceView = ((UIViewController*)self.sourceViewController).view;
	UIView *destinationView = ((UIViewController*)self.destinationViewController).view;
	[sourceView addSubview:destinationView];
	
	CAKeyframeAnimation *sizeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
	sizeAnimation.values = @[@(0), @(1)];
	sizeAnimation.keyTimes = @[@(0), @(1)];
	
	CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
	rotateAnimation.values = @[@(M_PI*2), @(0)];
	rotateAnimation.keyTimes = @[@(0), @(1)];
	
	
	// make group
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.animations = [NSArray arrayWithObjects:sizeAnimation, rotateAnimation, nil];
	group.duration = 0.4;
	group.removedOnCompletion = NO;
	group.fillMode = kCAFillModeForwards;
	group.delegate = self;
	
	// set context
	[group setValue:destinationView forKey:@"context"];
	
	// commit animation
	[destinationView.layer addAnimation:group forKey:@"hoge"];
#elif USE_UIVIEW_ANIMATION
	void (^completionMethod)()
	= ^() {
		NSLog(@"MyPresentingSegue - completionMethod");
		UIView *sourceView = ((UIViewController*)self.sourceViewController).view;
		UIView *destinationView = ((UIViewController*)self.destinationViewController).view;
		
		// Start animating
		[UIView animateWithDuration:0.2
						 animations:^(void) {
							 [destinationView addSubview:sourceView];
							 CGRect r = destinationView.frame;
							 r.origin.y = -r.size.height;
							 sourceView.frame = r;
						 }
						 completion:^(BOOL finished) {
							 // Remove UIImageView after animation finished.
							 [sourceView removeFromSuperview];
						 }];
	};
	// Start transition
	[self.sourceViewController presentViewController:self.destinationViewController
											animated:NO
										  completion:completionMethod];

#elif USE_UIIMAGE
	void (^completionMethod)()
	= ^() {
		NSLog(@"MyPresentingSegue - completionMethod");
		// Obtain visible view from source view controller.
		UIView *sourceView = ((UIViewController*)self.sourceViewController).view;
		CGRect screenRect = sourceView.frame;
		
		// Create UIImage from source view controller's view.
		UIGraphicsBeginImageContextWithOptions(screenRect.size, NO, 0);
		CGContextRef ctx = UIGraphicsGetCurrentContext();
		[[UIColor blackColor] set];
		CGContextFillRect(ctx, screenRect);
		CGContextScaleCTM(ctx, 1, 1);
		CGContextTranslateCTM(ctx, 0, 0);
		[sourceView.layer renderInContext:ctx];
		UIImage *sourceViewImage = UIGraphicsGetImageFromCurrentImageContext();
		
		// Add UIImageView which renders UIImage of source view controller's view.
		UIImageView *sourceViewImageView = [[UIImageView alloc] initWithImage:sourceViewImage];
		UIView *destinationView = ((UIViewController*)self.destinationViewController).view;
		[destinationView addSubview:sourceViewImageView];
		
		// Start animating
		[UIView animateWithDuration:0.2
						 animations:^(void) {
							 CGRect r = sourceViewImageView.frame;
							 r.origin.y = -r.size.height;
							 sourceViewImageView.frame = r;
						 }
						 completion:^(BOOL finished) {
							 // Remove UIImageView after animation finished.
							 [sourceViewImageView removeFromSuperview];
						 }];
	};
	// Start transition
	[self.sourceViewController presentViewController:self.destinationViewController
											animated:NO
										  completion:completionMethod];
#endif
}

#if USE_CORE_ANIMATION

-(void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)finished {
	id context = [theAnimation valueForKey:@"context"];
	[context removeFromSuperview];
	[self.sourceViewController presentViewController:self.destinationViewController
											animated:NO
										  completion:nil];
}

#endif

@end
