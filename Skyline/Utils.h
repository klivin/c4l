//
//  Utils.h
//  BabyPool
//
//  Created by Kevin Weiler on 11/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//



@interface Utils : NSObject {
}
+ (BOOL) validateEmail: (NSString *) candidate;
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;
// Need Date formatter for guessdate that goes to seconds..
// Must present date in form Jan 4, 1904 3:24:33 PM
+ (NSDateFormatter*) mediumDateFormatter;
// Must present date in form Jan 4, 1904 3:24 PM
+ (NSDateFormatter*) shortDateFormatter;
// Must present date in form Jan 4, 1904
+ (NSDateFormatter*) dateOnlyFormatter;
+ (NSDateFormatter*) timeOnlyFormatter;

@end

@interface NSString (Escaping)
- (NSString*)stringWithPercentEscape;
@end