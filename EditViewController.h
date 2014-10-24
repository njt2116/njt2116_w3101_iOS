//
//  EditViewController.h
//  LucyList
//
//  Created by Nancy  Thornton on 10/23/14.
//  Copyright (c) 2014 Nancy  Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "NoteDataStore.h"

@interface EditViewController : UIViewController

@property (strong, nonatomic) Note *currentNote;
@property (strong, nonatomic) NoteDataStore *dataStore;

@end
