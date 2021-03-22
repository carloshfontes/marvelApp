//
//  FavoritesViewController.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation


public final class FavoritesViewController: UIViewController {
    
    // MARK: - Properties
    
    var interactor: FavoritesInteractorInput?
    var router: FavoritesRouterProtocol?
    
    private var characterTableViewDataSource: CharacterTableViewDataSource? {
        didSet {
            setupCharacterTableViewDataSourceAndDelegate()
        }
    }
    
    private var characterTableViewDelegate: CharacterTableViewDelegate?
        
    // MARK: - View
    
    var favoriteView: FavoritesView = {
        let view = FavoritesView(frame: .zero)
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func loadView() {
        self.view = favoriteView
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.title = "Personagens favoritos"
        self.interactor?.fetchListOfChacter()
    }
    
    // MARK: - Methods
    
    private func setupCharacterTableViewDataSourceAndDelegate(){
        guard let delegate = characterTableViewDelegate else { return }
        guard let dataSource = characterTableViewDataSource else { return }
        
        delegate.didSelectCharacter = { [weak self] character in
            guard let self = self else { return }
            
            self.router?.routeToCharacterDetailWith(FavoritesModels.ViewObject.CharacterVO(name: character.name, description: character.description, id: character.id, characterID: character.characterID, thumbnail: character.thumbnail, thumbnailPath: character.thumbnailPath))
        }
        
        dataSource.didRemoveCharacter = { [weak self] character in
            self?.interactor?.remove(character)
        }
        
        DispatchQueue.main.async {
            self.favoriteView.charactersTableView.delegate = delegate
            self.favoriteView.charactersTableView.dataSource = dataSource
            self.favoriteView.charactersTableView.reloadData()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Presenter

extension FavoritesViewController: FavoritesPresenterOutput {
    
    func displaySucessMessageWith(response: FavoritesModels.Response.Message) {
        showAlert(withTitle: "Sucesso", withMessage: response.text, withColor: .green, andWithStyle: .alert)
    }
    
    func displayListOfCharacterWith(viewObject: [FavoritesModels.ViewObject.CharacterVO]){
        self.characterTableViewDelegate = CharacterTableViewDelegate(characterList: viewObject)
        self.characterTableViewDataSource = CharacterTableViewDataSource(characterList: viewObject)
    }
    

    
    func displayErrorWith(response: FavoritesModels.Response.Error) {
        showAlert(withTitle: "Erro", withMessage: response.message, withColor: .red, andWithStyle: .alert)
    }
    
    
    
}
