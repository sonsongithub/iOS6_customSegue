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


CAAnimation* sizeAnimationForViewAndRatio(UIView *targetView, float width_ratio, float height_ratio) {
	// size
	CAKeyframeAnimation *sizeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
	sizeAnimation.values = [NSArray arrayWithObjects:
							[NSNumber numberWithFloat:1],
							[NSNumber numberWithFloat:1],
							[NSNumber numberWithFloat:width_ratio],
							nil];
	sizeAnimation.keyTimes = [NSArray arrayWithObjects:
							  [NSNumber numberWithFloat:0],
							  [NSNumber numberWithFloat:0.8],
							  [NSNumber numberWithFloat:1],
							  nil];
	return sizeAnimation;
}

CAAnimation* sizeAnimationForView(UIView *targetView) {
	return sizeAnimationForViewAndRatio(targetView, 0.4, 0.4);
}

CAAnimation* rotateAnimationForView(UIView *targetView) {
	
	// rotation
	CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
	rotateAnimation.values = [NSArray arrayWithObjects:
							  [NSNumber numberWithFloat:0],
							  [NSNumber numberWithFloat:0.1],
							  [NSNumber numberWithFloat:0.2],
							  nil];
	rotateAnimation.keyTimes = [NSArray arrayWithObjects:
								[NSNumber numberWithFloat:0],
								[NSNumber numberWithFloat:0.8],
								[NSNumber numberWithFloat:1],
								nil];
	return rotateAnimation;
}

- (void)perform {
	NSLog(@"MyDismissingSegue - perform");
	[self.sourceViewController dismissViewControllerAnimated:NO
	 												  completion:nil];
//	// Obtain visible view from source view controller.
////	UIView *sourceView = ((UIViewController*)self.sourceViewController).view;
////	CGRect sourceScreenRect = sourceView.frame;
//	
//	UIView *destinationView = ((UIViewController*)self.destinationViewController).view;
//	CGRect destinationScreenRect = destinationView.frame;
//	
//	UIImage *sourceViewImage = nil;
//	UIImage *destinationViewImage = nil;
//	
//	// Create UIImage from source view controller's view.
////	{
////		UIGraphicsBeginImageContextWithOptions(sourceScreenRect.size, NO, 0);
////		CGContextRef ctx = UIGraphicsGetCurrentContext();
////		[[UIColor blackColor] set];
////		CGContextFillRect(ctx, sourceScreenRect);
////		CGContextScaleCTM(ctx, 1, 1);
////		CGContextTranslateCTM(ctx, 0, 0);
////		[sourceView.layer renderInContext:ctx];
////		sourceViewImage = UIGraphicsGetImageFromCurrentImageContext();
////		[UIImageJPEGRepresentation(sourceViewImage, 1) writeToFile:@"/Users/sonson/Desktop/sourceViewImage" atomically:NO];
////	}
//	{
//		UIGraphicsBeginImageContextWithOptions(destinationScreenRect.size, NO, 0);
//		CGContextRef ctx = UIGraphicsGetCurrentContext();
//		[[UIColor blackColor] set];
//		CGContextFillRect(ctx, destinationScreenRect);
//		CGContextScaleCTM(ctx, 1, 1);
//		CGContextTranslateCTM(ctx, 0, 0);
//		[destinationView.layer renderInContext:ctx];
//		destinationViewImage = UIGraphicsGetImageFromCurrentImageContext();
//		[UIImageJPEGRepresentation(destinationViewImage, 1) writeToFile:@"/Users/sonson/Desktop/destinationViewImage.jpg" atomically:NO];
//	}
//	
////	// Add UIImageView which renders UIImage of source view controller's view.
////	UIImageView *sourceViewImageView = [[UIImageView alloc] initWithImage:sourceViewImage];
////	UIImageView *destinationViewImageView = [[UIImageView alloc] initWithImage:destinationViewImage];
////	[sourceView addSubview:destinationViewImageView];
//	
//	
//	[[self sourceViewController] dismissViewControllerAnimated:NO completion:^(void){
//	}];
//	
//	[UIView animateWithDuration:1
//					 animations:^(void){
//					 }
//					 completion:^(BOOL completed){
//					 }];
////	void (^completionMethod)()
////	= ^() {
////		
//////		CAAnimation *sizeAnimation = sizeAnimationForView(sourceViewImageView);
//////		CAAnimation *rotateAnimation = rotateAnimationForView(sourceViewImageView);
//////		
//////		// make group
//////		CAAnimationGroup *group = [CAAnimationGroup animation];
//////		group.animations = [NSArray arrayWithObjects:sizeAnimation, rotateAnimation, nil];
//////		group.duration = 0.8;
//////		group.removedOnCompletion = YES;
//////		group.fillMode = kCAFillModeForwards;
//////		group.delegate = self;
//////		
//////		// set context
//////		[group setValue:sourceViewImageView forKey:@"context"];
//////		
//////		// commit animation
//////		[sourceViewImageView.layer addAnimation:group forKey:@"hoge"];
////		
////	};
////	
////	[self.sourceViewController dismissViewControllerAnimated:NO
////												  completion:completionMethod];
}

@end
