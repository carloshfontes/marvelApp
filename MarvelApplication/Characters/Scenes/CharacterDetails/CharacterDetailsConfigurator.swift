//
//  CharacterDetailsConfigurator.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation

public final class CharacterDetailsConfigurator {

    
    public static func configureWith(viewController: CharacterDetailsViewController, withCharacterID id: Int?, withName name: String?, withDescription description: String?, andWithThumbnail thumbnail: String?){
        
        let characterVO: CharacterDetailsModels.ViewObject.CharacterVO = CharacterDetailsModels.ViewObject.CharacterVO(id: id, name: name, description: description, thumbnail: thumbnail)
        
        let interactor: CharacterDetailsInteractorInput = CharacterDetailsInteractor()
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
