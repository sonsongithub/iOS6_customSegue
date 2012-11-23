//
//  MyPushSegue.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/21.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "MyPushSegue.h"

@implementation MyPushSegue

- (void)perform {
	UIViewController* source = self.sourceViewController;
	[source.navigationController pushViewController:self.destinationViewController
										   animated:NO];
}

@end
