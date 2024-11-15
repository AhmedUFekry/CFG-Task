//
//  NetworkService.swift
//  Nearby Places
//
//  Created by A7med Fekry on 15/11/2024.
//

import Foundation
protocol MovieService {
    static func fetchResult<T : Decodable>(urll: String , complitionHandler: @escaping (T?) -> Void)
}

class NetworkService : MovieService{
    static func fetchResult<T : Decodable>(urll: String , complitionHandler: @escaping (T?) -> Void) {
        let url = URL(string: urll)
        guard let newURL = url else{
            return
        }
        let request = URLRequest(url: newURL)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                return
            }
            do{
                let result = try JSONDecoder().decode(T.self, from: data)
                complitionHandler(result)
            }catch let error{
                print(error.localizedDescription)
                complitionHandler(nil)
            }
        }
        task.resume()
    }
}
