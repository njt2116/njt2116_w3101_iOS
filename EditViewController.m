
//  EditViewController.m
//  LucyList
//
//  Created by Nancy  Thornton on 10/23/14.
//  Copyright (c) 2014 Nancy  Thornton. All rights reserved.
//

#import "EditViewController.h"
#import <UIKit/UIKit.h>
#import "NoteDataStore.h"
#import <MessageUI/MessageUI.h>



@interface EditViewController ()

@property (strong, nonatomic) IBOutlet UITextView *noteBodyTextView;
@property (strong, nonatomic) IBOutlet UITextField *noteTitleTextField;
@property (strong, nonatomic) IBOutlet UIImageView *noteImageView;
@property (strong, nonatomic) IBOutlet UILabel *createNoteTimeStamp;


@end

@implementation EditViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateButtons];
    self.dataStore = [NoteDataStore sharedNoteDataStore];
    self.noteTitleTextField.text = [self.currentNote noteTitle];
    self.noteBodyTextView.text = [self.currentNote noteBody];
    self.noteImageView.image = [self.currentNote noteImage];
    NSString *textStamp = [self.currentNote noteCreateDate];
    if(textStamp!= NULL){
        self.createNoteTimeStamp.text = [NSString stringWithFormat:@"%@%@", self.createNoteTimeStamp.text, textStamp];
            NSLog(@"%@", self.createNoteTimeStamp.text);
            NSLog(@"%@", textStamp);
    }
}



-(IBAction)saveNoteToDataStoreWithInfoFromViewController:(id)sender{
    
    NSString *currTitle = self.noteTitleTextField.text;
    NSString *currText = self.noteBodyTextView.text;
    UIImage *currImage = self.noteImageView.image;
    if(self.currentNote){
        self.currentNote.noteTitle = currTitle;
        self.currentNote.noteBody = currText;
        self.currentNote.noteImage = currImage;
    }
    else
    {
        [self.dataStore createNoteWithTitle:currTitle withNoteBody:currText withNoteImage:currImage withNoteCreateDate:_timeStampString];
    }
    [self.dataStore saveNoteArray];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)generateButtons {
    
    UIBarButtonItem  *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNoteToDataStoreWithInfoFromViewController:)];
    
    UIBarButtonItem *emailButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(emailNote:)];
    
    UIBarButtonItem *addPicButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem: UIBarButtonSystemItemCamera target:self action:@selector(addPic:)];
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:saveButton,emailButton, addPicButton, nil] animated:YES];
}

/* Email the note and associated info */
-(IBAction)emailNote:(id)sender{
    if([MFMailComposeViewController canSendMail]){
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc]init];
        mail.mailComposeDelegate = self;
        
        /*add the LucyNote values to be sent in the email*/
        [self presentViewController:mail animated:YES completion:NULL];
        [mail setMessageBody:(self.currentNote.noteBody) isHTML:NO];/*sets the message body to the note body*/
        [mail setSubject: (self.currentNote.noteTitle)]; /*sets the subject line to the note line*/
        [mail addAttachmentData:UIImagePNGRepresentation(self.currentNote.noteImage) mimeType: @"image/png" fileName: self.currentNote.noteTitle];/*adds the note Image to the email as an attachment. */
    }
    else
        NSLog(@"Can't send mail...the device will not support it.");
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if(result){
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
    else
    {
        switch (result)
        {
            case MFMailComposeResultCancelled: NSLog(@"Mail cancelled");
                break;
            case MFMailComposeResultSaved: NSLog(@"Mail saved");
                break;
            case MFMailComposeResultSent: NSLog(@"Mail sent");
                break;
            case MFMailComposeResultFailed: NSLog(@"Mail sent failure: %@", [error localizedDescription]);
                break;
            default:
                break;
        }
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}


/* Add an image to the note */
-(IBAction)addPic:(id)sender{
    UIImagePickerController *noteImagePick = [[UIImagePickerController alloc]init];
    noteImagePick.delegate = self;
    noteImagePick.allowsEditing = YES;
    noteImagePick.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:(noteImagePick) animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [self.currentNote setNoteImage:chosenImage];
    self.noteImageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
