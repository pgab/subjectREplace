//    Copyright (C) 2012 paul gabriel paul.gabriel@giga-infosystems.com
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
