#import "subjectReplace_ComposeBackEnd.h"
#import "Swizzler.h"


@implementation subjectReplace_ComposeBackEnd

//@synthesize subject;

+ (void) load {
   [subjectReplace_Swizzler extendClass: @"ComposeBackEnd"
                   withClass: @"subjectReplace_ComposeBackEnd"];
	
}


//@property(retain) NSString *subject;

- (void)subjectReplace_setupContentsForView:(id)arg1 {
	[self subjectReplace_setupContentsForView:arg1];
	NSLog(@"called");
	[self setSubject:@"changed"];
}



@end
