//
//  CharactersListViewController.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation
import Kingfisher
import MarvelUI


public final class CharactersListViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: CharactersListInteractorInput?
    var router: CharactersListRouterProtocol?
    
    // MARK: - DataSource and Delegates
    
    private var characterCollectionDataSource: CharacterCollectionViewDataSource? {
        didSet {
            setupCharacterCollectionViewDataSourceAndDelegate()
        }
    }
    
    private var characterCollectionDelegate: CharacterCollectionViewDelegate?
    
    // MARK: - View
    
    var characterListView: CharacterListView = {
        let view = CharacterListView()
        return view
    }()
    
    lazy var favoritesButtonScreen: UIBarButtonItem = {
        let barButton = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(touchInFavoritesButton))
        barButton.tintColor = .black
        return barButton
    }()
    
    
    // MARK: - View Lifecycle
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func loadView() {
        self.view = characterListView
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.titleView = characterListView.searchBar
        self.navigationItem.rightBarButtonItem = favoritesButtonScreen
        self.characterListView.searchBar.delegate = self
        self.fetchListOfCharacter()
    }
    
    // MARK: - Functions
    
    private func fetchListOfCharacter(){
        
        let options: [CharacterOrderBy] = [.modifiedDecrease, .modifiedIncrease, .nameDescrease, .nameIncrease]
        
        let option: CharacterOrderBy = options.randomElement() ?? .nameIncrease
        
        self.interactor?.activeLoadingIndicator()
        interactor?.fetchListOfCharacterOrder(by: option, andWithLimit: 80)
    }
    
    private func setupCharacterCollectionViewDataSourceAndDelegate(){
        guard let dataSource = characterCollectionDataSource else { return }
        guard let delegate = characterCollectionDelegate else { return }
        
        dataSource.cellDelegate = self
        
        delegate.didSelectCharacter = { [weak self] character in
            guard let self = self else { return }
        
            self.router?.routeToCharacterDetailWith(character)
        }

        DispatchQueue.main.async {
            self.characterListView.characterCollectionView.delegate = delegate

            self.characterListView.characterCollectionView.dataSource = dataSource
            self.characterListView.characterCollectionView.reloadData()
        }
    }
    
    // MARK: - Selectors
    
    @objc func touchInFavoritesButton(){
        self.router?.routeToFavorites()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions


// MARK: - Presenter output
extension CharactersListViewController: CharactersListPresenterOutput {
    
    func displayLoadingIndicator() {
        DispatchQueue.main.async {
            self.characterListView.showLoadingIndicator(view: self.characterListView)
        }
    }
    
    func stopLoadingIndicator() {
        DispatchQueue.main.async {
            self.characterListView.dismissLoadingIndicator()
        }
    }
    
    
    func displayMessageWith(response: CharactersListModels.Response.Message) {
        showAlert(withTitle: nil, withMessage: response.text, withColor: .green, andWithStyle: .alert)
        self.interactor?.stopLoadingIndicator()

    }

    func saveCharacterWith(viewObject: CharactersListModels.ViewObject.CharacterProtocolVO) {
        self.interactor?.activeLoadingIndicator()
        self.interactor?.addCharacterWith(request: CharactersListModels.Request.CharacterVO(name: viewObject.name, description: viewObject.description, id: viewObject.id, characterID: viewObject.characterID, thumbnail: viewObject.thumbnail))
    }
    
    
    func displayListOfCharactersWith(viewObject: CharactersListModels.ViewObject) {
        self.characterCollectionDelegate = CharacterCollectionViewDelegate(characterListVO: viewObject.characters)
        self.characterCollectionDataSource = CharacterCollectionViewDataSource(characters: viewObject.characters)
        self.interactor?.stopLoadingIndicator()
    }
    
    func displayErrorWith(message: CharactersListModels.Error) {
        showAlert(withTitle: "Erro", withMessage: message.message, withColor: .red, andWithStyle: .alert)
        self.interactor?.stopLoadingIndicator()
    }
    
    func displayEmptyListOfCharacter(response: CharactersListModels.Response.Message) {
        DispatchQueue.main.async {
            let messageView: MessageView = MessageView()
            messageView.configMessageViewWithColor(withSize: UIFont.boldSystemFont(ofSize: 20), withMessage: response.text)
            self.characterListView.characterCollectionView.backgroundView = messageView
        }
    }
}


extension CharactersListViewController: CharacterCollectionDelegate {
    
    func didTappedInFavoriteButtonAndSave(_ character: CharactersListModels.ViewObject.CharacterVO) {
        
        self.interactor?.downloadImageWith(request: CharactersListModels.Request.Image(path: character.thumbnailPath), of: CharactersListModels.Request.CharacterVO(name: character.name, description: character.description, id: UUID(), characterID: character.characterID, thumbnail: nil))
    }

}


// MARK: - Searchbar delegate

extension CharactersListViewController: UISearchBarDelegate {
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.interactor?.activeLoadingIndicator()
        self.interactor?.fetchListOfCharacterWith(searchBar.searchTextField.text ?? "", byOrder: .nameIncrease, andWithLimit: 80)
        searchBar.resignFirstResponder()
    }
    
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.interactor?.activeLoadingIndicator()
        self.interactor?.fetchListOfCharacterWith(searchBar.searchTextField.text ?? "", byOrder: .nameIncrease, andWithLimit: 80)
        searchBar.resignFirstResponder()
    }
}
