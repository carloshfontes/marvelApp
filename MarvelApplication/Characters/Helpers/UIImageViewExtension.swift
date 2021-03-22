//
//  UIImageViewExtension.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import UIKit
import Kingfisher


extension UIImageView {
    
    func setupWith(url: String){
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url))
    }
}
