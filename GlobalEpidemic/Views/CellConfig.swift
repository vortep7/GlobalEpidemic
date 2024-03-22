//
//  CellConfig.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 22.03.2024.
//

import UIKit

class CellConfig: UICollectionViewCell {
    
    //MARK: - create UI elements
    var name: UILabel = {
        let name = UILabel()
        return name
    }()
    
    var describe: UILabel = {
        let describe = UILabel()
        return describe
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    //MARK: - constraints for cell elements
    func setupCell() {
        name.translatesAutoresizingMaskIntoConstraints = false
        describe.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(name)
        self.contentView.addSubview(describe)
        self.contentView.addSubview(imageView)

        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 1),
            name.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 1),
            name.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 1),
            name.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 1),
            
            describe.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 1),
            describe.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 1),
            describe.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 1),
            describe.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 1),
            
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 1),
            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 1),
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 1),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 1),

        ])
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
