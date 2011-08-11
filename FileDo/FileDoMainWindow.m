//
//  FileDoMainWindow.m
//  FileDo
//
//  Created by Mobile Dev on 8/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FileDoMainWindow.h"




@implementation FileDoMainWindow

@synthesize filesTable, introText, introActionsText;

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

-(IBAction)addFilesToList:(id)sender
{
    int i;
    
    NSOpenPanel *openDialog = [NSOpenPanel openPanel];
    
    [openDialog setCanChooseFiles:YES];
    [openDialog setCanChooseDirectories:YES];
    
    if([openDialog runModalForDirectory:nil file:nil] == NSOKButton)
    {
        NSArray *files = [openDialog filenames];
        
        for(i = 0; i < [files count]; i++)
        {
            NSString *filePath = [files objectAtIndex:i];
            
            //Do stuff
        }
    }
}

-(IBAction)removeSelectedFilesFromList:(id)sender
{
    NSIndexSet *selectedRows = [filesTable selectedRowIndexes];
    
    NSUInteger rowCount = [_filePaths count];
    
    //Remove items in the selection index
    for(int i = 0; i < rowCount; i++)
    {
        if([selectedRows containsIndex:i])
        {
            [_filePaths removeObjectAtIndex:i];
            [_newFilePaths removeObjectAtIndex:i];
        }
    }
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
    NSUInteger rowCount = [_filePaths count];
    
    if(rowCount != 0)
    {
        [introText setAlphaValue:0.0];
        [introActionsText setAlphaValue:1.0];
    }
    else 
    {    
        [introText setAlphaValue:1.0];
        [introActionsText setAlphaValue:0.0];
    }
    
    return rowCount;
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
