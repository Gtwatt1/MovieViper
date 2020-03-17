//
//  MoviesListPresenter.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListPresenter.h"

#import "MoviesListViewInput.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"
#import "MovieWebService-Swift.h"

@interface MoviesListPresenter ()
    @property (nonatomic, strong)   NSDateFormatter*  dateFormatter;

@end
@implementation MoviesListPresenter {
    NSArray *films;

}

- (void)configureModule {
 }

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self fetchFilms];
}


- (void) fetchFilms{
    [self.interactor fetchFilms];
}


- (void)didRetrieveFilm:(Film *)film{
    DisplayFilm *displayFilm = [self filmToDisplayFilm:film];
    NSArray *displayFilms = [NSArray arrayWithObject:displayFilm];
    films = [NSArray arrayWithObject:film];
    [self.view showFilms:displayFilms];
}

- (DisplayFilm *)filmToDisplayFilm:(Film *)film{
    DisplayFilm *displayFilm = [[DisplayFilm alloc] init];;
    displayFilm.name = film.name;

    NSString* dateText;
    dateText = [self.dateFormatter stringFromDate:film.releaseDate];
    displayFilm.date = dateText;
    NSString *filmRatingText;
    switch (film.filmRating) {
        case G:
            filmRatingText = @"G";
        case PG:
            filmRatingText = @"PG";
        case PG13:
            filmRatingText = @"PG13";
        case R:
            filmRatingText = @"R";
        default:
            break;
    }
    displayFilm.ratingString = filmRatingText;
    displayFilm.rating = [[NSNumber numberWithDouble:film.rating] stringValue];
    return displayFilm;
}

- (NSDateFormatter*)dateFormatter
{
    if (_dateFormatter == nil)
    {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"MMM dd, yyyy"];
    }
    
    return _dateFormatter;
}

- (void)showFilmDetails:(NSInteger)index{
    Film *film = [films objectAtIndex:index];
    [self.router showFilmDetail:film];
}




@end
