//
//  Utils.m
//  BabyPool
//
//  Created by Kevin Weiler on 11/14/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Utils.h"


@implementation Utils


+ (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
	
    return [emailTest evaluateWithObject:candidate];

}

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert  
{  
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];  
	
    // String should be 6 or 8 characters  
    if ([cString length] < 6) return [UIColor clearColor];  
	
    // strip 0X if it appears  
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];  
	
    if ([cString length] != 6) return [UIColor clearColor];  
	
    // Separate into r, g, b substrings  
    NSRange range;  
    range.location = 0;  
    range.length = 2;  
    NSString *rString = [cString substringWithRange:range];  
	
    range.location = 2;  
    NSString *gString = [cString substringWithRange:range];  
	
    range.location = 4;  
    NSString *bString = [cString substringWithRange:range];  
	
    // Scan values  
    unsigned int r, g, b;  
    [[NSScanner scannerWithString:rString] scanHexInt:&r];  
    [[NSScanner scannerWithString:gString] scanHexInt:&g];  
    [[NSScanner scannerWithString:bString] scanHexInt:&b];  
	
    return [UIColor colorWithRed:((float) r / 255.0f)  
                           green:((float) g / 255.0f)  
                            blue:((float) b / 255.0f)  
                           alpha:1.0f];  
}  

// Must present date in form Jan 4, 1904 3:24:33 PM
+ (NSDateFormatter*) mediumDateFormatter {
	NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setLocale:usLocale];
	[formatter setLenient:YES];
	[formatter setDateFormat:@"MMM d, yyyy h:mm:ss a"];
    [usLocale release];
	return formatter;
}

// Must present date in form Jan 4, 1904 3:24 PM
+ (NSDateFormatter*) shortDateFormatter {
	NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setLocale:usLocale];
	[formatter setLenient:YES];
	[formatter setDateFormat:@"MMM d, yyyy h:mm a"];
	//[formatter setDateFormat:@"%b %e, %Y %I:%M %p"];
    [usLocale release];
	return formatter;
}
// Must present date in form Jan 4, 1904
+ (NSDateFormatter*) dateOnlyFormatter {
	NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setLocale:usLocale];
	[formatter setLenient:YES];
	[formatter setDateFormat:@"MMM d, yyyy"];
    [usLocale release];
	return formatter;
}
// Must present date in form 3:24 PM
+ (NSDateFormatter*) timeOnlyFormatter {
	NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setLocale:usLocale];
	[formatter setLenient:YES];
	[formatter setDateFormat:@"h:mm a"];
    [usLocale release];
	return formatter;
}
@end

@implementation NSString (Escaping)
- (NSString*)stringWithPercentEscape {    
	//'()*+;@?\n\"<>#\t :/=,!$
    return [(NSString *) CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)[[self mutableCopy] autorelease], NULL, CFSTR("￼&"),kCFStringEncodingUTF8) autorelease];
}
@end