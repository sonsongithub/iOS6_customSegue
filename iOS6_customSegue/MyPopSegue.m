//
//  MyPopSegue.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/21.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "MyPopSegue.h"

@implementation MyPopSegue

- (void)perform {
	UIViewController* source = self.sourceViewController;
	[source.navigationController popToViewController:self.destinationViewController
											animated:NO];
}

@end
