//
//  CharacterCollectionViewCell.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation
import MarvelUI

final class CharacterCollectionViewCell: UICollectionViewCell, Identifiable {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI(){
        setupViews()
    }
    
    func configWith(name: String, andWithImage image: UIImage?){
        self.nameLabel.text = name
        
        if let unwrappedImage = image {
            print(unwrappedImage)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: - View Codable

extension CharacterCollectionViewCell: ViewCodable {
    
    func setupViewHierarchy() {
        addSubview(nameLabel)
    }
    
    func setupConstraints() {
        setupNameLabelConstraints()
    }
    
    private func setupNameLabelConstraints(){
        nameLabel.setCenterXWith(self.centerXAnchor)
        nameLabel.setCenterYWith(self.centerYAnchor)

    }
    
    
}
