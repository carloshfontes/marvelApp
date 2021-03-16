//
//  CharacterDetailsRouter.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation

protocol CharacterDetailsRouterProtocol {
    var navigationController: UINavigationController? { get set }
    
}


public final class CharacterDetailsRouter: CharacterDetailsRouterProtocol {

    
    weak var navigationController: UINavigationController?
    deinit {
        print("Deinicializado route")
    }
}
