//
//  CharacterDetailsViewController.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation

public final class CharacterDetailsViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: CharacterDetailsInteractorInput?
    var router: CharacterDetailsRouterProtocol?
    var characterViewObject: CharacterProtocol?
    
    // MARK: - Views
    lazy var characterDetailsView: CharacterDetailsView = {
        let view = CharacterDetailsView(frame: .zero)
        view.favoriteButton.addTarget(self, action: #selector(tappedOnFavoriteButton), for: .touchUpInside)
        return view
    }()
    
    // MARK: - Lifecycle

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    public override func loadView() {
        self.view = characterDetailsView
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.removeNavigationImage()
        characterDetailsView.configViewWith(characterViewObject?.thumbnailPath, orWithImageData: characterViewObject?.thumbnail, withDescription: characterViewObject?.description, andWithName: characterViewObject?.name)
        
    }
    
    // MARK: - Methods
    
    private func removeNavigationImage(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    // MARK: - Selectors
    
    @objc func tappedOnFavoriteButton(){
        
        guard let name = characterViewObject?.name, let id = characterViewObject?.id, let characterID = characterViewObject?.characterID else { return }
        
        let request = CharacterDetailsModels.Request.CharacterVO(name: name, description: characterViewObject?.description, id: id, characterID: characterID, thumbnail: self.characterDetailsView.backgroundImageView.image?.pngData(), thumbnailPath: nil)
        
        self.interactor?.addCharacterWith(request: request)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Deinicializado vc")
    }
}


// MARK: - Presenter output

extension CharacterDetailsViewController: CharacterDetailsPresenterOutput {
    
    func displayErrorWith(_ response: CharacterDetailsModels.Response.Error) {
        showAlert(withTitle: "", withMessage: response.message, withColor: .red, andWithStyle: .alert)
    }
    
    func displayMessageWith(_ response: CharacterDetailsModels.Response.Message) {
        showAlert(withTitle: "", withMessage: response.text, withColor: .green, andWithStyle: .alert)
    }
    
}
