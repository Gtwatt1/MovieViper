//
//  MoviesListInteractor.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListInteractor.h"

#import "MoviesListInteractorOutput.h"
#import "Film.h"
#import "MovieFile.h"
#import "AppDelegate.h"
#import "MovieWebService-Swift.h"

@implementation MoviesListInteractor 



#pragma mark - MoviesListInteractorInput

- (void)setData:(NSArray *)films1 {
   
    
    

}

- (void)fetchFilms{
    MovieFile *movieFile = [MovieFile new];
    [movieFile getFilmWithCallback:^(Film *film) {
        [self.output didRetrieveFilm:film];
    }];
}


@end
