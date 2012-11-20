//
//  MyPresentingSegue.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/20.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "MyPresentingSegue.h"

@implementation MyPresentingSegue

- (void)perform {
	[self.sourceViewController presentViewController:self.destinationViewController animated:YES completion:nil];
}

@end
