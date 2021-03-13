//
//  AppFlowCoordinator.swift
//  MarvelApplication
//
//  Created by Carlos Fontes on 13/03/21.
//

import UIKit
import Characters

struct AppFlowCoordinator {
    
    func start() -> UINavigationController {
        let charactersVC = CharactersListViewController()

        let navigationController = UINavigationController(rootViewController: charactersVC)
        CharactersListConfigurator.configureWith(viewController: charactersVC)
        
        return navigationController
    }
}
