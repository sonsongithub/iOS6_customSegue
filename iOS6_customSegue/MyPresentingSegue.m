//
//  MyPresentingSegue.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/20.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "MyPresentingSegue.h"
#import <QuartzCore/QuartzCore.h>

@implementation MyPresentingSegue

- (void)perform {
	NSLog(@"MyPresentingSegue - perform");
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
}

@end
