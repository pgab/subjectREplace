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