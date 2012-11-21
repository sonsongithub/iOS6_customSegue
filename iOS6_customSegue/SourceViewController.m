//
//  SourceViewController.m
//  iOS6_customSegue
//
//  Created by sonson on 2012/11/20.
//  Copyright (c) 2012年 sonson. All rights reserved.
//

#import "SourceViewController.h"

@interface SourceViewController ()

@end

@implementation SourceViewController

//- (IBAction)open:(id)sender {
//	[self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"DestinationViewController"] animated:YES completion:nil];
//}

- (IBAction)close:(UIStoryboardSegue*)segue {	
}

- (void)viewDidLoad {
	NSLog(@"SourceViewController - viewDidLoad");
	[super viewDidLoad];
}

@end
