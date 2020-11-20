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
    var basePath: String { get }
    var identifier: String? { get }
    var queries: [URLQuery]? { get }
    var payload: ModelType? { get }
}

// Define URL
extension APIResource {
    var url: URL {
        var fullPath = basePath
        // Append dynamic identifier to the base path (e.g. {basePath}/USER1234)
        if let identifier = identifier {
            fullPath += identifier
        }
        var components = URLComponents(string: fullPath)!
        // Append URL query strings to components if queries parameter has been set
        if let queryItems = queries {
            components.queryItems = queryItems.map { URLQueryItem(name: $0.name, value: $0.value) }
        }
        // Returns full path URL of an API endpoint
        return components.url!
    }
}

// Define optional properties
extension APIResource {
    var queries: [URLQuery]? { return nil }
    var identifier: String? { return nil }
    var payload: ModelType? { return nil }
}
