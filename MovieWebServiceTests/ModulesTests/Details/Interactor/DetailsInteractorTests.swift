//
//  DetailsInteractorTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import XCTest

@testable
import MovieWebService

class DetailsInteractorTests: XCTestCase {

    var interactor: DetailsInteractor!
    var output: MockOutput!
	
    override func setUp() {
        super.setUp()
		
        output = MockOutput()
       
        interactor = DetailsInteractor()
        interactor.output = output
    }

    override func tearDown() {
        output = nil
        interactor = nil
	
        super.tearDown()
    }

    func testDidAskPresenterToDisplayDirector(){
        output.didGetDirector(Director())
        XCTAssertTrue(output.didPresentDirector)

    }
    
    func testDidAskPresenterToDisplayCast(){
        output.didGetCast([Actor()])
        XCTAssertTrue(output.didPresentCast)

    }
    // MARK: - Mock

    class MockOutput: DetailsInteractorOutput {
        
        var didPresentDirector = false
        var didPresentCast = false

        func didGetDirector(_ director: Director) {
            didPresentDirector = true
        }
        
        func didGetCast(_ cast: [Actor]) {
            didPresentCast = true
        }
        

    }

}
