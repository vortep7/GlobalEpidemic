import Foundation

protocol InfectionService {
    func createInfectionArray(_ indexPath: IndexPath,_ infectionFactor: Int?) -> [Int]
}

class InfectionManager: InfectionService {
    
    //MARK: - singleton
    static let shared = InfectionManager()
    private init() {}
    
    func createInfectionArray(_ indexPath: IndexPath,_ infectionFactor: Int?) -> [Int]{
        var neighboringIndices: [Int] = []
        
        for number in [-1, 1, 5, -5, -6, 6, -4, 4] {
            neighboringIndices.append(indexPath.row + number)
        }
        
        let randomNumber = Int.random(in: 1...infectionFactor!)
        let shuffledIndices = neighboringIndices.shuffled()
        let subNeighboringIndices = Array(shuffledIndices.prefix(randomNumber))
        
        return subNeighboringIndices
    }
}
