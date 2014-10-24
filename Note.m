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
    return [self initWithNoteTitle:@"" withNoteBody:@"" withNoteImage:nil];
}

-(instancetype)initWithNoteTitle:(NSString *)noteTitle withNoteBody:(NSString *)noteBody withNoteImage:(UIImage *)noteImage{
    
    self = [super init];
    if(self){
        _noteTitle = noteTitle;
        _noteBody = noteBody;
        _noteImage = noteImage;
    }
    if(!self)
    {
        NSLog(@"This is null.  wth");
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.noteTitle forKey:NSStringFromSelector(@selector(noteTitle))];
    [aCoder encodeObject:self.noteBody forKey:NSStringFromSelector(@selector(noteTitle))];
    [aCoder encodeObject:self.noteImage forKey:NSStringFromSelector(@selector(noteImage))];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.noteTitle = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(noteTitle))];
        self.noteBody = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(noteBody))];
        self.noteImage = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(noteImage))];
    }
    return self;
}

@end

