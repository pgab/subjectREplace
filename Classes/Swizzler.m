#import <objc/runtime.h>
#import "Swizzler.h"

#define SWIZZLE_PREFIX_STRING @"subjectReplace_"
#define SWIZZLE_PREFIX_LENGTH 15


@implementation subjectReplace_Swizzler

+ (void) setSuperclassOf: (NSString*) aStr toClass: (NSString*) bStr {
    Class aClass = NSClassFromString(aStr);
    Class bClass = NSClassFromString(bStr);

    class_setSuperclass(aClass, bClass);
}

+ (void) extendClass: (NSString*) aStr withClass: (NSString*) bStr {
    Class aClass = NSClassFromString(aStr);
    Class bClass = NSClassFromString(bStr);

    uint methodCount, i;
    Method* bMethods = class_copyMethodList(bClass, &methodCount);

    for (i = 0; i < methodCount; i++) {
        Method bMethod = bMethods[i];
        SEL bSel = method_getName(bMethod);

        class_addMethod(aClass, bSel,
                        method_getImplementation(bMethod),
                        method_getTypeEncoding(bMethod));

        bStr = NSStringFromSelector(bSel);

        if ([bStr hasPrefix: SWIZZLE_PREFIX_STRING]) {
            aStr = [bStr substringFromIndex: SWIZZLE_PREFIX_LENGTH];
            SEL aSel = NSSelectorFromString(aStr);

            method_exchangeImplementations(class_getInstanceMethod(aClass, aSel),
                                           class_getInstanceMethod(aClass, bSel));
        }
    }
    free(bMethods);
}

@end
