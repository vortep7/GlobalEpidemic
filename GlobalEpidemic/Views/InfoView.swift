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
        imageView.image = UIImage(named: "newEarth")
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
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "PIXY", size: 22)
        textView.textColor = .black
        textView.text = SpecialText.firstText.rawValue
        textView.backgroundColor = .clear
        return textView
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
    
    func constraintsForTextField() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForImageView()
        constraintsForInfoLabel()
        constraintsForTextField()
    }

    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(infoLabel)
        self.addSubview(textView)
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

enum SpecialText: String {
    case firstText = """
    Selection of parameters:
    Before starting the simulation, the player must select values for each of the parameters:
    The number of people in the simulated group (Group Size).
    The number of people who can be infected by one person through contact (InfectionFactor).
    The period of recalculation of the number of infected people (T).
    Starting the simulation:
    After selecting all the parameters, the player must click the "Start simulation" button to start the simulation process.
    Tracking infections:
    During the simulation, the player must keep track of the number of infected people in the group.
    """
}
