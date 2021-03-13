//
//  CharactersListRouter.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation

protocol CharactersListRouterProtocol {
    var navigationController: UINavigationController? { get set }
}


public final class CharactersListRouter: CharactersListRouterProtocol {
    weak var navigationController: UINavigationController?
    
}
