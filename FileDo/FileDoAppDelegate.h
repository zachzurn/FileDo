//
//  FileDoAppDelegate.h
//  FileDo
//
//  Created by Mobile Dev on 8/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FileDoAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
