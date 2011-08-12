//
//  FindReplaceAction.h
//  FileDo
//
//  Created by Mobile Dev on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Action.h"

@interface FindReplaceAction : NSViewController <Action> {
@private
    
}

@property (nonatomic,retain) IBOutlet NSTextField *findField;
@property (nonatomic,retain) IBOutlet NSTextField *replaceField;
@property (nonatomic,retain) IBOutlet NSButton *regexButton;
@property (nonatomic,retain) IBOutlet NSButton *caseSensitiveButton;

@end
