//
//  CellTableViewCell.m
//  MovieWebService
//
//  Created by testDev on 4/11/17.
//  Copyright © 2017 TestCompany. All rights reserved.
//

#import "CellTableViewCell.h"

@interface CellTableViewCell()
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *filmRating;
@property (strong, nonatomic) IBOutlet UILabel *rating;

@end

@implementation CellTableViewCell

- (void)setCellLabels:(DisplayFilm *)displayFilm{
    
    self.name.text = displayFilm.name;
    self.date.text = displayFilm.date;
    self.filmRating.text = displayFilm.ratingString;
    self.rating.text = displayFilm.rating;
}


@end
