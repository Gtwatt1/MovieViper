//
//  DetailsInteractorInput.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

protocol DetailsInteractorInput {
    var director: Director! { get  }
    var cast: [Actor]! {get}
    
    func getDirector()
    func getCast() 

}
