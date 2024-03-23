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
    static let shared = Source()
    private init() {}
    
    func createArray(count:Int) -> [Person] {
        var people = [Person]()
        for _ in 0..<count {
            let person = Person(describe: describeArray.randomElement()!,
                                image: imageArray.randomElement()!)
            people.append(person)
        }
        return people
    }
    
    private let describeArray = ["Doctor","Engineer","Lawyer","Teacher","Artist"]
    private let imageArray = ["firstMan","firstGirl","thirdGirl"]
}

