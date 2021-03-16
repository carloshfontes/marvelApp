//
//  CharactersListRouter.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation

protocol CharactersListRouterProtocol {
    var navigationController: UINavigationController? { get set }
    func routeToCharacterDetailWith(_ request: CharactersListModels.Request.CharacterVO)
}


public final class CharactersListRouter: CharactersListRouterProtocol {
    weak var navigationController: UINavigationController?
    
    func routeToCharacterDetailWith(_ request: CharactersListModels.Request.CharacterVO){


    }
}
