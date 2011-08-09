//
//  FileDoAppDelegate.h
//  FileDo
//
//  Created by Mobile Dev on 8/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FileDoMainWindow.h"

@interface FileDoAppDelegate : NSObject <NSApplicationDelegate> {
@private
    FileDoMainWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
