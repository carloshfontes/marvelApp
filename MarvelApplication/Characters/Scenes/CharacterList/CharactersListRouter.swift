//
//  CharactersListRouter.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation

protocol CharactersListRouterProtocol {
    var navigationController: UINavigationController? { get set }
    func routeToCharacterDetailWith(_ viewObject: CharactersListModels.ViewObject.CharacterVO)
    func routeToFavorites()
}


public final class CharactersListRouter: CharactersListRouterProtocol {
    weak var navigationController: UINavigationController?
    
    func routeToCharacterDetailWith(_ viewObject: CharactersListModels.ViewObject.CharacterVO){
        
        let characterDetailsVC: CharacterDetailsViewController = CharacterDetailsViewController()
        
        CharacterDetailsConfigurator.configureWith(viewController: characterDetailsVC, withCharacterID: viewObject.characterID, withName: viewObject.name, withDescription: viewObject.description, andWithThumbnail: viewObject.thumbnailPath, withNavigationController: navigationController)
        navigationController?.pushViewController(characterDetailsVC, animated: true)

    }
    
    func routeToFavorites(){
        let favoritesVC: FavoritesViewController = FavoritesViewController()
        
        FavoritesConfigurator.configureWith(viewController: favoritesVC, withNavigationController: self.navigationController)
        navigationController?.pushViewController(favoritesVC, animated: true)
    }


}
