//
//  NoteDataStore.h
//  LucyList
//
//  Created by Nancy  Thornton on 10/22/14.
//  Copyright (c) 2014 Nancy  Thornton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NoteDataStore : NSObject

+(instancetype) sharedNoteDataStore;

@property (strong, nonatomic) NSMutableArray *notesArray;

-(void)createNoteWithTitle: (NSString *)noteTitle withNoteBody: (NSString *)noteBody withNoteImage:(UIImage *)noteImage withNoteCreateDate:(NSString *)noteCreateDate;

-(void)unarchiveNoteArray;

-(void)saveNoteArray;




@end
