//
//  NetworkServiceProtocol.swift
//  Catwiki
//
//  Created by  Mr.Ki on 04.08.2022.
//

import Foundation

protocol NetworkServiceProtocol {

    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, NetworkError>) -> Void)

}
