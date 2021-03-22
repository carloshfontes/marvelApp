//
//  FavoritesRouter.swift
//  Characters
//
//  Created by Carlos Fontes on 20/03/21.
//

import Foundation

protocol FavoritesRouterProtocol {
    var navigationController: UINavigationController? { get set }
    
    func routeToCharacterDetailWith(_ viewObject: FavoritesModels.ViewObject.CharacterVO)
}


public final class FavoritesRouter: FavoritesRouterProtocol {

    
    weak var navigationController: UINavigationController?
    
    func routeToCharacterDetailWith(_ viewObject: FavoritesModels.ViewObject.CharacterVO){
        
        let characterDetailsVC: CharacterDetailsViewController = CharacterDetailsViewController()
        
        CharacterDetailsConfigurator.configureWith(viewController: characterDetailsVC, withCharacterID: viewObject.characterID, withName: viewObject.name, withDescription: viewObject.description, orAndWithThumbnailData: viewObject.thumbnail, withNavigationController: navigationController)
        navigationController?.pushViewController(characterDetailsVC, animated: true)

    }
    
    deinit {
        print("Deinicializado route of favorites")
    }
}
