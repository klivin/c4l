//
//  SkylineAppDelegate.h
//  Skyline
//
//  Created by Kevin Weiler on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SkylineViewController;

@interface SkylineAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SkylineViewController *viewController;

@end
