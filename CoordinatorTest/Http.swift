//
//  Http.swift
//  CoordinatorTest
//
//  Created by Marcos Barbosa on 14/03/21.
//

import Foundation

class HttpRequest {
    
    static func get(url: String, completion: @escaping(Result<HomeEntity?, Error>) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                completion(.failure(GenericError(error: "Error here")))
            }
            
            let decoder = JSONDecoder()
            
            if let data = data {
                do {
                    let response = try decoder.decode(HomeEntity.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(GenericError(error: "Error here")))
                }
            }
        }.resume()
    }
}

class GenericError: Error {
    var error: String
    
    init(error: String) {
        self.error = error
    }
}
