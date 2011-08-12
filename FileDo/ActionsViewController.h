//
//  ActionsViewController.h
//  FileDo
//
//  Created by Mobile Dev on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Action.h"

@interface ActionsViewController : NSViewController <actionViewDelegate> {
@private
    NSMutableArray *_actions;
}

@end
