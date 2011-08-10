//
//  FileDoMainWindow.m
//  FileDo
//
//  Created by Mobile Dev on 8/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FileDoMainWindow.h"




@implementation FileDoMainWindow

@synthesize filesTable;

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

-(void)awakeFromNib
{
    [self setup];
}

-(void)setup
{
    NSArray *dragTypes = [[NSArray alloc] initWithObjects:NSFilenamesPboardType, nil];
    [self registerForDraggedTypes:dragTypes];
    [dragTypes release];
    
    _filePaths = [[NSMutableArray alloc] init];
    _newFilePaths = [[NSMutableArray alloc] init];
    [filesTable setDataSource:self];
    
    [self setBackgroundColor:[NSColor blackColor]];
    
}

#pragma mark - IBActions
-(IBAction)runActions:(id)sender
{
    NSLog(@"Running Actions");
    //TODO run the file renaming actions
}

-(IBAction)clearList:(id)sender
{
    [_newFilePaths removeAllObjects];
    [_filePaths removeAllObjects];
    [filesTable reloadData];
}


#pragma mark - File path operations
-(void)updateNewFilePaths
{
    //Populate the other array
    [_newFilePaths release];
    _newFilePaths = [[NSMutableArray alloc] initWithArray:_filePaths copyItems:YES];
    
    [filesTable reloadData];
}

#pragma mark - Files Table
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [_filePaths count];
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSLog(@"%@",[tableColumn identifier]);
    
    if([[tableColumn identifier] isEqualToString:@"original"])
    {
        return [_filePaths objectAtIndex:row];
    }
    else if([[tableColumn identifier] isEqualToString:@"icon"])
    {
        return [[NSWorkspace sharedWorkspace] iconForFile:[_filePaths objectAtIndex:row]];
    }
    else if([[tableColumn identifier] isEqualToString:@"new"])
    {
        return [_newFilePaths objectAtIndex:row];        
    }
    else
    {
        return nil;
    }
}

#pragma mark - Drop Operations
-(NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender
{
    return NSDragOperationCopy;
}

-(NSDragOperation)draggingUpdated:(id<NSDraggingInfo>)sender
{
    return NSDragOperationCopy;
}

-(NSDragOperation)draggingEnded:(id<NSDraggingInfo>)sender
{
    return NSDragOperationCopy;
}

-(NSDragOperation)draggingExited:(id<NSDraggingInfo>)sender
{
    return NSDragOperationCopy;
}

-(BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender
{
    return YES;
}

-(BOOL)performDragOperation:(id<NSDraggingInfo>)sender
{
    NSArray *items = [[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType];
    
    for(int i = 0; i < [items count]; i++)
    {
        [_filePaths addObject:[items objectAtIndex:i]]; 
    }
    
    [self updateNewFilePaths];
    
    return YES;
}

#pragma mark - Dealloc
- (void)dealloc
{
    [super dealloc];
}

@end
