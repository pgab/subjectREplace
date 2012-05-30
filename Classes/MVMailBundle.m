#import "MVMailBundle.h"
#import "Swizzler.h"


@implementation subjectReplace_MVMailBundle

+ (void) initialize {
    [subjectReplace_Swizzler setSuperclassOf: @"subjectReplace_MVMailBundle"
									 toClass: @"MVMailBundle"];
    [self registerBundle];
}

- (id) init {
	NSLog(@"Loading subjectReplace");
	return self;
}

@end