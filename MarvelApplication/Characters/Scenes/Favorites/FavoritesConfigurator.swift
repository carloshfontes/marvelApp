//
//  FavoritesConfigurator.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation

public final class FavoritesConfigurator {
    
    public static func configureWith(viewController: FavoritesViewController){
        
        let repository: CharacterRepository = CharacterCoreDataRepository(context: CoreDataStack.shared.viewContext)
        
        let characterStorageWorker: CharacterStorageWorkerProtocol = CharacterStorageWorker(repository: repository)
        
        let interactor: FavoritesInteractorInput = FavoritesInteractor(characterStorageWorker: characterStorageWorker)
        let presenter: FavoritesPresenterInput = FavoritesPresenter()
        
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}
