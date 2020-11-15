//
//  GetService.swift
//  iOSPractice
//
//  Created by Sang Choi on 11/15/20.
//

import Foundation

protocol GetService: AnyObject {
    associatedtype ModelType
    func call(withCompletion completion: @escaping (ModelType?) -> Void)
    func decode(_ data: Data) -> ModelType?
}

extension GetService {
    fileprivate func call(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                // TODO: Error handling
                print(error)
                completion(nil)
                return
            }
            if let res = response as? HTTPURLResponse {
                // TODO: Response status parsing
                print("Status Code: \(res.statusCode)")
            }
            completion(self.decode(data))
        })
        task.resume()
    }
}

class APIGet<Resource: APIResource> {
    let resource: Resource
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIGet: GetService {
    func call(withCompletion completion: @escaping ([Resource.ModelType]?) -> Void) {
        call(resource.url, withCompletion: completion)
    }
    func decode(_ data: Data) -> [Resource.ModelType]? {
        // TODO: Conform to multiple JSON data structures, currently only deals with array of ModelType objects
        let decodedData = try? JSONDecoder().decode([Resource.ModelType].self, from: data)
//        let wrapper = try? JSONDecoder().decode(Wrapper<Resource.ModelType>.self, from: data)
        return decodedData
    }
}
