//
//  FavoritesConfigurator.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation

public final class FavoritesConfigurator {
    
    public static func configureWith(viewController: FavoritesViewController){
        let interactor: FavoritesInteractorInput = FavoritesInteractor()
        let presenter: FavoritesPresenterInput = FavoritesPresenter()
        
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}
