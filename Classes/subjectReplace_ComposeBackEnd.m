#import "subjectReplace_ComposeBackEnd.h"
#import "Swizzler.h"



@implementation subjectReplace_ComposeBackEnd



+ (void) load {
   [subjectReplace_Swizzler extendClass: @"ComposeBackEnd"
                   withClass: @"subjectReplace_ComposeBackEnd"];
	
}



- (void)subjectReplace__continueToSetupContentsForView:(id)arg1 withParsedMessages:(id)arg2 {
	[self subjectReplace__continueToSetupContentsForView:arg1 withParsedMessages:arg2];

	
	
	NSString* s = [self subject];
	
	
	 
	// need osx >=10.7 :(
	/*NSError *error = NULL;
	NSRegularExpression *regex = [NSRegularExpression         
								  regularExpressionWithPattern:@"((AW)\\w+:)+"
								  options:NSRegularExpressionCaseInsensitive
								  error:&error];*/
	// retrieve the current class			
	Class class = NSClassFromString(@"subjectReplace_ComposeBackEnd");
	// get the bundle for the class otherwise we have the mail bundle and won't find ours
	NSBundle * bdl = [NSBundle bundleForClass:class];
	// lets retrieve all the string we want to replace
	NSArray * arr = [bdl objectForInfoDictionaryKey:@"StringsToREplace"];
	
	// loop over the array
	for(int i=0; i<[arr count];++i)
	{
		// do the actual replacing
		s = [s stringByReplacingOccurrencesOfString:(NSString *)[arr objectAtIndex:i] withString:@"Re" /*options:NSCaseInsensitiveSearch range:NSMakeRange(0, 2)*/];
	}
	
	// improve me here
	NSString* k = [s stringByReplacingOccurrencesOfString:@"Re: Re:" withString:@"Re:"];
	
	// just tell the audience that it works
	NSLog(k);
	
	// this updates the subject, but how the heck the gui?
	[self setSubject:k];
}



@end
