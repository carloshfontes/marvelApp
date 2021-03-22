//
//  FavoritesConfigurator.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation

public final class FavoritesConfigurator {
    
    public static func configureWith(viewController: FavoritesViewController, withNavigationController navigation: UINavigationController?){
        
        let repository: CharacterRepository = CharacterCoreDataRepository(context: CoreDataStack.shared.viewContext)
        
        let characterStorageWorker: CharacterStorageWorkerProtocol = CharacterStorageWorker(repository: repository)
        
        let interactor: FavoritesInteractorInput = FavoritesInteractor(characterStorageWorker: characterStorageWorker)
        let presenter: FavoritesPresenterInput = FavoritesPresenter()
        var router: FavoritesRouterProtocol = FavoritesRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.navigationController = navigation
    }
}
