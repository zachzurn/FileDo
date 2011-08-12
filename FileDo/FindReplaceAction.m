//
//  FindReplaceAction.m
//  FileDo
//
//  Created by Mobile Dev on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FindReplaceAction.h"


@implementation FindReplaceAction

@synthesize findField,replaceField,regexButton,caseSensitiveButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(NSString *)runActionOnString:(NSString *)string
{
    //Create the action
    return @"";
}

- (void)dealloc
{
    [super dealloc];
}

@end
