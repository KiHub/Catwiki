//
//  NetworkError.swift
//  Catwiki
//
//  Created by  Mr.Ki on 03.08.2022.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        //message for users
        switch self {
        case .badURL:
            return "Sorry, something wrong"
        case .badResponse(_):
            return "Sorry, connection to our server is failed "
        case .url(let error):
            return error.localizedDescription
        case .parsing:
            return "Sorry, something wrong"
        case .unknown:
            return "Sorry, something wrong"
        }
    }
    var description: String {
        //message for coder
        switch self {
        case .badURL:
            return "URL error"
        case .badResponse(statusCode: let statusCode):
           return "bad responce: \(statusCode)"
        case .url(let error):
            return error.localizedDescription
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "")"
        case .unknown:
            return "unknown error"
        }
    }
}
