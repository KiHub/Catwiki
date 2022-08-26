//
//  NetworkService.swift
//  Catwiki
//
//  Created by  Mr.Ki on 03.08.2022.
//

import Foundation

struct NetworkService: NetworkServiceProtocol {
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        guard let url = url else {
            let error = NetworkError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, responce, error in
            
            if let error = error as? URLError {
                completion(Result.failure(NetworkError.url(error)))
            } else if let response = responce as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(NetworkError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(NetworkError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
}

