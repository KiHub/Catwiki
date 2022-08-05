//
//  NetworkMockService.swift
//  Catwiki
//
//  Created by  Mr.Ki on 04.08.2022.
//

import Foundation

struct NetworkMockService: NetworkServiceProtocol {
    
    func fetch<T>(_ type: T.Type, url: URL?, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
      
    }
    
    
    

    
    
}
