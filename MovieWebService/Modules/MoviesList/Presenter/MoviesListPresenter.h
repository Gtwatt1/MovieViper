//
//  MoviesListPresenter.h
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import "MoviesListViewOutput.h"
#import "MoviesListInteractorOutput.h"
#import "MoviesListModuleInput.h"

@class DisplayFilm;
@protocol MoviesListViewInput;
@protocol MoviesListInteractorInput;
@protocol MoviesListRouterInput;

@interface MoviesListPresenter : NSObject <MoviesListViewOutput, MoviesListInteractorOutput>

@property (nonatomic, weak) id<MoviesListViewInput> view;
@property (nonatomic, strong) id<MoviesListInteractorInput> interactor;
@property (nonatomic, strong) id<MoviesListRouterInput> router;


- (DisplayFilm *)filmToDisplayFilm:(Film *)film;






@end
