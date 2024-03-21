//
//  MenuView.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 21.03.2024.
//

import Lottie
import UIKit

class MenuView: UIView {
    
    //MARK: - create Lottie Animation
    private let bigAnimationView:LottieAnimationView = {
        let animationView = LottieAnimationView(name: "NewAnimation")
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    private let miniAnimationView:LottieAnimationView = {
        let animationView = LottieAnimationView(name: "Virus")
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    //MARK: - create UI elements
    private let logButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .logButtonColour
        button.tintColor = .white
        button.setTitle("Click to logIn", for: .normal)
        button.titleLabel?.font = UIFont(name: "PIXY", size: 30)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    private let infoButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .logButtonColour
        button.tintColor = .white
        button.setTitle("More Info", for: .normal)
        button.titleLabel?.font = UIFont(name: "PIXY", size: 30)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    private let localButton:UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .localButtonColour
        button.tintColor = .white
        button.setTitle("Language", for: .normal)
        button.titleLabel?.font = UIFont(name: "PIXY", size: 16)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 5
        
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PIXY", size: 38)
        label.text = "Global Epidemic"
        label.textColor = .white
        
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 5.0
        label.layer.shadowOpacity = 1.0
        return label
    }()
    //MARK: - clousers for buttons action
    
    
    //MARK: - constraints
    func constraintsForBigAnimation() {
        bigAnimationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bigAnimationView.topAnchor.constraint(equalTo: self.topAnchor, constant: 250),
            bigAnimationView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -400),
            bigAnimationView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            bigAnimationView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func constraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 180),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func constraintsForMiniAnimation() {
        miniAnimationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            miniAnimationView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            miniAnimationView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -690),
            miniAnimationView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            miniAnimationView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -220)
        ])
    }
    
    func constraintsForLogButton() {
        logButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 540),
            logButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -230),
            logButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            logButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func constraintsForInfoButton() {
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 660),
            infoButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -110),
            infoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    func constraintsForLocalButton() {
        localButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            localButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            localButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -750),
            localButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 270),
            localButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
    
    func createConstraints() {
        constraintsForBigAnimation()
        constraintsForMiniAnimation()
        constraintsForLogButton()
        constraintsForLabel()
        constraintsForInfoButton()
        constraintsForLocalButton()
    }
    
    func setupView() {
        self.addSubview(bigAnimationView)
        self.addSubview(miniAnimationView)
        self.addSubview(logButton)
        self.addSubview(label)
        self.addSubview(infoButton)
        self.addSubview(localButton)
    }
    
    func setupAnimations() {
        bigAnimationView.loopMode = .loop
        bigAnimationView.play()
        
        miniAnimationView.loopMode = .loop
        miniAnimationView.play()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        createConstraints()
        setupAnimations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
