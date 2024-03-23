//
//  ConfigView.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 21.03.2024.
//

import UIKit

final class ConfigView: UIView {
    //MARK: create UI elements
    var onActionButton: (() ->Void)?
    
    //MARK: - create UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "minimal")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .localButtonColour
        button.tintColor = .white
        button.setTitle("Run the simulation", for: .normal)
        button.titleLabel?.font = UIFont(name: "PIXY", size: 30)
        button.titleLabel?.numberOfLines = 2
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        return button
    }()
    
    let alert: UIAlertController = {
        let alert = UIAlertController(title: "More 200 people", message: "Less amount", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addAction(alertAction)
        return alert
    }()
    
    let alertSecond: UIAlertController = {
        let alert = UIAlertController(title: "Only digit", message: "Repeat", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(alertAction)
        return alert
    }()
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "PIXY", size: 31)
        label.text = "Enter the parameters"
        label.textColor = .white
  
        return label
    }()
    
    let firstTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.placeholder = TextForTextField.firstText.rawValue
        return textField
    }()
    
    let secondTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.placeholder = TextForTextField.secondText.rawValue
        return textField
    }()
    
    let thirdTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.placeholder = TextForTextField.thirdText.rawValue
        return textField
    }()
    
    //MARK: - constraints
    func constraintsForFirstTextField() {
        firstTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 215),
            firstTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -580),
            firstTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            firstTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func constraintsForSecondTextField() {
        secondTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondTextField.topAnchor.constraint(equalTo: firstTextField.bottomAnchor, constant: 20),
            secondTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -500),
            secondTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            secondTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func constraintsForThirdTextField() {
        thirdTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdTextField.topAnchor.constraint(equalTo: secondTextField.bottomAnchor, constant: 20),
            thirdTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -420),
            thirdTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            thirdTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
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
    
    func constraintsForFirstLabel() {
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            firstLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -670),
            firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            firstLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    func constraintsForButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 550),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }
    
    func addTargets() {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForImageView()
        constraintsForFirstTextField()
        constraintsForSecondTextField()
        constraintsForThirdTextField()
        constraintsForFirstLabel()
        constraintsForButton()
    }

    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(firstTextField)
        self.addSubview(secondTextField)
        self.addSubview(thirdTextField)
        self.addSubview(firstLabel)
        self.addSubview(button)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        createConstraints()
        addTargets()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

enum TextForTextField:String  {
    case firstText = " Group Size (max: 2000)"
    case secondText = " Infection Factor (max: 6)"
    case thirdText = " Recalculation"
}

extension ConfigView {
    @objc func buttonAction() {
        onActionButton?()
    }
}
