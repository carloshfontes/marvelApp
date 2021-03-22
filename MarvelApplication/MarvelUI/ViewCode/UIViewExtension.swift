//
//  ContraintAutoLayout.swift
//  MarvelUI
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation

public extension UIView {
    
    func setRightConstraintWith(_ constraint: NSLayoutXAxisAnchor, withConstantEqualTo constant: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let constant = constant {
            self.rightAnchor.constraint(equalTo: constraint, constant: -constant).isActive = true
        }else {
            self.rightAnchor.constraint(equalTo: constraint).isActive = true
        }
    }
    
    func setLeftConstraintWith(_ constraint: NSLayoutXAxisAnchor, withConstantEqualTo constant: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let constant = constant {
            self.leftAnchor.constraint(equalTo: constraint, constant: constant).isActive = true
        }else {
            self.leftAnchor.constraint(equalTo: constraint).isActive = true
        }
    }
    
    func setTopConstraintWith(_ constraint: NSLayoutYAxisAnchor, withConstantEqualTo constant: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let constant = constant {
            self.topAnchor.constraint(equalTo: constraint, constant: constant).isActive = true
        }else {
            self.topAnchor.constraint(equalTo: constraint).isActive = true
        }
        
    }
    
    func setBottomConstraintWith(_ constraint: NSLayoutYAxisAnchor, withConstantEqualTo constant: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let constant = constant {
            self.bottomAnchor.constraint(equalTo: constraint, constant: -constant).isActive = true
        }else {
            self.bottomAnchor.constraint(equalTo: constraint).isActive = true
        }
        
    }
    
    func setCenterXWith(_ constraint: NSLayoutXAxisAnchor){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: constraint).isActive = true
    }
    
    func setCenterYWith(_ constraint: NSLayoutYAxisAnchor){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: constraint).isActive = true
    }
    
    func setDimensionsConstraintWith(height: CGFloat, andWithWidth width: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}
