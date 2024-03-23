//
//  CellModel.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 22.03.2024.
//
import UIKit
import Foundation

struct Person {
    var describe:String
    var image: String
}

struct Source {
    let networkManager: NetworkService?
    
    init(networkManager: NetworkService) {
        self.networkManager = networkManager
    }
    
    func createArray(count:Int) -> [Person] {
        
        var people = [Person]()
        for _ in 0..<count {
            let person = Person(describe: describeArray.randomElement()!,
                                image: imageArray.randomElement()!)
            people.append(person)
        }
        return people
    }
    
    private let imageArray = ["firstMan", "firstGirl", "thirdGirl"]
    private let describeArray = ["Doctor", "Student", "Teacher"]

}

