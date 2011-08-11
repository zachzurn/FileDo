//
//  FileDoMainWindow.h
//  FileDo
//
//  Created by Mobile Dev on 8/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FileDoMainWindow : NSWindow <NSTableViewDataSource> {
@private
    NSMutableArray *_filePaths;
    NSMutableArray *_newFilePaths;
}

@property (nonatomic,retain) IBOutlet NSTableView *filesTable;
@property (nonatomic,retain) IBOutlet NSTextField  *introText;
@property (nonatomic,retain) IBOutlet NSTextField  *introActionsText;

-(IBAction)runActions:(id)sender;
-(IBAction)clearList:(id)sender;
-(void)setup;
-(void)updateNewFilePaths;

@end
