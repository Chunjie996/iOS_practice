//
//  APIResource.swift
//  iOSPractice
//
//  Created by Sang Choi on 11/15/20.
//

import Foundation

struct URLQuery {
    let name: String
    let value: String
}

// MARK: - APIResource

// Defines APIResource protocol which should be constructed when calling an API endpoint
protocol APIResource {
    associatedtype ModelType: Codable
    var path: String { get }
    var queries: [URLQuery]? { get }
}

extension APIResource {
    var queries: [URLQuery]? { get { return nil } } // Set default value of queries to nil
    var url: URL {
        var components = URLComponents(string: path)!
        // Append URL query strings to components if queries parameter has been set
        if let queryItems = queries {
            components.queryItems = queryItems.map { URLQueryItem(name: $0.name, value: $0.value) }
        }
        // Returns full path URL of an API endpoint
        return components.url!
    }
}
