//
//  User.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 23.03.2024.
//

import Foundation

struct Users: Decodable {
    let results: [User]
    
    struct User: Decodable {
        var gender: String
        var name: Name
        
        struct Name: Decodable {
            var title: String 
            var first: String
            var last: String
        }
    }
}
