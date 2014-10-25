//
//  Note.h
//  LucyList
//
//  Created by Nancy  Thornton on 10/23/14.
//  Copyright (c) 2014 Nancy  Thornton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Note : NSObject

@property (strong, nonatomic) NSString *noteTitle;
@property (strong, nonatomic) NSString *noteBody;
@property (strong, nonatomic) UIImage *noteImage;
@property (strong, nonatomic) NSString *noteCreateDate;

-(instancetype)initWithNoteTitle:(NSString *)noteTitle withNoteBody:(NSString *)noteBody withNoteImage:(UIImage *)noteImage withNoteCreateDate:(NSString *)noteCreateDate;



@end
