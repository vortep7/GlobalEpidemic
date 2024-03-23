//
//  GeneralView.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 21.03.2024.
//
import UIKit
import Foundation

final class GeneralView:UIView {
    
    //MARK: - create UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "green")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        return progressView
    }()
    
    private let positiveLabel: UILabel = {
        let label = UILabel()
        label.text = TextForLabel.positiveText.rawValue
        label.font = UIFont(name: "PIXY", size: 30)
        return label
    }()
    
    
    private let negativeLabel: UILabel = {
        let label = UILabel()
        label.text = TextForLabel.negativeText.rawValue
        label.font = UIFont(name: "PIXY", size: 30)
        return label
    }()
    
    let positiveAmount: UILabel = {
        let label = UILabel()
        label.textColor = .positiveAmount
        label.font = UIFont(name: "PIXY", size: 27)
        return label
    }()
    
    
    let negativeAmount: UILabel = {
        let label = UILabel()
        label.textColor = .negativeAmount
        label.font = UIFont(name: "PIXY", size: 27)
        return label
    }()
    
    var collectionView:UICollectionView
    
    //MARK: - constraints
    func constraintsForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    func constraintsForPositiveLabel() {
        positiveLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            positiveLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            positiveLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -650),
            positiveLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            positiveLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100)
        ])
    }
    
    func constraintsForNegativeLabel() {
        negativeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            negativeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            negativeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -650),
            negativeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 280),
            negativeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50)
        ])
    }
    
    func constraintsForPositiveAmount() {
        positiveAmount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            positiveAmount.topAnchor.constraint(equalTo: self.topAnchor, constant: 140),
            positiveAmount.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -620),
            positiveAmount.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            positiveAmount.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100)
        ])
    }
    
    func constraintsForNegativeAmount() {
        negativeAmount.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            negativeAmount.topAnchor.constraint(equalTo: self.topAnchor, constant: 140),
            negativeAmount.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -620),
            negativeAmount.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 300),
            negativeAmount.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    func constraintsForCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 230),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -20),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20)
        ])
    }
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForImageView()
        constraintsForCollectionView()
        constraintsForPositiveLabel()
        constraintsForNegativeLabel()
        constraintsForPositiveAmount()
        constraintsForNegativeAmount()
    }

    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(collectionView)
        self.addSubview(positiveLabel)
        self.addSubview(negativeLabel)
        self.addSubview(positiveAmount)
        self.addSubview(negativeAmount)
    }
    
    override init(frame: CGRect) {
        let layout = GeneralView.setupLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.layer.cornerRadius = 12
        super.init(frame: frame)
        
        let pinchGesture = UIPinchGestureRecognizer(target:self, action: #selector(handlePinchGesture(_:)))
        collectionView.addGestureRecognizer(pinchGesture)
        
        setupView()
        createConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - collection view layout
    private static func setupLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 70)
        layout.minimumLineSpacing = 50
        layout.sectionInset = UIEdgeInsets(top: 30, left: 30, bottom: 10, right: 30)
        return layout
    }
}

//MARK: - gesture handler
extension GeneralView {
    @objc func handlePinchGesture(_ gestureRecognizer: UIPinchGestureRecognizer) {
        guard let collectionView = gestureRecognizer.view as? UICollectionView else { return }
        
        switch gestureRecognizer.state {
        case .began, .changed:
            let scale = gestureRecognizer.scale
            let currentTransform = collectionView.transform
            collectionView.transform = currentTransform.scaledBy(x: scale, y: scale)
            gestureRecognizer.scale = 1.0
        case .ended, .cancelled:
            UIView.animate(withDuration: 0.3) {
                collectionView.transform = .identity
            }
        default:
            break
        }
    }
}

enum TextForLabel:String {
    case positiveText = "Healthy:"
    case negativeText = "ill:"
    case positiveAmount = "1"
    case negativeAmount = "2"
    case nothing = "0"
}
