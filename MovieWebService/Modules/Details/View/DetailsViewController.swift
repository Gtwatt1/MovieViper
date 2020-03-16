//
//  DetailsViewController.swift
//  MovieWebService
//
//  Created by testDev on 11/04/2017.
//  Copyright © 2017 Agoda Services Co. Ltd. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, DetailsViewInput, TappableLabelDelegate {

    var output: DetailsViewOutput!
    public var director: Director!
    public var cast: [Actor]!
    
    let labelSpacing: CGFloat = 15
    var directorName = UILabel()
    var directorNameValue = UILabel()
    var actorNameLiteral = UILabel()
    var actorScreenNameLiteral = UILabel()
    var tapToShowMore = TappableLabel()
    var actorName = UILabel()
    var actorScreenName = UILabel()

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()

    }

    
    func setupViews(){
        view.backgroundColor = .white
        tapToShowMore.text = "Tap here to show more"
        directorNameValue.text = director.name;
        [actorName, actorScreenName, actorNameLiteral, actorScreenNameLiteral].forEach{
            $0.isHidden = true
        }
        
        [directorNameValue, actorName, actorScreenName].forEach {
            $0.font = UIFont.systemFont(ofSize: 14)
        }
        tapToShowMore.delegate = self
        directorName.text = "Director Name"
        actorNameLiteral.text = "Actor Name"
        actorScreenNameLiteral.text = "Actor Screen Name"

        
        let actor: Actor = cast[0]
        actorName.text = actor.name;
        actorScreenName.text = actor.screenName;
        [directorName, directorNameValue, tapToShowMore, actorName, actorScreenName, actorNameLiteral, actorScreenNameLiteral].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textColor = .black
            view.addSubview($0)
        }
        
        directorName.leftAnchor.constraint(equalTo: view.leftAnchor, constant : 20).isActive = true
        directorName.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        directorNameValue.leftAnchor.constraint(equalTo: view.leftAnchor, constant : 20).isActive = true
        directorNameValue.topAnchor.constraint(equalTo: directorName.bottomAnchor, constant: labelSpacing).isActive = true
      
     
        tapToShowMore.leftAnchor.constraint(equalTo: view.leftAnchor, constant : 20).isActive = true
        tapToShowMore.topAnchor.constraint(equalTo: directorNameValue.bottomAnchor, constant: labelSpacing).isActive = true
        
         actorNameLiteral.leftAnchor.constraint(equalTo: view.leftAnchor, constant : 20).isActive = true
         actorNameLiteral.topAnchor.constraint(equalTo: tapToShowMore.topAnchor).isActive = true
        
        actorName.leftAnchor.constraint(equalTo: view.leftAnchor, constant : 20).isActive = true
        actorName.topAnchor.constraint(equalTo: actorNameLiteral.bottomAnchor, constant: labelSpacing).isActive = true
       
        actorScreenNameLiteral.leftAnchor.constraint(equalTo: view.leftAnchor, constant : 20).isActive = true
        actorScreenNameLiteral.topAnchor.constraint(equalTo: actorName.bottomAnchor, constant: labelSpacing).isActive = true
        
        actorScreenName.leftAnchor.constraint(equalTo: view.leftAnchor, constant : 20).isActive = true
        actorScreenName.topAnchor.constraint(equalTo: actorScreenNameLiteral.bottomAnchor, constant: labelSpacing).isActive = true
        
    }
    
    func showMoreFilmDetails(){
        [actorName, actorScreenName, actorNameLiteral, actorScreenNameLiteral].forEach{
                   $0.isHidden = false
         }
        tapToShowMore.isHidden = true
    }

    // MARK: DetailsViewInput

    func didReceiveTouch() {
        output.didTapReadMore()
    }

}
