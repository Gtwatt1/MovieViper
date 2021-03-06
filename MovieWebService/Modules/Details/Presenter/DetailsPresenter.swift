//
//  DetailsPresenter.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

class DetailsPresenter: DetailsModuleInput, DetailsViewOutput, DetailsInteractorOutput {
   
    weak var view: DetailsViewInput!
    var interactor: DetailsInteractorInput!
    var router: DetailsRouterInput!
    

    // MARK: - DetailsViewOutput
    
    func viewIsReady() {
        view.setupViews()
        interactor.getCast()
        interactor.getDirector()
    }
    
    func didTapReadMore() {
        view.showMoreFilmDetails()
    }
    // MARK: - DetailsInteractorOutput
    
    func didGetDirector(_ director: Director) {
        view.displayDirector(director)
    }
       
   func didGetCast(_ cast: [Actor]) {
        view.displayCast(cast)
   }
    
}
