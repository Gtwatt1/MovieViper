//
//  DetailsInteractor.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

class DetailsInteractor: DetailsInteractorInput {
    
    var director: Director!
    
    var cast: [Actor]!
    

    weak var output: DetailsInteractorOutput!

    // MARK: - DetailsInteractorInput
    
    func getDirector() {
        output.didGetDirector(director)
    }
    
    func getCast()  {
        output.didGetCast(cast)

    }
    
    
}
