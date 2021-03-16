//
//  CharacterDetailsConfigurator.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation

public final class CharacterDetailsConfigurator {

    
    public static func configureWith(viewController: CharacterDetailsViewController){
        let interactor: CharacterDetailsInteractorInput = CharacterDetailsInteractor()
        let presenter: CharacterDetailsPresenterInput = CharacterDetailsPresenter()
        let router: CharacterDetailsRouterProtocol = CharacterDetailsRouter()
        
        interactor.presenter = presenter
        
        viewController.router = router
        viewController.interactor = interactor
        
        presenter.viewController = viewController
    }
}
