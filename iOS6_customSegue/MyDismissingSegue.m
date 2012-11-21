//
//  MyDismissingSegue.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/20.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "MyDismissingSegue.h"

@implementation MyDismissingSegue

- (void)perform {
	[self.sourceViewController dismissViewControllerAnimated:YES
												  completion:nil];
}

@end
