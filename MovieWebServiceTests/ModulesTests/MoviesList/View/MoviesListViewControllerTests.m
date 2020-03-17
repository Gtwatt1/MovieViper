//
//  MoviesListViewControllerTests.m
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "MoviesListViewController.h"

#import "MoviesListViewOutput.h"
#import "MovieWebService-Swift.h"
#import "CellTableViewCell.h"


@interface MoviesListViewControllerTests : XCTestCase

@property (nonatomic, strong) MoviesListViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation MoviesListViewControllerTests

- (void)setUp {
    [super setUp];

    self.controller = [MoviesListViewController new];

    self.mockOutput = OCMProtocolMock(@protocol(MoviesListViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

- (void)testTableViewSectionIsOne{
    DisplayFilm *displayFilm = [DisplayFilm new];
    self.controller.filmList = [NSArray arrayWithObject:displayFilm];
    [self.controller setupInitialState];

    XCTAssertEqual(self.controller.tableView.numberOfSections , 1);
    [self.controller.tableView numberOfRowsInSection:0];
}

- (void)testTableViewRowIsOne{
    DisplayFilm *displayFilm = [DisplayFilm new];
    self.controller.filmList = [NSArray arrayWithObject:displayFilm];
    [self.controller setupInitialState];

    XCTAssertEqual([self.controller.tableView numberOfRowsInSection:0] , self.controller.filmList.count);
    
}

- (void) testConfigureTableViewCell{
    DisplayFilm *displayFilm = [DisplayFilm new];
    displayFilm.date = @"Oct 12, 2012";
    displayFilm.ratingString = @"R";
    displayFilm.rating = @"7.8";
    displayFilm.name = @"Joseph One";

    
    self.controller.filmList = [NSArray arrayWithObject:displayFilm];
    [self.controller setupInitialState];
    [self.controller.tableView reloadData];
    NSIndexPath *indexpath =[NSIndexPath indexPathForRow:0 inSection:0];
    CellTableViewCell *cell = [self.controller.tableView cellForRowAtIndexPath:indexpath];
   XCTAssertTrue([displayFilm.name isEqualToString: cell.name.text]);
   XCTAssertTrue([displayFilm.rating isEqualToString: cell.rating.text]);
   XCTAssertTrue([displayFilm.ratingString isEqualToString: cell.filmRating.text]);
   XCTAssertTrue([displayFilm.date isEqualToString: cell.date.text]);
    
}

- (void) testPresenterIsCalledWhenTableviewClicked{
    [self.controller showFilmDetails:0];
    OCMVerify([self.mockOutput showFilmDetails:0]);
}



@end
