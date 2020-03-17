//
//  MoviesListPresenterTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "MoviesListPresenter.h"

#import "MoviesListViewInput.h"
#import "MoviesListInteractorInput.h"
#import "MoviesListRouterInput.h"
#import "MovieWebService-Swift.h"


@interface MoviesListPresenterTests : XCTestCase

@property (nonatomic, strong) MoviesListPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation MoviesListPresenterTests


- (void)setUp {
    [super setUp];

    self.presenter = [[MoviesListPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(MoviesListInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(MoviesListRouterInput));
    self.mockView = OCMProtocolMock(@protocol(MoviesListViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}


- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

- (void)testViewIsCalledAfterRetrievingFilms {
    // given


    // when
    Film *film = [Film new];
    [self.presenter didRetrieveFilm:film];

    // then
    OCMVerify([self.mockView showFilms:[OCMArg any]]);
}


- (void)testFetchOrderWhenViewReady{
    [self.presenter didTriggerViewReadyEvent];

    OCMVerify([self.mockInteractor fetchFilms]);
}

-(void)testRouterIsCalledWhenDisplayDetails{
    [self.presenter showFilmDetails:0];

    OCMVerify([self.mockRouter showFilmDetail:[OCMArg any]]);
}

-(void)testFilmToDisplayFilm{
    Film *film = [Film new];
    film.name = @"Joseph one";
    film.releaseDate = [NSDate dateWithTimeIntervalSince1970:[@1350000000 doubleValue]]; 
    film.rating = [@7.8 doubleValue];
    film.filmRating = [@3 intValue];

    DisplayFilm *displayFilm = [self.presenter filmToDisplayFilm:film];
    
    XCTAssertEqual(displayFilm.name, film.name);
    XCTAssertTrue([displayFilm.rating isEqualToString: @"7.8"]);
    XCTAssertTrue([displayFilm.ratingString isEqualToString: @"R"]);
    XCTAssertTrue([displayFilm.date isEqualToString: @"Oct 12, 2012"]);

    
}
@end
