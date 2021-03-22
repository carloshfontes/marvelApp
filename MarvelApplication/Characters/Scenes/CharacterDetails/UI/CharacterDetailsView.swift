//
//  CharacterDetailsView.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation
import MarvelUI

final class CharacterDetailsView: UIView {
    
    private let backgroundImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private let bottomDetailView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .black
        label.text = ""
        return label
    }()
    
    
    private let descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.text = ""
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        label.textAlignment = .justified
        return label
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = .gray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI(){
        self.backgroundColor = .white
        setupViews()
    }
    
    func configViewWith(_ imagePath: String?, orWithImageData data: Data?, withDescription description: String?, andWithName name: String?){
        if let path = imagePath {
            self.backgroundImageView.setupWith(url: path)
        }
        
        if let data = data {
            self.backgroundImageView.image = UIImage(data: data)
        }
        
        if let description = description {
            self.descriptionLabel.text = description
        }
        
        if let name = name {
            self.nameLabel.text = name
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - View Codable

extension CharacterDetailsView: ViewCodable {
    
    
    func setupViewHierarchy() {
        addSubview(backgroundImageView)
        addSubview(bottomDetailView)
        bottomDetailView.addSubview(nameLabel)
        bottomDetailView.addSubview(favoriteButton)
        bottomDetailView.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        setupBackgroundImageViewConstraints()
        setupBottomDetailViewConstraints()
        setupNameLabelConstraints()
        setupFavoriteButtonConstraints()
        setupDescriptionLabelConstraints()
    }
    
    private func setupBackgroundImageViewConstraints(){
        backgroundImageView.setTopConstraintWith(topAnchor)
        backgroundImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        backgroundImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
        
    }
    
    private func setupBottomDetailViewConstraints(){
        bottomDetailView.setBottomConstraintWith(self.bottomAnchor)
        bottomDetailView.setLeftConstraintWith(self.leftAnchor)
        bottomDetailView.setRightConstraintWith(self.rightAnchor)
        bottomDetailView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        
        bottomDetailView.layer.masksToBounds = true
        bottomDetailView.layer.cornerRadius = 25
    }
    
    private func setupNameLabelConstraints(){
        nameLabel.setTopConstraintWith(bottomDetailView.topAnchor, withConstantEqualTo: 20)
        nameLabel.setCenterXWith(bottomDetailView.centerXAnchor)
    }
    
    private func setupFavoriteButtonConstraints(){
        favoriteButton.setTopConstraintWith(bottomDetailView.topAnchor, withConstantEqualTo: 20)
        favoriteButton.setRightConstraintWith(bottomDetailView.rightAnchor, withConstantEqualTo: 20)
    }
    
    private func setupDescriptionLabelConstraints(){
        descriptionLabel.setLeftConstraintWith(bottomDetailView.leftAnchor, withConstantEqualTo: 20)
        descriptionLabel.setRightConstraintWith(bottomDetailView.rightAnchor, withConstantEqualTo: 20)
        descriptionLabel.setTopConstraintWith(nameLabel.bottomAnchor, withConstantEqualTo: 20)
        descriptionLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        descriptionLabel.setCenterXWith(self.centerXAnchor)
   
    }

}

