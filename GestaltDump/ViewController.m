//
//  ViewController.m
//  GestaltDump
//
//  Created by Ortwin Gentz on 26.11.18.
//  Copyright © 2018 FutureTap GmbH. All rights reserved.
//

#import "ViewController.h"
#import "GestaltKeys.h"

CFPropertyListRef MGCopyAnswer(CFStringRef property);

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];

	NSUInteger i = 0;
	struct tKeyMapping element;
	
	do {
		element = keyMappingTable[i];
		if (element.key) {
			NSString *key = [NSString stringWithUTF8String:element.key];
			id result = (__bridge id)MGCopyAnswer((__bridge CFStringRef)key);
			NSLog(@"%@: %@", key, result);
			self.textView.text = [self.textView.text stringByAppendingFormat:@"%@: %@\n", key, result];
		}
		i++;
	} while (element.obfuscatedKey != nil);
}

@end
