//
//  ConfigView.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 21.03.2024.
//

import UIKit

class ConfigView: UIView {
    
    //MARK: - create UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bluePicture")
        return imageView
    }()
    
    private let firstTextField: UIImageView = {
        let textField = UIImageView()
        return textField
    }()
    
    private let secondTextField: UIImageView = {
        let textField = UIImageView()
        return textField
    }()
    
    private let thirdTextField: UIImageView = {
        let textField = UIImageView()
        return textField
    }()
    
    //MARK: - constraints
    func constraintsForFirstTextField() {
        firstTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            firstTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            firstTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            firstTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    func constraintsForSecondTextField() {
        secondTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            secondTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            secondTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            secondTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    func constraintsForThirdTextField() {
        thirdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            thirdTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            thirdTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            thirdTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    func constraintsForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForImageView()
        constraintsForFirstTextField()
        constraintsForSecondTextField()
        constraintsForThirdTextField()
    }

    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(firstTextField)
        self.addSubview(secondTextField)
        self.addSubview(thirdTextField)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        createConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


