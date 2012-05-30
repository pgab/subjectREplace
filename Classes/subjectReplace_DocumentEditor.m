

#import "subjectReplace_DocumentEditor.h"

#import "Swizzler.h"



@implementation subjectReplace_DocumentEditor



+ (void) load {
	[subjectReplace_Swizzler extendClass: @"MailDocumentEditor"
							   withClass: @"subjectReplace_DocumentEditor"];
	
}

- (id)subjectReplace_loadInitialDocument {

	NSString* s = [[self backEnd] subject];
	
	// need osx >=10.7 :(
	/*NSError *error = NULL;
	 NSRegularExpression *regex = [NSRegularExpression         
	 regularExpressionWithPattern:@"((AW)\\w+:)+"
	 options:NSRegularExpressionCaseInsensitive
	 error:&error];*/
	
	// retrieve the current class			
	Class class = NSClassFromString(@"subjectReplace_DocumentEditor");
	// get the bundle for the class otherwise we have the mail bundle and won't find ours
	NSBundle * bdl = [NSBundle bundleForClass:class];
	// lets retrieve all the string we want to replace
	NSArray * arr = [bdl objectForInfoDictionaryKey:@"StringsToREplace"];
	
	// loop over the array
	for(int i=0; i<[arr count];++i)
	{
		// do the actual replacing
		s = [s stringByReplacingOccurrencesOfString:[arr objectAtIndex:i] withString:@"Re:" /*options:NSCaseInsensitiveSearch range:NSMakeRange(0, 2)*/];
	}
	while ( [s rangeOfString:@"Re: Re:"].location != NSNotFound )
	{
		s = [s stringByReplacingOccurrencesOfString:@"Re: Re:" withString:@"Re:"];
	}
	
	
	arr = [bdl objectForInfoDictionaryKey:@"StringsToReplaceFWD"];
	// loop over the array
	for(int i=0; i<[arr count];++i)
	{
		// do the actual replacing
		s = [s stringByReplacingOccurrencesOfString:[arr objectAtIndex:i] withString:@"Fwd:" /*options:NSCaseInsensitiveSearch range:NSMakeRange(0, 2)*/];
	}
	
	
	while ( [s rangeOfString:@"Fwd: Fwd:"].location != NSNotFound )
	{
		s = [s stringByReplacingOccurrencesOfString:@"Fwd: Fwd:" withString:@"Fwd:"];
	}
	
	
	// this updates the subject
	[[self backEnd] setSubject:s];
	
	// call original method
	[self subjectReplace_loadInitialDocument];
	
}



@end
