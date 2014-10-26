njt2116_w3101_iOS
=================
**please note:
Had many (rookie) git issues.  Was not posting to the remote git for some time, and then had complications after renaming
the repo.  All should be in order now.

LUCYLIST:
Design focuses on the "visual reminder" aspect of the user's design request.  With a simple presentation, a picture is
easily associated to a give note.  The "detailed view" of the note displays the image, title, note body, and time created,
and allows for continous edits to all (except the timestamp related to initial creation date.)

ISSUES:
persisistence is not working properly:

On initial run of the program, the unarchiving function (the saveNotesArray 
function call located in the view did load function in the 
NoteTableViewController.m file) must be commented out.
After saving at least 1 note, this can be uncommented, and the program will 
run normally.  Because of this same issue, individual notes that are deleted
in a program run will appear to be deleted, but when you re-run the program 
they reappear.  

 
