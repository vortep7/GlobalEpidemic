//
//  GeneralViewController.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 21.03.2024.
//

import UIKit

class GeneralViewController: UIViewController {
    var generalView: GeneralView {return self.view as! GeneralView}
    var count = 0
    
    var groupSize:Int?
    var infectionFactor:Int?
    var Recalculation:Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        generalView.collectionView.dataSource = self
        generalView.collectionView.delegate = self
        
        generalView.collectionView.register(CellConfig.self, forCellWithReuseIdentifier: "\(CellConfig.self)")
    }
    
    override func loadView() {
        self.view = GeneralView(frame: UIScreen.main.bounds)
        generalView.positiveAmount.text = "\(self.groupSize!)"
        generalView.negativeAmount.text = "\(self.count)"
    }
}

//MARK: - implement delegate protocol
extension GeneralViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CellConfig
        cell.imageView.image = UIImage(named: "old")
        
        self.count += 1
        
        generalView.positiveAmount.text = "\(self.groupSize! - count)"
        generalView.negativeAmount.text = "\(self.count)"
    }
}

//MARK: - implement data source protocol
extension GeneralViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupSize!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CellConfig.self)", for: indexPath) as! CellConfig
        
        let myArray = Source.shared.createArray(count: groupSize!)
        
        //MARK: - setup view for cell
        cell.describe.text = myArray[indexPath.item].describe
        cell.imageView.image = UIImage(named: myArray[indexPath.item].image)
        cell.imageView.contentMode = .scaleAspectFill
        
        return cell
    }
}
