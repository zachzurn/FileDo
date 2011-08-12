//
//  ActionsViewController.m
//  FileDo
//
//  Created by Mobile Dev on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ActionsViewController.h"
#import "FindReplaceAction.h"


@implementation ActionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)addAction:(int)actionIdentifier
{
    if(!_actions) _actions = [[NSMutableArray alloc] init];
    
    //Add the action to an actions array and add the view to the proper place
    switch (actionIdentifier) {
        case 0:
            //
            break;
        case 1:
            //
            break;
        case 2:
            //
            break;
    }
}

-(NSString*)processString:(NSString*)string
{
    //Process the string
    return @"";
}

- (void)dealloc
{
    [super dealloc];
}


-(void)removeActionPanel:(id)sender
{
    
}

-(void)moveActionPanelRight:(id)sender
{
    
}
-(void)moveActionPanelLeft:(id)sender
{
    
}

@end
