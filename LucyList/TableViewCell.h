//
//  TableViewCell.h
//  LucyList
//
//  Created by Nancy  Thornton on 10/23/14.
//  Copyright (c) 2014 Nancy  Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *noteCellImage;

@property (weak, nonatomic) IBOutlet UILabel *noteCellLabel;

@end
