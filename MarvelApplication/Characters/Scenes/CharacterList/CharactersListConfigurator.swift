//
//  CharactersListConfigurator.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation


public final class CharactersListConfigurator {

    
    static func configureWith(viewController: CharactersListViewController){
        let interactor: CharactersListInteractorInput = CharactersListInteractor()
        let presenter: CharactersListPresenterInput = CharactersListPresenter()
        let router: CharactersListRouterProtocol = CharactersListRouter()
        
        interactor.presenter = presenter
        
        viewController.router = router
        viewController.interactor = interactor
        
        presenter.viewController = viewController
    }
}
