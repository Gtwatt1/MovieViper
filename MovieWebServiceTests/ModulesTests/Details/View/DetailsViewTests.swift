//
//  DetailsViewTests.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import XCTest

@testable
import MovieWebService

class DetailsViewTests: XCTestCase {

    var output: MockOutput!
    var viewController: DetailsViewController!
	
    override func setUp() {
        super.setUp()

        output = MockOutput()
        viewController = DetailsViewController()
        viewController.output = output
    }

    override func tearDown() {
        output = nil
        viewController = nil
		
        super.tearDown()
    }

    func testIfViewIsReady() {

        //when 
        viewController.viewDidLoad()

        //then
        XCTAssertTrue(output.viewIsReadyDidCall)
    }
    
    func testDisplayActor(){
        
        let actorData : [String: Any] = [ "dateOfBirth": -436147200,
                            "nominated": 1,
                            "name": "Bryan Cranston",
                            "screenName": "Jack Donnell",
                            "biography": "Bryan Lee Cranston is an American actor, voice actor, writer and director."
                        ]
        let actor = Actor(data: actorData)
        viewController.displayCast([actor!])
        
        XCTAssertEqual(viewController.actorName.text, "Bryan Cranston")
        XCTAssertEqual(viewController.actorScreenName.text, "Jack Donnell")
    }
    
    func testDisplayDirector(){
        
        let actorData : [String: Any] = [ "dateOfBirth": 82684800,
                    "nominated": 1,
                    "name": "Ben Affleck",
                    "biography": "Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, USA but raised in Cambridge, Massachusetts, USA."
                    ]
        let director = Director(data: actorData)
        viewController.displayDirector(director!)
        
        XCTAssertEqual(viewController.directorNameValue.text, "Ben Affleck")
    }
    
    func testShowMoreIsClicked(){
        viewController.didReceiveTouch()
        XCTAssertTrue(output.tapMoreDidClick)
    }

    // MARK: - Mock

    class MockOutput: DetailsViewOutput {
        func didTapReadMore() {
            tapMoreDidClick = true
        }
        
        var tapMoreDidClick: Bool = false

        var viewIsReadyDidCall: Bool = false

        func viewIsReady() {
            viewIsReadyDidCall = true
        }
		
    }
    
    
}
