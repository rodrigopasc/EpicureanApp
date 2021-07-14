//
//  BaseAPIModel.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 07/07/2021.
//

import Foundation

class BaseAPI {
    private let urlSession = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        
        return jsonDecoder
    }()
    
    enum APIServiceError: Error {
        case apiError
        case invalidEndpoint
        case invalidResponse
        case noData
        case decodeError
    }
    
    func fetchResources<T: Decodable>(url: URL, completion: @escaping (Result<T, APIServiceError>) -> Void) {
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
     
        urlSession.dataTask(with: url) { (result) in
            switch result {
                case .success(let (response, data)):
                    guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                        completion(.failure(.invalidResponse))
                        return
                    }
                    
                    do {
                        let values = try self.jsonDecoder.decode(T.self, from: data)
                        completion(.success(values))
                    } catch {
                        completion(.failure(.decodeError))
                    }
                case .failure(let error):
                    print(error)
                    completion(.failure(.apiError))
                }
         }.resume()
    }
}
