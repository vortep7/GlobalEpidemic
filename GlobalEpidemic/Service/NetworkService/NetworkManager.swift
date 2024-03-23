//
//  NetworkManager.swift
//  GlobalEpidemic
//
//  Created by Андрей Петров on 23.03.2024.
//

import Foundation

protocol NetworkService {
    func fetchData(completion: @escaping (Result<Users, Error>) -> ())
}

class NetworkManager {
    public static let shared = NetworkManager()
    private init() {}
    private let decoder = JSONDecoder()
}

extension NetworkManager:NetworkService {
    
    private func generateURL() -> URL? {
        return URL(string: "https://randomuser.me/api")
    }
    
    func fetchData(completion: @escaping (Result<Users, Error>) -> ()) {
        guard let url = generateURL() else {
            completion(.failure(NetworkErrors.badUrl))
            return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(NetworkErrors.invalidData))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let userData = try decoder.decode(Users.self, from: data)
                completion(.success(userData))
            } catch {
                completion(.failure(NetworkErrors.invalidData))
            }
        }.resume()
    }
    
}
