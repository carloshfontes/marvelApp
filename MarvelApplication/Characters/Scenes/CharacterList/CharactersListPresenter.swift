//
//  CharactersListPresenter.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation

protocol CharactersListPresenterInput: class{
    var viewController: CharactersListPresenterOutput? { get set }
}

protocol CharactersListPresenterOutput: class{
}

final class CharactersListPresenter: CharactersListPresenterInput {
    weak var viewController: CharactersListPresenterOutput?

}
