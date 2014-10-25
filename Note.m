//
//  Note.m
//  LucyList
//
//  Created by Nancy  Thornton on 10/23/14.
//  Copyright (c) 2014 Nancy  Thornton. All rights reserved.
//

#import "Note.h"
#import <UIKit/UIKit.h>

@implementation Note

-(instancetype)init{
    return [self initWithNoteTitle:@"" withNoteBody:@"" withNoteImage:nil withNoteCreateDate:nil];
}

-(instancetype)initWithNoteTitle:(NSString *)noteTitle withNoteBody:(NSString *)noteBody withNoteImage:(UIImage *)noteImage withNoteCreateDate:(NSString *)noteCreateDate{
    
    self = [super init];
    if(self){
        _noteTitle = noteTitle;
        _noteBody = noteBody;
        _noteImage = noteImage;
        _noteCreateDate = noteCreateDate;
        
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.noteTitle forKey:NSStringFromSelector(@selector(noteTitle))];
    [aCoder encodeObject:self.noteBody forKey:NSStringFromSelector(@selector(noteBody))];
    [aCoder encodeObject:self.noteImage forKey:NSStringFromSelector(@selector(noteImage))];
    [aCoder encodeObject:self.noteCreateDate forKey:NSStringFromSelector(@selector(noteCreateDate))];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.noteTitle = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(noteTitle))];
        self.noteBody = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(noteBody))];
        self.noteImage = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(noteImage))];
        self.noteCreateDate = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(noteCreateDate))];
    }
    return self;
}

@end

