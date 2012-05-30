@interface subjectReplace_Swizzler : NSObject

+ (void) setSuperclassOf: (NSString*) aStr toClass: (NSString*) bStr;
+ (void) extendClass: (NSString*) aStr withClass: (NSString*) bStr;

@end
