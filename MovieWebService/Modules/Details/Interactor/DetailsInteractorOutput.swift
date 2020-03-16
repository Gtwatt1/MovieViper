//
//  DetailsInteractorOutput.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

protocol DetailsInteractorOutput: class {
    func didGetDirector(_ director : Director)
    func didGetCast(_ cast : [Actor])
}
