import UIKit

class GeneralViewController: UIViewController {
    private var generalView: GeneralView {return self.view as! GeneralView}
    
    var groupSize:Int?
    var infectionFactor:Int?
    var recalculation:Int?
    let networkManager = NetworkManager.shared
    private var cellStates = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        generalView.collectionView.dataSource = self
        generalView.collectionView.delegate = self
                
        cellStates = Array(repeating: false, count: groupSize ?? 0)

        generalView.collectionView.register(CellConfig.self, forCellWithReuseIdentifier: "\(CellConfig.self)")
    }
    
    override func loadView() {
        self.view = GeneralView(frame: UIScreen.main.bounds)
        
        generalView.positiveAmount.text = "\(self.groupSize!)"
        generalView.negativeAmount.text = "\(cellStates.filter {$0}.count)"
        generalView.percentageOfInfected.text = "\(cellStates.filter {$0}.count)% of infected"
    }
}

//MARK: - change cell image
extension GeneralViewController {
    
    func changeImage(_ indexPath: IndexPath) {
        cellStates[indexPath.row] = true
        generalView.collectionView.reloadItems(at: [indexPath])
        spreadInfection(from: indexPath)
    }
    
    func spreadInfection(from indexPath: IndexPath) {
        var epidemicArray: [Int] = []
        let countTrue = cellStates.filter {$0}.count
        let time = self.recalculation!
        let newRandomArray = InfectionManager.shared.createInfectionArray(indexPath, self.infectionFactor)
                
        if countTrue == 1 {
            self.generalView.positiveAmount.text = "\(self.cellStates.count - newRandomArray.count)"
            self.generalView.negativeAmount.text = "\(newRandomArray.count + 1)"
            self.generalView.percentageOfInfected.text = "\(newRandomArray.count + 1)"
        }
        let dispatchGroup = DispatchGroup() // Создаем группу диспетчеризации

        for index in newRandomArray {
            if index >= 0 && index < groupSize ?? 0 && !cellStates[index] {
                epidemicArray.append(index)
                cellStates[index] = true
                DispatchQueue.global(qos: .userInteractive).async { [weak self] in
                    guard let self = self else { return }
                    let countFalse = self.cellStates.filter {!$0}.count
                    let percentageInfected = Double(self.cellStates.count - countFalse) / Double(self.cellStates.count) * 100
                    
                    DispatchQueue.main.async {
                        self.generalView.positiveAmount.text = "\(countFalse)"
                        self.generalView.negativeAmount.text = "\(self.cellStates.count - countFalse)"
                        self.generalView.percentageOfInfected.text = "\(Int(percentageInfected))% of infected"

                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
                    self.spreadInfection(from: IndexPath(row: index, section: 0))
                }
            }
        }
        generalView.collectionView.reloadItems(at: epidemicArray.map { IndexPath(row: $0, section: 0) })
    }

}

//MARK: - implement delegate protocol
extension GeneralViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        changeImage(indexPath)
    }
}

//MARK: - implement data source protocol
extension GeneralViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupSize!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CellConfig.self)", for: indexPath) as! CellConfig
        
        DispatchQueue.global(qos: .userInteractive).async {
            let myArray = Source(networkManager: self.networkManager).createArray(count: self.groupSize!)
            
            DispatchQueue.main.async {
                cell.describe.text = myArray[indexPath.item].describe
                
                //MARK: - check cellState and change cell image
                cell.imageView.image = self.cellStates[indexPath.item] ? UIImage(named: "old") : UIImage(named: myArray[indexPath.item].image)
                cell.imageView.contentMode = .scaleAspectFill
            }
        }
        return cell
    }
}

