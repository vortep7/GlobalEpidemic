//
//  GeneralView.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 21.03.2024.
//
import UIKit
import Foundation

class GeneralView:UIView {
    
    //MARK: - create UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bluePicture")
        return imageView
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
    
    func constraintsForCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -20),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20)
        ])
    }
    
    //MARK: - setup all constraints
    func createConstraints() {
        constraintsForImageView()
        constraintsForCollectionView()
    }

    
    //MARK: - setup all views
    func setupView() {
        self.addSubview(imageView)
        self.addSubview(collectionView)
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
        layout.sectionInset = UIEdgeInsets(top: 20, left: 30, bottom: 10, right: 30)
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
