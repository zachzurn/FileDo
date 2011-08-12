//
//  Action.h
//  FileDo
//
//  Created by Mobile Dev on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@protocol actionViewDelegate <NSObject>

-(void)removeActionPanel:(id)sender;
-(void)moveActionPanelRight:(id)sender;
-(void)moveActionPanelLeft:(id)sender;

@end

@protocol Action <NSObject>

-(NSString *)runActionOnString:(NSString *)string;

@end