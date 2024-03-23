//
//  InfoView.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 21.03.2024.
//

import UIKit

final class InfoView: UIView {

    //MARK: - create UI elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bluePicture")
        return imageView
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "PIXY", size: 40)
        label.text = "Game rules"
        label.textColor = .black
        
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 3.0
        label.layer.shadowOpacity = 1.0
        
        return label
    }()
    
    
    //MARK: - constraints
    func constraintsForInfoLabel() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            infoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -650),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
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
        constraintsForInfoLabel()
    }

    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(infoLabel)
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
