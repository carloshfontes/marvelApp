//
//  CharacterListView.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation
import MarvelUI

final class CharacterListView: UIView {
    
    var characterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
    
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(CharacterCollectionViewCell.self, forCellWithReuseIdentifier: CharacterCollectionViewCell.uniqueIdentifier)
        return view
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    // MARK: - Functions
    
    private func setupUI(){
        self.backgroundColor = .white
//        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable

extension CharacterListView: ViewCodable {

    func setupViewHierarchy() {
       addSubview(characterCollectionView)
    }

    func setupConstraints() {
        setupCharacterCollectionViewConstraints()
    }

    private func setupCharacterCollectionViewConstraints(){
        characterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        characterCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 150).isActive = true
        characterCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        characterCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        characterCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
}
