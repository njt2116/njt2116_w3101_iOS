
//  EditViewController.m
//  LucyList
//
//  Created by Nancy  Thornton on 10/23/14.
//  Copyright (c) 2014 Nancy  Thornton. All rights reserved.
//

#import "EditViewController.h"
#import <UIKit/UIKit.h>
#import "NoteDataStore.h"



@interface EditViewController ()

@property (strong, nonatomic) IBOutlet UITextView *noteBodyTextView;
@property (strong, nonatomic) IBOutlet UITextField *noteTitleTextField;
@property (strong, nonatomic) IBOutlet UIImageView *noteImageView;

@end

@implementation EditViewController

- (void)generateButtons {
    // Do any additional setup after loading the view.
    UIBarButtonItem  *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNoteToDataStoreWithInfoFromViewController:)];
    
    UIBarButtonItem *emailButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(emailNote:)];
    
    UIBarButtonItem *addPicButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem: UIBarButtonSystemItemCamera target:self action:@selector(addPic:)];
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:saveButton,emailButton, addPicButton, nil] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateButtons];
    self.dataStore = [NoteDataStore sharedNoteDataStore];
}



-(IBAction)saveNoteToDataStoreWithInfoFromViewController:(id)sender{
    NSLog(@"saveNoteToDataStoreWithInfoFromViewController was clicked");
    NSString *currTitle = self.noteTitleTextField.text;
    NSLog(@"%@", currTitle);
    NSString *currText = self.noteBodyTextView.text;
    UIImage *currImage = self.noteImageView.image;
    if(self.currentNote){
        self.currentNote.noteTitle = currTitle;
        self.currentNote.noteBody = currText;
        self.currentNote.noteImage = currImage;
    }
    else
    {
        [self.dataStore createNoteWithTitle:currTitle withNoteBody:currText withNoteImage:currImage];
    }
    [self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)emailNote:(id)sender{
    NSLog(@"emailNote was clicked");
}

-(IBAction)addPic:(id)sender{
    NSLog(@"addPic was clicked");
}

@end
