//
//  URLSessionExtension.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 22/06/2021.
//

import Foundation

enum Result<Success, Error: Swift.Error> {
    case success(Success)
    case failure(Error)
}

extension Result {
    func get() throws -> Success {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}

extension Result where Success == Data {
    func decoded<T: Decodable>(using decoder: JSONDecoder = .init()) throws -> T {
        let data = try get()
        return try decoder.decode(T.self, from: data)
    }
}
