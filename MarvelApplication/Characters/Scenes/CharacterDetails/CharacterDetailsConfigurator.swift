//
//  CharacterDetailsConfigurator.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation

public final class CharacterDetailsConfigurator {

    
    public static func configureWith(viewController: CharacterDetailsViewController, withCharacterID id: Int, withName name: String, withDescription description: String?, andWithThumbnail thumbnail: String? = nil, orAndWithThumbnailData data: Data? = nil, withNavigationController navigation: UINavigationController?){
        
        let characterVO: CharacterProtocol = CharacterDetailsModels.ViewObject.CharacterVO(name: name, description: description, id: UUID(), characterID: id, thumbnail: data, thumbnailPath: thumbnail)
        
        let repository: CharacterRepository = CharacterCoreDataRepository(context: CoreDataStack.shared.viewContext)
        let characterStorageWorker: CharacterStorageWorkerProtocol = CharacterStorageWorker(repository: repository)
        
        
        let interactor: CharacterDetailsInteractorInput = CharacterDetailsInteractor(characterStorageWorker: characterStorageWorker)
        let presenter: CharacterDetailsPresenterInput = CharacterDetailsPresenter()
        var router: CharacterDetailsRouterProtocol = CharacterDetailsRouter()
        
        interactor.presenter = presenter
        
        viewController.router = router
        viewController.interactor = interactor
        viewController.characterViewObject = characterVO
        
        presenter.viewController = viewController
        router.navigationController = viewController.navigationController
    }
    
}
