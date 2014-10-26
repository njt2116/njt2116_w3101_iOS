//
//  NoteTableViewController.m
//  LucyList
//
//  Created by Nancy  Thornton on 10/23/14.
//  Copyright (c) 2014 Nancy  Thornton. All rights reserved.
//

#import "NoteTableViewController.h"
#import "NoteDataStore.h"
#import "Note.h"
#import "TableViewCell.h"
#import "EditViewController.h"

@interface NoteTableViewController ()

@end

@implementation NoteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataStore = [NoteDataStore sharedNoteDataStore];



- (void) viewWillAppear{
    
    [self.tableView reloadData];
    //[self.tableView reloadInputViews];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataStore.notesArray count];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.dataStore.notesArray removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
    [self.tableView reloadInputViews];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:(@"noteCell")];
    
        if(cell == nil)
        {
            cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"noteCell"];
        }
    
        Note *noteAtRow = self.dataStore.notesArray[indexPath.row];
        UIImage *image = noteAtRow.noteImage;
        cell.noteCellImage.image = image;
        cell.noteCellLabel.text = noteAtRow.noteTitle;
        return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

-(void)prepareForSegue:(UIStoryboardSegue *)
            segue sender:(id)sender {
    
    EditViewController *cellSelectionSegueDestination = segue.destinationViewController;
    NSIndexPath *cellSelectionPathIndex = [self.tableView indexPathForSelectedRow];
    
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy hh:mma"];
    NSString *resultString = [dateFormatter stringFromDate: currentTime];
    NSLog(@"@%", resultString);
    if([segue.identifier isEqualToString:@"addNote"])
    {
        cellSelectionSegueDestination.timeStampString = resultString;
        cellSelectionSegueDestination.currentNote = nil;
    }
    else
    {
        cellSelectionSegueDestination.currentNote = self.dataStore.notesArray[cellSelectionPathIndex.row];
    }
}
@end
