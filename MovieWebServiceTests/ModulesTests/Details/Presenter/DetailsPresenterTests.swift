//
//  DetailsPresenterTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//


import XCTest

@testable
import MovieWebService

class DetailsPresenterTests: XCTestCase {

    var presenter: DetailsPresenter!
    var router: MockRouter!
    var interactor: MockInteractor!
    var view: MockView!
	
    override func setUp() {
        super.setUp()
		
        router = MockRouter()
        interactor = MockInteractor()
        view = MockView()

        presenter = DetailsPresenter()
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
    }

    override func tearDown() {
        router = nil
        interactor = nil
        view = nil
        presenter = nil

        super.tearDown()
    }

    func testShouldGetFilmDetails(){
        presenter.viewIsReady()
        
        XCTAssertTrue(interactor.didFetchCast)
        XCTAssertTrue(interactor.didFetchDirector)

    }
    
    func testShouldSetupView(){
         presenter.viewIsReady()
        
        XCTAssertTrue(view.displayedViews)

    }
    
    func testShouldDisplayDirector(){
        presenter.didGetDirector(Director())
        XCTAssertTrue(view.displayedDirector)

    }
    
    func testShouldDisplayCast(){
        presenter.didGetCast([Actor()])
        XCTAssertTrue(view.displayedCast)

        
    }
    
    func testShouldShowMore(){
        presenter.didTapReadMore()
        XCTAssertTrue(view.displayedMoreFilmDetails)

    }
    // MARK: - Mock

    class MockInteractor: DetailsInteractorInput {
        var director: Director!
        
        var cast: [Actor]!
        
        var didFetchDirector = false
        var didFetchCast = false
        
        func getDirector() {
            didFetchDirector = true
        }
        
        func getCast() {
            didFetchCast = true
        }
        

    }

    class MockRouter: DetailsRouterInput {

    }

    class MockView: DetailsViewInput {
        
        var displayedViews = false
        var displayedDirector = false
        var displayedCast = false
        var displayedMoreFilmDetails = false
        
        func displayDirector(_ director: Director) {
            displayedDirector = true
        }
        
        func displayCast(_ cast: [Actor]) {
            displayedCast = true
        }
        
        func setupViews() {
            displayedViews = true
        }
        
        func showMoreFilmDetails() {
            displayedMoreFilmDetails = true
        }
        
		
    }

}
