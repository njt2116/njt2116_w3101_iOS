//
//  NoteDataStore.m
//  LucyList
//
//  Created by Nancy  Thornton on 10/22/14.
//  Copyright (c) 2014 Nancy  Thornton. All rights reserved.
//

#import "NoteDataStore.h"
#import "Note.h"


@implementation NoteDataStore

+ (instancetype) sharedNoteDataStore{
    static NoteDataStore *_sharedNoteDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedNoteDataStore = [[NoteDataStore alloc]init];
        
    });
    return _sharedNoteDataStore;
}

-(instancetype)init
{
    if(self = [super init])
    {
        _notesArray = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)createNoteWithTitle:(NSString *)noteTitle
              withNoteBody:(NSString *)noteBody
             withNoteImage:(UIImage *)noteImage
        withNoteCreateDate:(id)noteCreateDate{
            Note *newNote = [[Note alloc]initWithNoteTitle:noteTitle
                                              withNoteBody:noteBody
                                             withNoteImage:noteImage
                                        withNoteCreateDate:noteCreateDate];
    [self.notesArray addObject:newNote];
}


-(void)saveNoteArray{
    NSData *savedNotesArray = [NSKeyedArchiver archivedDataWithRootObject:_notesArray];
    NSString *fullPath = [self defaultPathVal];
    [savedNotesArray writeToFile:fullPath atomically:YES];
}


-(NSString *)defaultPathVal {
    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *uniquePath = @"LucyListNotes";
    NSString *fullPath = [docsPath stringByAppendingPathComponent:uniquePath];
    return fullPath;
}

-(void)unarchiveNoteArray{
    NSString *fullPath = [self defaultPathVal];
    NSData  *unarchivedData = [[NSData alloc]initWithContentsOfFile:fullPath];
    _notesArray = [NSKeyedUnarchiver unarchiveObjectWithData:unarchivedData];
}



@end
