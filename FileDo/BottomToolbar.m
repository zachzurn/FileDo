//
//  BottomToolbar.m
//  FileDo
//
//  Created by Mobile Dev on 8/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BottomToolbar.h"


@implementation BottomToolbar

- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        NSLog(@"Setting Image");
        NSImage *image = [NSImage imageNamed:@"bottom-bar-bg.png"];
        [self setImage:image];
        
        [self setImageScaling:NSImageScaleAxesIndependently];
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end
